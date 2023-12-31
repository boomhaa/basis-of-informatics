(define (delete pred? xs)
  (if (null? xs)
      (list)
      (if (pred? (car xs))
          (delete pred? (cdr xs))
          (cons (car xs) (delete pred? (cdr xs))))))