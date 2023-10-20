(load "contains.scm")

(define (intersection xs ys)
  (define (helper x y inter)
    (if (null? y)
        inter
        (if (contains? (car y) x)
            (helper x (cdr y) (cons (car y) inter))
            (helper x (cdr y) inter))))
  (helper xs ys '()))
