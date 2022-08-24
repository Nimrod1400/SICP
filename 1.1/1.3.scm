(define (square x) (* x x))
(define (sum-of-squares a b) (+ (square a) (square b)))
(define (f a b c)
	(cond 
		((and (> a b) (> b c)) (sum-of-squares a b))
		((and (> a b) (> c b)) (sum-of-squares a c))
		((and (> b a) (> c b)) (sum-of-squares b c))		
		((and (> b a) (> a c) (> a c)) (sum-of-squares  a b))		
		((and (> b a) (> a c) (> c a)) (sum-of-squares  c b))))