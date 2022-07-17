(define (fast-expt b n)
  (define (iter a counter bn)
    (cond
      ((= counter 0) 1)
      ((= counter 1) a)
      ((even? counter) (iter (* a bn) (/ counter 2) (* bn bn)))
      (else (iter (* a bn) (- counter 1) bn))))
  (iter b n b))

