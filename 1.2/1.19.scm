(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond
    ((= count 0) b)
    ((even? count)
     (fib-iter
       a
       b
       (+ (square p) (square q))
       (+ (* 2 p q) (square q))
       (/ count 2)))
    (else (fib-iter (+ (* b q) (* a q) (* a p))
		    (+ (* b p) (* a q))
		    p
		    q
		    (- count 1)))))

;; для тестирования
(define (fib-testing n)
  (cond 
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib-testing (- n 1)) 
	     (fib-testing (- n 2))))))
