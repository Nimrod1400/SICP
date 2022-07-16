(define (A x y)
	(cond ((= y 0) 0)
		((= x 0) (* 2 y))
		((= y 1) 2)
		(else (A (- x 1)
					(A x (- y 1))))))
(define (f x) (A 0 x))
(define (g x) (A 1 x))
(define (h x) (A 2 x))

;; (f n) = 2*n
;; (g n) = 2^n
;; (h n) = 2^2^2^2^....^2 (n раз)
