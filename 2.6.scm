(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n) 
  (lambda (f)
    (lambda (x) (f ((n f) x)))))
; говорят, что в СИКПЕ не нужен матан.
; пусть l - это лямбда
; zero = lf.lx. x
; add-1 = ln.lf.lx. f (n f x)
; one = add-1 zero = (ln.lf.lx. f (n f x)) zero =
; = lf.lx. f (zero f x) = lf.lx. f ((lf'.lx'.x') f x) = 
; = lf.lx. f x
; two = add-1 one = (ln.lf.lx f (n f x)) one = 
; = lf.lx. f (one f x) = lf.lx. f ((lf'.lx'. f' x') f x) =
; = lf.lx. f ((lx'. f x') x) = lf.lx. f (f x)
; сложение a и b тогда будет заключаться в применении f к x
; (a + b) раз, или же применении a к b, примененному к x.
; plus = la.lb.lf.lx. a f (b f x)
(define one 
  (lambda (f) (lambda (x) (f x))))
(define two 
  (lambda (f) (lambda (x) (f (f x)))))
(define (plus a b)
  (lambda (f) (lambda (x)
		((a f) ((b f) x)))))
