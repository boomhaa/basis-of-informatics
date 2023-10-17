(define (my-gcd a b)
  (if (= b 0)
      a
      (my-gcd b (modulo a b))))

(define (my-lcm a b)
  (/ (* a b) (my-gcd a b)))

(define (prime? n)
  (define (inner_prime? n d)
    (or (or (= n d) (< n 2)) (and (not (= (modulo n d) 0)) (inner_prime? n (+ d 1)))))
  (inner_prime? n 2))