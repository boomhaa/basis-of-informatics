;;4.factorize

(define (factorize expression)
  (cond
    
     ((and (equal? (car expression) '-) (equal? (caddr (cadr expression)) 2))
      (list '* (list '- (cadr (cadr expression)) (cadr (caddr expression)))
            (list '+ (cadr (cadr expression)) (cadr (caddr expression)))))
     ((and (equal? (car expression) '-) (equal? (caddr (cadr expression)) 3))
      (list '*
            (list '- (cadr (cadr expression)) (cadr (caddr expression)))
            (list '+ '(expt, (cadr (cadr expression)) 2)
                  (list '* (cadr (cadr expression))
                        (cadr (caddr expression))) '(expt, (caddr (cadr expression)) 2))))
     ((and (equal? (car expression) '+) (equal? (caddr (cadr expression)) 3))
      (list '*
            (list '+ (cadr (cadr expression)) (cadr (caddr expression)))
            (list '+ '(expt, (cadr (cadr expression)) 2)
                  (list '-
                        (list '* (cadr (cadr expression))
                              (cadr (caddr expression)))) '(expt, (caddr (cadr expression)) 2))))
     (else expression))
  )