(define (my-flatten xs)
  (if (list? xs)
      (if (= (length xs) 1)
          (my-flatten (car xs))
          (append (my-flatten (car xs)) (my-flatten (cdr xs))))
      (list xs)))

;сложность данной функции зависит от вложенности списка.
;в худшем случае сложность может быть экспоненциальной, а в лучшем линейной