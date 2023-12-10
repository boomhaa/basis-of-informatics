(define (str-reverse str)
  (list->string (reverse (string->list str))))

(define (string-trim-left str)
  (define (help lstr)
    (if (null? lstr)
        ""
        (if (char-whitespace? (car lstr))
            (help (cdr lstr))
            (list->string lstr))))
  (help (string->list str)))

(define (string-trim-right str)
  (str-reverse (string-trim-left (str-reverse str))))

(define (string-trim str)
  (string-trim-right (string-trim-left str)))

(define (string-prefix? pref str)
  (define (help lpref lstr)
    (if (or (null? lpref) (null? lstr))
        (null? lpref)
        (if (equal? (car lpref) (car lstr))
            (help (cdr lpref) (cdr lstr))
            #f)))
  (help (string->list pref) (string->list str)))

(define (string-suffix? suf str)
  (string-prefix? (str-reverse suf) (str-reverse str)))


(define (string-infix? podstr str)
  (or (null? (string->list podstr)) (and (not (null? (string->list str))) (or (string-prefix? podstr str)
      (string-infix? podstr
                     (list->string (cdr (string->list str))))))))


(define (delete-prefix pref str)
  (if (or (null? pref) (null? str))
      str
      (delete-prefix (cdr pref) (cdr str))))

(define (string-split str sep)
  (define (help lstr as)
    (if (null? lstr)
        (list (list->string as))
        (if (string-prefix? sep (list->string lstr))
            (cons (list->string as)
                  (help (delete-prefix  (string->list sep) lstr) '()))
            (help (cdr lstr) (append as (list (car lstr)))))))
  (help (string->list str) '()))
  