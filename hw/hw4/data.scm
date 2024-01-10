(define (eval-ie func)
  (eval func (interaction-environment)))

(define (sy-or-st->st-or-sy s)
  (if (symbol? s)
      (symbol->string s)
      (string->symbol s)))

(define-syntax define-data
  (syntax-rules ()
    ((define-data data-name ((name f1 ...) ...))
     (begin
       (eval-ie (list 'define 'name
                      (lambda (f1 ...)
                        (list (list 'd-key 'data-name) (list 'f-key 'name) (list 'f1 f1) ...)))) ...
       (eval-ie (list 'define (sy-or-st->st-or-sy (string-append (sy-or-st->st-or-sy 'data-name) "?"))
                      (lambda (x)
                        (if (and (list? x) (not (null? x)))
                             (and (list? (car x))(let ((key (assoc 'd-key x)))
                               (and key (equal? (cadr key) 'data-name))))
                             #f))))))))
(define-syntax match
  (syntax-rules ()
    ((_ x ((name f1 ...) expr) ...)
       (cond
         ((equal? (cadadr x) 'name)
           (let ((f1 (cadr (assoc 'f1 x))) ...)
             expr))
          ...
          (else x)))))