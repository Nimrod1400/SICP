(define (average a b) (/ (+ a b) 2))

(define (abs x) 
	(if (< x 0) (- x) x))

(define (square x) (* x x))

(define (sqrt x) 
	(define (good-enough? guess prev-guess) 
		(< (abs (- guess prev-guess)) 0.001))
		
	(define (improve guess) 
		(average guess (/ x guess)))
		
	(define (sqrt-iter guess prev-guess)
		(if (good-enough? guess prev-guess)
			guess
			(sqrt-iter (improve guess) guess)))
			
	(sqrt-iter 1.0 0.0))