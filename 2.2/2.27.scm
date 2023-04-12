(define (deep-reverse listt)
  (define (iter result rest)
    (cond ((null? rest) result)
	  ((pair? (car rest)) (iter
				(cons 
				  (deep-reverse (car rest))
				  result)
				(cdr rest)))
	  (else (iter 
		  (cons (car rest) result)
		  (cdr rest)))))
  (iter (cons 
	  (cond ((pair? (car listt)) (deep-reverse (car listt)))
		(else (car listt))) 
	  '()) 
	(cdr listt)))
