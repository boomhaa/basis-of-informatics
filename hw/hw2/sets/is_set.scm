(load "contains.scm")

(define (set? xs)
  (define (helper arr new-arr)
    (if (null? arr)
        #t
        (if (contains? (car arr) new-arr)
            #f
            (helper (cdr arr) (cons (car arr) new-arr)))))
  (helper xs '()))
