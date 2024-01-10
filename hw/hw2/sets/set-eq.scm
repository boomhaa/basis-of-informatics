(load "symmetric-difference.scm")

(define (set-eq? xs ys)
  (= (length (symmetric-difference xs ys)) 0))
;O(n^2+m^2)