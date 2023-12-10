(define (my-gcd a b)
  (if (= b 0)
      (abs a)
      (my-gcd (abs b) (modulo (abs a) (abs b)))))

(define (my-lcm a b)
  (/ (* (abs a) (abs b)) (my-gcd (abs a) (abs b))))

(define (prime? n)
  (define (inner_prime? n d)
    (or (or (= n d) (< n 2)) (and (not (= (modulo n d) 0)) (inner_prime? n (+ d 1)))))
  (inner_prime? n 2))