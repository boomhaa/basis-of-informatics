(load "contains.scm")

(define (list->set xs)
  (define (helper arr new-arr)
    (if (null? arr)
        new-arr
        (if (contains? (car arr) new-arr)
            (helper (cdr arr) new-arr)
            (helper (cdr arr) (cons (car arr) new-arr)))))
  (helper xs '()))
