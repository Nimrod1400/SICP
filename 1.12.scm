(define (pascal x y)
  (if (or (= y 1) (= x 1) (= x y))
    1
    (+ 
      (pascal (- y 1) (- x 1))
      (pascal (- y 1) x))))
