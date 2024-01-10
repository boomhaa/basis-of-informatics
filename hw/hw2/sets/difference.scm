(load "contains.scm")

(define (difference xs ys )
  (define (helper x y diff)
    (if (null? x)
        diff
        (if (contains? (car x) y)
            (helper (cdr x) y diff)
            (helper (cdr x) y (cons (car x) diff)))))
  (helper xs ys '()))
;O(n^2)