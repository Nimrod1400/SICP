(define (f g)
  (g 2))

; процедура попытается вычислить выражение (2 2), а, т.к. 
; такое выражение не может быть вычислено, интерпретатор кинет
; ошибку.

