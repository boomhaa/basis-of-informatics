(define call\cc call-with-current-continuation)
(define top 1)

(define-syntax use-assertions
  (syntax-rules ()
    ((use-assertation)
     (call\cc (lambda (cc) (set! top cc))))))

(define-syntax assert
  (syntax-rules ()
    ((assert cond)
     (if (not cond)
         (begin (display "FAILED: ")
                (display(quote cond))
                (newline)
                (top))))))

