(load "symmetric-difference.scm")

(define (set-eq? xs ys)
  (if (= (length (symmetric-difference xs ys)) 0)
      #t
      #f))
