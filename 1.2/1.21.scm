(define (smallest-divisor n)
  (define (iter divisor)
   (cond
     ((> (square divisor) n) n)
     ((divides? n divisor) divisor)
     (else (iter (+ divisor 1)))))
  (iter 2))

(define (divides? x y)
  (= (remainder x y) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

;; наименьший делитель 199 = 199
;; наименьший делитель 1999 = 1999
;; наименьший делитель 19999 = 7
