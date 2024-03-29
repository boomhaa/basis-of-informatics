(define (find-word word index program)
  (if (equal? word (vector-ref program index))
      index
      (find-word word (+ index 1) program)))

(define (contains? stack sign)
  (and (not (null? stack)) (or (equal? sign (car stack)) (contains? (cdr stack) sign))))

(define (interpret program init-stack)
  (let interpretator ((index 0) (stack init-stack)(return-stack '()) (def-stack '()) (for-stack '()))
    (if (= index (vector-length program))
        stack
        (let ((word (vector-ref program index)))
          (cond
            ((number? word)(interpretator (+ index 1)
                                          (cons word stack) return-stack def-stack for-stack))
            ((equal? word '+)(interpretator (+ index 1)
                                            (cons (+ (cadr stack) (car stack)) (cddr stack))
                                            return-stack def-stack for-stack))
            ((equal? word '-)(interpretator (+ index 1)
                                            (cons (- (cadr stack) (car stack)) (cddr stack))
                                            return-stack def-stack for-stack))
            ((equal? word '/)(interpretator (+ index 1)
                                            (cons (quotient (cadr stack) (car stack)) (cddr stack))
                                            return-stack def-stack for-stack))
            ((equal? word '*)(interpretator (+ index 1)
                                            (cons (* (cadr stack) (car stack)) (cddr stack))
                                            return-stack def-stack for-stack))
            ((equal? word 'mod)(interpretator (+ index 1)
                                              (cons (remainder (cadr stack) (car stack)) (cddr stack))
                                              return-stack def-stack for-stack))
            ((equal? word '<)(interpretator (+ index 1)
                                            (cons (if (< (cadr stack) (car stack)) -1 0) (cddr stack))
                                            return-stack def-stack for-stack))
            ((equal? word '>)(interpretator (+ index 1)
                                            (cons (if (> (cadr stack) (car stack)) -1 0) (cddr stack))
                                            return-stack def-stack for-stack))
            ((equal? word '=)(interpretator (+ index 1)
                                            (cons (if (= (cadr stack) (car stack)) -1 0) (cddr stack))
                                            return-stack def-stack for-stack))
            ((equal? word 'and)
             (interpretator (+ index 1)
                            (cons (if (or (= (car stack) 0) (= (cadr stack) 0)) 0 -1) (cddr stack))
                            return-stack def-stack for-stack))
            ((equal? word 'or)
             (interpretator (+ index 1)
                            (cons (if (and (= (car stack) 0) (= (cadr stack) 0)) 0 -1) (cddr stack))
                            return-stack def-stack for-stack))
            ((equal? word 'not) (interpretator (+ index 1)
                                               (cons (if (= (car stack) 0) -1 0) (cdr stack))
                                               return-stack def-stack for-stack))
            ((equal? word 'drop) (interpretator (+ index 1) (cdr stack)
                                                return-stack def-stack for-stack))
            ((equal? word 'swap) (interpretator (+ index 1)
                                                (append (list (cadr stack) (car stack)) (cddr stack))
                                                return-stack def-stack for-stack))
            ((equal? word 'dup) (interpretator (+ index 1) (cons (car stack) stack)
                                               return-stack def-stack for-stack))
            ((equal? word 'over) (interpretator (+ index 1) (cons (cadr stack) stack)
                                                return-stack def-stack for-stack))
            ((equal? word 'rot)
             (interpretator (+ index 1)
                            (append (list (caddr stack) (cadr stack) (car stack)) (cdddr stack))
                            return-stack def-stack for-stack))
            ((equal? word 'depth) (interpretator (+ index 1)
                                                 (cons (length stack) stack)
                                                 return-stack def-stack for-stack))
            ((equal? word 'neg) (interpretator (+ index 1)
                                               (cons (- (car stack)) (cdr stack))
                                               return-stack def-stack for-stack))
            ((equal? word 'define)
             (interpretator (+ (find-word 'end index program) 1) stack return-stack
                            (cons (list (vector-ref program (+ index 1)) (+ index 2)) def-stack) for-stack))
            ((contains? '(end exit) word) (interpretator (car return-stack)
                                                         stack (cdr return-stack) def-stack for-stack))
            ((equal? 'if word)
             (interpretator (if (= (car stack) 0) (+ (find-word 'endif index program))
                                (+ index 1)) (cdr stack) return-stack def-stack for-stack))
            ((equal? 'endif word) (interpretator (+ index 1) stack return-stack def-stack for-stack))
            ((equal? word 'while) (if (equal? (car stack) 0)
                                      (interpretator (+ (find-word 'wend index program) 1) (cdr stack)
                                                     return-stack def-stack for-stack)
                                      (interpretator (+ index 1) (cdr stack)
                                                     (cons index return-stack) def-stack for-stack)))
            ((equal? word 'wend) (interpretator (car return-stack) stack
                                                (cdr return-stack) def-stack for-stack))
            ((equal? word 'repeat) (interpretator (+ index 1) stack
                                                  (cons index return-stack) def-stack for-stack))
            ((equal? word 'until) (if (= (car stack) 0)
                                      (interpretator (car return-stack) (cdr stack)
                                                     (cdr return-stack) def-stack for-stack)
                                      (interpretator (+ index 1) (cdr stack)
                                                     (cdr return-stack) def-stack for-stack)))
            ((equal? word 'for)
             (interpretator (+ index 1) (cddr stack)
                            (cons index return-stack) def-stack
                            (append (list (cadr stack) (car stack) ) for-stack)))
            ((equal? word 'i)
             (interpretator (+ index 1)
                            (cons (car for-stack) stack) return-stack def-stack for-stack))
            ((equal? word 'next) (if (<= (+ (car for-stack) 1) (cadr for-stack))
                                     (interpretator (car return-stack)
                                                    (append (list (cadr for-stack)
                                                                  (+ (car for-stack) 1)) stack)
                                                    (cdr return-stack) def-stack (cddr for-stack))
                                     (interpretator (+ index 1) stack
                                                    (cdr return-stack) def-stack (cddr for-stack))))
            
            (else (interpretator (cadr (assoc word def-stack)) stack
                                 (cons (+ index 1) return-stack) def-stack for-stack)))))))
'feature-while-loop
'feature-repeat-loop
'feature-for-loop