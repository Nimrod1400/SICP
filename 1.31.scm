(define (inc a) (+ a 1))

(define (product-recursive term a next b)
  (if (> a b) 
    1
    (* (term a) 
       (product-recursive term (next a) next b))))

(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))
