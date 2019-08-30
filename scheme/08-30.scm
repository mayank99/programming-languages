; Consider this nested if block
(define (bad_type x)
  (if (null? x) 'null
    (if (number? x) 'number
      (if (symbol? x) 'symbol
        (if (boolean? x) 'boolean
          (if (pair? x) 'pair
            'other
          )
        )
      )
    )
  )
)

; The above can be rewritten using cond for readability
(define (type x)
  (cond
    ((null? x) 'null)
    ((number? x) 'number)
    ((symbol? x) 'symbol)
    ((boolean? x) 'boolean)
    ((pair? x) 'pair)
    (#t 'other)
  )
)

; Anonymous / lambda functions
(lambda (x) (+ x 10) 5) ;'returns 15
(map (lambda (x) (expt 10 x)) '(2 3 4)) ;'(100 1000 10000)
((lambda (x y) (+ (square x) (square y))) 3 4) ;25

; (re)defining the zip function which forms pairs from two lists
(define (zp L1 L2)
  (if (or (null? L1) (null? L2)) '( )
    (cons (list (car L1) (car L2)) (zp (cdr L1) (cdr L2)))
  )
)
; (zp '(1 2) '(3 4)) ;returns '((1 3) (2 4))

; Modifying zip using a custom callback (rather than just forming pairs)
(define (zipwith f L1 L2)
  (if (or (null? L1) (null? L2)) '( )
    (cons (f (car L1) (car L2)) (zipwith f (cdr L1) (cdr L2)))
  )
)
; (zipwith * '(2 3) '(5 6)) ;returns '(10 18)
; (zipwith (lambda (a b) (- (* 2 x) y)) '(10 20) '(4 5)) ;returns '(16 35)

; Defining the flatten function
(define (flatten x)
  (cond
    ((null? x) '())
    ((pair? x) (append (flatten (car x)) (flatten (cdr x))))
    (#t (list x))
  )
)