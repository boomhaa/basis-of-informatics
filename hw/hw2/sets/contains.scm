(define (contains? sym xs)
  (if (null? xs)
      #f
      (if (equal? (car xs) sym)
          #t
          (contains? sym (cdr xs)))))
