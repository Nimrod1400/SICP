(define (expmod base ex m)
  (cond
    ((= ex 0) 1)
    ((even? ex)
     (remainder (square (expmod base (/ ex 2) m))
                m))
    (else
      (remainder (* base (expmod base (- ex 1) m))
                 m))))

(define (fermat-test? a n)
  (= (expmod a n n) a))


(define (fermat? n)
  (define (iter a so-long)
    (cond
      ((< a n) 
         (if (fermat-test? a n)
	   (iter (+ a 1) #t)
	   #f))
      (else so-long)))
  (iter 1 #f))

