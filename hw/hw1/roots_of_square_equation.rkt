(define (roots a b c)
  (if (< (- (* b b) (* 4 a c) ) 0)
      (list)
      (if (= (- (* b b) (* 4 a c) ) 0)
          (list (/ (- b) (* 2 a)))
          (list (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)) (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))
          )
      )
  )