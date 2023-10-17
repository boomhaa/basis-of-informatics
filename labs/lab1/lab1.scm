(define (my-even? n) ( and (= (remainder n 2) 0) #t))
(define (my-odd? n) ( and (= (remainder n 2) 1) #t))

(define (power x y)
(if (<= y 0) 1 (* x (power x (- y 1)))
  ))

