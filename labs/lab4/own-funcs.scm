(define-syntax when
  (syntax-rules ()
              ((when cond? expr ...)
               (if cond?
                   (begin expr ...)))))

(define-syntax unless
  (syntax-rules ()
     ((unless cond? expr ...)
      (if (not cond?)
          (begin expr ...)))))

(define-syntax for
  (syntax-rules (in as)
    ((for i in xs expr ...)
     (let loop ((x xs))
       (if (not (null? x))
           (let ((i (car x)))
             expr ...
             (loop (cdr x))))))
    ((for xs as i expr ...)
     (for i in xs expr ...))))


(define-syntax while
  (syntax-rules ()
    ((while cond? expr ...)
     (let loop ()
       (if cond? (begin expr ... (loop)))))))

(define-syntax repeat
  (syntax-rules (until)
    ((repeat (expr ...) until cond?)
     (let loop ()
       (begin expr ... (if (not cond?) (loop)))))))


(define-syntax cout
  (syntax-rules (<< endl)
    ((cout << endl)
     (newline))
    ((cout << endl . expr)
     (begin (newline)
            (cout . expr)))
    ((cout << expr1)
     (display expr1))
    ((cout << expr1 . expr)
     (begin (display expr1)
            (cout . expr)))))


     