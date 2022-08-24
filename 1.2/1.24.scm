(define (expmod base ex m)
  (cond 
    ((= ex 0) 1)
    ((even? ex)
     (remainder (square (expmod base (/ ex 2) m))
		m))
    (else
      (remainder (* base (expmod base (- ex 1) m))
		 m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond 
    ((= times 0) #t)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else #f)))

(define (timed-prime? n)
  (newline)
  (display n)
  (define (start-prime-test start-time)
    (if (fast-prime? n 10)
      (report (- (runtime) start-time))
      #f))
  (define (report elapsed-time)
    (display " *** ")
    (display elapsed-time)
    #t)
  (start-prime-test (runtime)))

