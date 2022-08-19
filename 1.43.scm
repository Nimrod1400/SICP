(define (compose f g)
  (lambda (x) (f (g x))))
(define (double f)
  (lambda (x) (f (f x))))
(define (repeat f n) 
  (define (iter result count)
    (cond ((= count 0) result)
	  ((even? count) (iter (double result) (/ count 2)))
	  (else (iter (compose f result) (- count 1)))))
  (iter f (- n 1)))
