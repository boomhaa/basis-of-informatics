(define (count x xs)
  (if (null? xs) 0
      (if (equal? x (car xs))
          (+ 1 (count x (cdr xs)))
          (count x (cdr xs))))
      )