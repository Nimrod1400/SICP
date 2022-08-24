(define (f-recursive n)
	(cond
		((= n 1) 1)
		((= n 2) 2)
		((= n 3) 3)
		(else (+ 
			(f-recursive (- n 1))
			(f-recursive (- n 2))
			(f-recursive (- n 3))))))
			
(define (f-iterative n)
	(define (iter a b c counter)
		(cond 
			((> counter n) n)
			((= counter n) c)
			(else 
				(iter b c (+ a b c) (+ counter 1)))))
	(iter 1 2 3 3))
