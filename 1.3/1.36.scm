(define tolerance 0.00001)
(define (average a b) (/ (+ a b) 2))
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess))) 
      (cond 
	((close-enough? next guess) next)
        (else (try next)))))
  (try first-guess))

(define (func x)
  (/ (log 1000) (log x)))

(define (b-func x)
  (average x (/ (log 1000) (log x))))
