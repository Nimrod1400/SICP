(define (foreach f l)
  (cond ((null? l) '())
	(else (f (car l)) (foreach f (cdr l)))))

(define (display-list l)
  (foreach (lambda (x) (newline) (display x)) 
	   l))
