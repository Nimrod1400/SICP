(define (cube x) (* x x x))

(define (p x) 
  (- 
    (* 3 x)
    (* 4 (cube x))))

(define (sine a count)
  (cond ((not (> (abs a) 0.1)) (display count) a)
    (else (p (sine (/ a 3.0) (+ count 1))))))
;; кол-во операций растет логарифмически
;; кол-во памяти растет линейно
