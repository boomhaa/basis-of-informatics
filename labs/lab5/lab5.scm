(define ariphmetic '(+ - * / mod))
(define conditions '(< > =))

(define (my-eval expr)
  (eval expr (interaction-environment)))

(define (find-word word index program)
  (if (equal? word (vector-ref program index))
      index
      (find-word word (+ index 1) program)))

(define (contains? stack sign)
  (if (null? stack)
      #f
      (if (equal? sign (car stack))
          #t
          (contains? (cdr stack) sign))))

(define (ariph-oper oper stack)
  (if (equal? oper 'mod)
      (cons (remainder (cadr stack) (car stack)) (cddr stack))
      (cons (my-eval (list oper (cadr stack) (car stack))) (cddr stack))))

(define (cond-oper oper stack)
  (cons (if (my-eval (list oper (cadr stack) (car stack))) -1 0) (cddr stack)))

(define (interpret program init-stack)
  (let interpretator ((index 0) (stack init-stack)(return-stack '()) (def-stack '()))
    (if (= index (vector-length program))
        stack
        (let ((word (vector-ref program index)))
          (cond
            ((number? word)(interpretator (+ index 1) (cons word stack) return-stack def-stack))
            ((contains? ariphmetic word) (interpretator (+ index 1) (ariph-oper word stack) return-stack def-stack))
            ((contains? conditions word) (interpretator (+ index 1) (cond-oper word stack) return-stack def-stack))
            ((equal? word 'and) (interpretator (+ index 1) (cons (if (or (= (car stack) 0) (= (cadr stack) 0)) 0 -1) (cddr stack)) return-stack def-stack))
            ((equal? word 'or) (interpretator (+ index 1) (cons (if (and (= (car stack) 0) (= (cadr stack) 0)) 0 -1) (cddr stack)) return-stack def-stack))
            ((equal? word 'not) (interpretator (+ index 1) (cons (if (= (car stack) 0) -1 0) (cdr stack)) return-stack def-stack))
            ((equal? word 'drop) (interpretator (+ index 1) (cdr stack) return-stack def-stack))
            ((equal? word 'swap) (interpretator (+ index 1) (append (list (cadr stack) (car stack)) (cddr stack)) return-stack def-stack))
            ((equal? word 'dup) (interpretator (+ index 1) (cons (car stack) stack) return-stack def-stack))
            ((equal? word 'over) (interpretator (+ index 1) (cons (cadr stack) stack) return-stack def-stack))
            ((equal? word 'rot) (interpretator (+ index 1) (append (list (caddr stack) (cadr stack) (car stack)) (cdddr stack)) return-stack def-stack))
            ((equal? word 'depth) (interpretator (+ index 1) (cons (length stack) stack) return-stack def-stack))
            ((equal? word 'neg) (interpretator (+ index 1) (cons (- (car stack)) (cdr stack)) return-stack def-stack))
            ((equal? word 'define) (interpretator (+ (find-word 'end index program) 1) stack return-stack (cons (list (vector-ref program (+ index 1)) (+ index 2)) def-stack)))
            ((contains? '(end exit) word) (interpretator (car return-stack) stack (cdr return-stack) def-stack))
            ((equal? 'if word) (interpretator (if (= (car stack) 0) (+ (find-word 'endif index program)) (+ index 1)) (cdr stack) return-stack def-stack))
            ((equal? 'endif word) (interpretator (+ index 1) stack return-stack def-stack))
            (else (interpretator (cadr (assoc word def-stack)) stack (cons (+ index 1) return-stack) def-stack)))))))

(interpret #(   define =0? dup 0 = end
                define gcd
                    =0? if drop exit endif
                    swap over mod
                    gcd
                end
                90 99 gcd
                234 8100 gcd    ) '())