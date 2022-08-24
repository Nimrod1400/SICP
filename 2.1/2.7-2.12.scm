(define (make-interval a b)
  (cons a b))
(define (lower-bound i)
  (car i))
(define (upper-bound i)
  (cdr i))
(define (add-interval i1 i2)
  (make-interval (+ (lower-bound i1) (lower-bound i2))
		 (+ (upper-bound i1) (upper-bound i2))))
(define (mul-interval i1 i2)
  (let ((p1 (* (lower-bound i1) (lower-bound i2)))
	(p2 (* (lower-bound i1) (upper-bound i2)))
	(p3 (* (upper-bound i1) (lower-bound i2)))
	(p4 (* (upper-bound i1) (upper-bound i2))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
(define (div-interval i1 i2)
  (let ((l (lower-bound i2))
        (u (upper-bound i2)))
    (if (or (= l 0)
	    (= u 0)
	    (and (< l 0) (> u 0)))
      (error "Division by interval that spans zero")))
  (mul-interval i1
		(make-interval (/ 1.0
				  (upper-bound i2))
			       (/ 1.0
				  (lower-bound i2)))))
(define (sub-interval i1 i2)
  (make-interval (- (lower-bound i1) (upper-bound i2))
		 (- (upper-bound i1) (lower-bound i2))))
(define (make-center-width c w)
  (make-interval (- c w)
		 (+ c w)))
(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2.0))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))
(define (make-center-percent c p)
  (make-center-width c
		     (* c (/ p 100.0))))
(define (percent i)
  (* (/ (width i) (center i)) 100))

