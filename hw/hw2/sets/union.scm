(load "contains.scm")

(define (union xs ys)
  (if (null? ys)
      xs
      (if (contains? (car ys) xs)
          (union xs (cdr ys))
          (union (cons (car ys) xs) (cdr ys)))))
;O(n^2)