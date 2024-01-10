(define-syntax lazy-cons
  (syntax-rules ()
    ((lazy-cons a b)
     (cons a (delay b)))))

(define (lazy-car p)
  (car p))

(define (lazy-cdr p)
  (force (cdr p)))

(define (lazy-head xs k)
  (if (= k 0)
      (list)
      (cons (lazy-car xs) (lazy-head (lazy-cdr xs) (- k 1)))))

(define (lazy-ref xs k)
  (let loop ((xs xs) (k k) (n 0))
    (if (= n k)
        (lazy-car xs)
        (loop (lazy-cdr xs) k (+ n 1)))))

(define (naturals n)
  (lazy-cons n (naturals (+ n 1))))

(define (factorial)
  (let loop ((res 1) (n 2))
    (lazy-cons res (loop (* res n) (+ n 1)))))

(define (lazy-factorial n)
  (list-ref (lazy-head (factorial) n) (- n 1)))