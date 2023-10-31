(define-syntax my-if
  (syntax-rules ()
               ((my-if cond? true-expr false-expr)
                (let ((true-prom (delay true-expr)) (false-prom (delay false-expr)))
                  (force (or (and cond? true-prom) false-prom))))))

