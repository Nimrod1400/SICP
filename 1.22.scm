(define (smallest-divisor n)
  (define (iter divisor)
   (cond
     ((> (square divisor) n) n)
     ((divides? n divisor) divisor)
     (else (iter (+ divisor 1)))))
  (iter 2))

(define (divides? x y)
  (= (remainder x y) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime? n)
  (newline)
  (display n)
  (define (start-prime-test start-time)
    (if (prime? n) 
      (report (- (runtime) start-time))
      #f))
  (define (report elapsed-time)
    (display " *** ")
    (display elapsed-time)
    #t)
  (start-prime-test (runtime)))

(define (search-for-primes start) 
  (define (iter a count)
    (cond
      ((even? a) (iter (+ a 1) count))
      ((< count 3)
       (if (timed-prime? a)
	 (iter (+ a 2) (+ count 1))
	 (iter (+ a 2) count)))))
  (iter start 0))

