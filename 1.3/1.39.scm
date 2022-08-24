(define (cont-frac n d k)
  (define (iter result counter)
    (if (= counter 0)
      result
      (iter (/ (n counter) (+ (d counter) result))
            (- counter 1))))
  (iter (/ (n k) (d k)) (- k 1)))

(define (rad-from-deg deg) 
  (/ (* deg 3.141592) 180))

(define (tan-cf x k)
  (cont-frac
    (lambda (i)
      (let ((x (rad-from-deg x)))
	(if (= i 1)
	  x
	  (- (* x x))))) 
    (lambda (i) (- (* 2.0 i) 1.0))
    k))
