(define (derivative func)
  (if (not (list? func))
      (derivative (list func))
      (cond
        ((< (length func) 2) (elementary (car func)))
        ((equal? (car func) '*)
         (if (< (length func) 4)
             (cond
               ((number? (cadr func))
                (list '* (cadr func) (derivative (caddr func))))
               ((number? (caddr func))
                (list '* (derivative (cadr func))  (caddr func)))
             (else
              (list '+ (list '* (derivative (cadr func)) (caddr func))
                    (list '* (cadr func) (derivative (caddr func))))))
            (list '+ (list '* (derivative (cadr func)) (append (list '*) (cddr func)))
                                      (list '* (cadr func) (derivative (append (list '*) (cddr func)))))))
        ((equal? (car func) '/) (list '/ (list '- (list '* (derivative (cadr func)) (caddr func))
                                               (list '* (cadr func)
                                                     (derivative(caddr func)))) (list 'expt (caddr func) 2)))
        ((not(null? (get-sign func))) (if (null? (cddr func))
                                      (list (get-sign func) (derivative (cadr func)))
                                      (list (get-sign func)
                                            (derivative (cadr func))(derivative (caddr func)))))
        ((and (equal? (car func) 'expt) (equal?  (cadr func) 'x))
         (list '* (caddr func) (list (car func) (cadr func) (- (caddr func) 1))))
        ((and (equal? (car func) 'expt) (number? (cadr func))) (list '* func (list 'log (cadr func))))
        ((equal? (car func) 'cos) (list '* (list '- (list 'sin (cadr func))) (derivative (cadr func))))
        ((equal? (car func) 'sin) (list '* (list 'cos (cadr func)) (derivative (cadr func))))
        ((equal? (car func) 'exp) (list '* (list 'exp (cadr func)) (derivative (cadr func))))
        ((equal? (car func) 'log) (list '/ (derivative (cadr func)) (cadr func)))
        )))

(define (get-sign func)
  (cond
    ((equal? (car func) '-) '-)
    ((equal? (car func) '+) '+)
    (else '())))

(define (elementary func)
  (cond
    ((number? func) 0)
    ((equal? func 'x)1)
    ((equal? func '-x)-1)))


