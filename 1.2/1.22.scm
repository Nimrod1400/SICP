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
  (define (iter a count t)
    (cond
      ((even? a) (iter (+ a 1) count t))
      ((< count 3)
       (if (timed-prime? a)
	 (iter (+ a 2) (+ count 1) t)
	 (iter (+ a 2) count t)))
      (else (show-time (- (runtime) t)))))

  (define (show-time time)
    (newline)
    (display "total time: ")
    (display time))

  (iter start 0 (runtime)))

