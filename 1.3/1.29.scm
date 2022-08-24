(define (cube x) (* x x x))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (y-factor k)
    (cond
      ((or (= k n) (= k 0)) 1.0)
      ((even? k) 2.0)
      (else 4.0)))
  (define (y-term k)
    (* (y k) (y-factor k)))
  (define (iter result count)
    (if (> count n) 
      result
      (iter (+ result (y-term count)) (+ count 1))))
  (* (/ h 3) (iter 0.0 0)))

;; для сравнения 
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (inc x) (+ x 1))

(define (integral-2 f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b) dx))

