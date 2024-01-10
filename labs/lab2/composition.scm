(define (o . args)
  (if (null? args)
      (lambda (x) x)
      (lambda (x) ((car args) ((apply o (cdr args)) x)))))
