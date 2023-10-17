(define-syntax trace
  (syntax-rules ()
    ((trace-ex action)
     (let ((x action))
       (begin
       (display (quote action))
       (display " => ")
       (display x)
       (display "\n"))
       x
       )
     )
    )
  )