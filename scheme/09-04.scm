; Variadic function (variable number of parameters)
(define (f a b . L)
  (list (* a b) (length L))
)
; (f 2 5 'a 'b) => (10 2)

(define (g a b . L)
  (* a b (apply + L)) ;apply a fn/operator to every element
)
; (g 2 3 4 5 6) => 2*3*(4+5+6) => 50

; Other examples of apply
(apply + (map square '(2 3 4 5 6))) ;90
(apply * (map (lambda (x) (modulo x 10)) '(-3 -4 -5 -6))) ;840

; Local binding using let and sequential let*
(let ((x 10) (y 5) (z 20)) (+ x (* y z))) ;110
(define x 2)
(define y 3)
(define z 4)
(let ((x y) (z x) (y z)) (list x y z)) ;(3 4 2)
(let* ((x y) (z x) (y z)) (list x y z)) ;(3 3 3)
(let ((x (* 2 y)) (y (+ 3 x))) (list x y)) ; (6 5)
(let* ((x (* 2 y)) (y (+ 3 x))) (list x y)) ; (6 9)

; --- Simulating classes/OOP using let and set ---

; Random generator class
(define (mk-random)
  (let ((seed 19380110) (n 4294967296))
    (lambda (m)
      (set! seed (modulo (+ (* seed 69069) 1) n)) ;seed = ((seed*69069) + 1) % n
      (modulo seed m)
    )
  )
)
(define rand (mk-random)) ;instantiating the class. call with range e.g. (rand 1000)

; Stack class
(define (Stack)
  (let ((L '()))
    (lambda (msg . args)
      (cond
        ((eq? msg 'empty?) (null? L))
        ((eq? msg 'top)    (car L))
        ((eq? msg 'pop!)   (set! L (cdr L)) L)
        ((eq? msg 'push!)  (set! L (cons (car args) L)) L)
        (#t 'error)
      )
    )
  )
)
; instantiate as (define s (Stack)) and then call as (s 'push! 10) etc