(define (fast-expt b n)
  (define (iter a counter bn)
    (cond
      ((= counter 0) 1)
      ((= counter 1) a)
      ((even? counter) (iter (* a bn) (/ counter 2) (* bn bn)))
      (else (iter (* a bn) (- counter 1) bn))))
  (iter b n b))

;; для сравнения скорости 
(define (i-expt b n)
  (define (iter product counter)
    (if (= counter 1) 
      product
      (iter (* product b) (- counter 1))))
  (iter b n))
