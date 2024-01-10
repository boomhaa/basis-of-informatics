(define (contains? sym xs)
  (and (not (null? xs)) (or (equal? (car xs) sym) (contains? sym (cdr xs)))))

(define (difference xs ys )
  (define (helper x y diff)
    (if (null? x)
        diff
        (if (contains? (car x) y)
            (helper (cdr x) y diff)
            (helper (cdr x) y (cons (car x) diff)))))
  (helper xs ys '()))
;O(n^2)

(define (intersection xs ys)
  (define (helper x y inter)
    (if (null? y)
        inter
        (if (contains? (car y) x)
            (helper x (cdr y) (cons (car y) inter))
            (helper x (cdr y) inter))))
  (helper xs ys '()))
;O(n^2)

(define (set? xs)
  (define (helper arr new-arr)
    (or (null? arr) (and (not (contains? (car arr) new-arr)) (helper (cdr arr) (cons (car arr) new-arr))))
    )
  (helper xs '()))
;O(n^2)

(define (list->set xs)
  (define (helper arr new-arr)
    (if (null? arr)
        new-arr
        (if (contains? (car arr) new-arr)
            (helper (cdr arr) new-arr)
            (helper (cdr arr) (cons (car arr) new-arr)))))
  (helper xs '()))
;O(n^2)

(define (set-eq? xs ys)
  (= (length (symmetric-difference xs ys)) 0))
;O(n^2+m^2)


(define (symmetric-difference xs ys)
  (append (difference xs ys) (difference ys xs)))
;O(n^2+m^2)

(define (union xs ys)
  (if (null? ys)
      xs
      (if (contains? (car ys) xs)
          (union xs (cdr ys))
          (union (cons (car ys) xs) (cdr ys)))))
;O(n^2)