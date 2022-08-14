(define (cont-frac n d k)
  (define (iter result counter)
    (if (= counter 0)
      result
      (iter (/ (n counter) (+ (d counter) result)) 
	    (- counter 1))))
  (iter (/ (n k) (d k)) (- k 1)))
