(define (inc a) (+ a 1))

(define (plus-two a) (+ a 2))

(define (product-recursive term a next b)
  (if (> a b) 
    1.0
    (* (term a) 
       (product-recursive term (next a) next b))))

(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1.0))


(define (pi n) 
  (define (new-square a)
    (cond 
      ((= (remainder n 4) 0) 
       (if (= a n) 
	 a
	 (square a)))
      (else 
	(if (= a n)
	  a
	  (square a)))))
  (* 2.0 (/ (product-iterative new-square 2.0 plus-two n)
	    (product-iterative new-square 3.0 plus-two (- n 1)))))
