(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0)
	     (no-more? coin-values))
	 0)
	(else
	  (+ (cc amount
		 (except-first-denom coin-values))
	     (cc (- amount 
		    (first-denom coin-values))
		 coin-values)))))
(define (no-more? l)
  (null? l))
(define (except-first-denom l)
  (cdr l))
(define (first-denom l)
  (car l))
