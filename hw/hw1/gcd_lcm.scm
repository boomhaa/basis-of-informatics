(define (my-gcd a b)
  (if (= b 0)
      a
      (my-gcd b (modulo a b))))

(define (my-lcm a b)
  (/ (* a b) (my-gcd a b)))