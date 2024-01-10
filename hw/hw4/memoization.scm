(define (memoized-factorial n)
  (let loop ((n n) (hash '()) (res 1) (start 1))
    (if (< n start)
        res
        (if (assoc start hash)
            (loop n dict (* res (cadr (assoc n hash))) n)
            (loop n (cons (list start (* res start)) hash )(* res start) (+ start 1))))))