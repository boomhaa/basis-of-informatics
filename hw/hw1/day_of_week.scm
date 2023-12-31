(define (formula d m c y)
  (modulo (+ d (floor (- (* 2.6 m) 0.2)) (- (* 2 c)) y (floor (/ y 4)) (floor (/ c 4))) 7))

(define (day-of-week d m y)
  (if (or (= m 1) (= m 2))
      (inexact->exact(formula d (+ m 10) (quotient (- y 1) 100) (modulo (- y 1) 100)))
      (inexact->exact(formula d (- m 2)(quotient y 100) (modulo y 100)))
      )
  )

(day-of-week 1 1 2023)