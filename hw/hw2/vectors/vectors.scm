(define (make-new-sizes sizes res)
  (if (null? (cdr sizes))
      res
      (make-new-sizes (cdr sizes) (cons (* (car sizes) (car res)) res))))

(define (make-multi-vector sizes . fill)
  (list 'multi-vector (make-new-sizes sizes '(1))
        (if (null? fill)
            (make-vector (apply * sizes) 0)
            (make-vector (apply * sizes) (car fill)))))


(define (multi-vector? m)
  (and (list? m) (equal? (car m) 'multi-vector)))      

(define (get-id sizes indices x)
  (if (null? sizes)
      x
      (get-id (cdr sizes) (cdr indices) (+ x (* (car sizes) (car indices))))))

(define (multi-vector-ref vec indices)
  (vector-ref (caddr vec) (get-id (cadr vec) indices 0)))

(define (multi-vector-set! vec indices obj)
  (vector-set! (caddr vec) (get-id (cadr vec) indices 0) obj))


