(load "contains.scm")

(define (set? xs)
  (define (helper arr new-arr)
    (or (null? arr) (and (not (contains? (car arr) new-arr)) (helper (cdr arr) (cons (car arr) new-arr))))
    )
  (helper xs '()))
;O(n^2)