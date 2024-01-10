(define (contains? sym xs)
  (and (not (null? xs)) (or (equal? (car xs) sym) (contains? sym (cdr xs)))))