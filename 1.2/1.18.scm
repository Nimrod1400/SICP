(define (double x) (* 2 x))
(define (halve x) (/ x 2))

(define (f-mult a b)
  (define (iter a counter an)
    (cond
      ((= counter 1) a)
      ((even? counter) (iter (+ a an) (halve counter) (double an)))
      (else (iter (+ a an) (- counter 1) an))))
  (iter a b a))
