(define-syntax test
  (syntax-rules ()
    ((test action res) '(action res)))
  )

(define (run-test test)
  (display (car test))
  (define cur-res (eval (car test) (interaction-environment)))
  (if (equal? cur-res (cadr test))
      (begin 
        (display " ok\n")
        #t)
      (begin 
        (display " FAIL\n")
        (display "Expected: ")
        (write (cadr test))
        (display "\n")
        (display "Returned: ")
        (write cur-res)
        (display "\n")
        #f
        )
      )     
  )

(define (run-tests tests)
  (or (null? tests) ((lambda (x y) (and x y)) (run-test (car tests)) (run-tests (cdr tests)))))