(define (intersperse e xs)
  (if (<= (length xs) 1)
      xs
      (append (list (car xs) e) (intersperse e (cdr xs)))))