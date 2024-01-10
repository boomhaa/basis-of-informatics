(define (eval-ie func)
  (eval func (interaction-environment)))

(define (sy-or-st->st-or-sy s)
  (if (symbol? s)
      (symbol->string s)
      (string->symbol s)))

(define-syntax define-struct
  (syntax-rules ()
    ((define-struct name (namef1 ...))
     (begin
       (eval-ie (list 'define (sy-or-st->st-or-sy (string-append "make-" (sy-or-st->st-or-sy 'name)))
                      (lambda (namef1 ...)
                        (list (list 'key 'name) (list 'namef1 namef1) ...))))
       (eval-ie (list 'define (sy-or-st->st-or-sy (string-append (sy-or-st->st-or-sy 'name) "?"))
                      (lambda (x)
                        (and (list? x) (not (null? x)) (list? (car x)) (let ((src (assoc 'key x)))
                                                         (and src (equal? (cadr src) 'name)))))))
       (eval-ie (list 'define (sy-or-st->st-or-sy (string-append "set-"
                                                                 (sy-or-st->st-or-sy 'name) "-"
                                                                 (sy-or-st->st-or-sy 'namef1) "!"))
                      (lambda (x value)
                        (set-car! (cdr (assoc 'namef1 x)) value)))) ...
       (eval-ie (list 'define (sy-or-st->st-or-sy
                               (string-append (sy-or-st->st-or-sy 'name) "-" (sy-or-st->st-or-sy 'namef1)))
                      (lambda (x)
                        (cadr (assoc 'namef1 x))))) ... ))))