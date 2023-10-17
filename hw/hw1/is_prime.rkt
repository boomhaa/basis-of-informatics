(define (prime? n)
  (define (inner_prime? n d)
    (or (or (= n d) (< n 2)) (and (not (= (modulo n d) 0)) (inner_prime? n (+ d 1)))))
  (inner_prime? n 2))