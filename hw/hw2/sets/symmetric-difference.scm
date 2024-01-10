(load "difference.scm")

(define (symmetric-difference xs ys)
  (append (difference xs ys) (difference ys xs)))
;O(n^2+m^2)