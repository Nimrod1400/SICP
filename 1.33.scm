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

(define (prime? n)
  (define (iter times)
    (cond
      ((even? n) #f)
      ((= times 0) #t)
      ((fermat-test n) (iter (- times 1)))
      (else #f)))
  (iter 100))

(define (inc a) (+ a 1))

(define (identity x) x)

(define (filtered-accumulate combiner null-value term a next b filtered?)
  (define (iter a result)
    (if (> a b)
      result
      (if (filtered? a)
	(iter (next a) 
	      (combiner (term a) result))
	(iter (next a) result))))
  (iter a null-value))

(define (filtered-sum term a next b filtered?)
  (filtered-accumulate + 0 term a next b filtered?))

(define (filtered-product term a next b filtered?)
  (filtered-accumulate * 1 term a next b filtered?))

(define (squares-of-primes a b)
  (filtered-sum square a inc b prime?))

(define (coprime-product n)
  (define (coprime? a)
    (= (gcd n a) 1))
  (filtered-product identity 1 inc n coprime?))
