(define (foreach f l)
  (cond ((null? l) '())
	else (f (car l)) (foreach f (cdr l)))))
