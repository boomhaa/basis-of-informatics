(define (my-element? x xs)
  (and (not (null? xs)) (or (equal? (car xs) x) (my-element? x (cdr xs)))))

;O(n)