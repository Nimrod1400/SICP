(define (rev listt)
  (define (iter res l)
    (if (null? l)
      res
      (iter (cons (car l) res) (cdr l))))
  (iter (cons (car listt) '()) (cdr listt)))
