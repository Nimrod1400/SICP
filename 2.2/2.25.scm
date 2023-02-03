(define first (list 1 3 (list 5 7) 9))
(define second (cons (cons 7 '()) '()))
(define third (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(define (1-get-7 l) (car (cdr (car (cddr l)))))
(define (2-get-7 l) (caar l))
(define (3-get-7 l) (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr l)))))))))))))
