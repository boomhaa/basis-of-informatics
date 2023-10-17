(define (my-element? x xs)
(if (null? xs)
    #f
    (if (equal? x (car xs))
        #t
        (my-element? x (cdr xs))))
  )