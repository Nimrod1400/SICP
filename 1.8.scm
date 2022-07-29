(define (square x) (* x x))

(define (cube-root x)
	(define (improve guess)
		(/ (+ (/ x (square guess)) (* 2 guess)) 3))
	(define (good-enough? guess prev-guess)
		(< (abs (- guess prev-guess)) 0.001))
	(define (iter guess prev-guess)
		(if (good-enough? guess prev-guess) 
			guess
			(iter (improve guess) guess)))
	(iter 1.0 0.0))