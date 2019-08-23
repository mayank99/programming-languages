(begin
  (newline)

  ; Defining the factorial function
  (define (fact n)
    (if (<= n 1) 
      1
      (* n (fact (- n 1)))
    )
  )
  ; (fact 5)

  ; Faster implementation of fibonacci using helper
  (define (fib n)
    ; (if (<= n 1) n
    ;   (+ (fib (- n 1)) (fib (- n 2))) ; redundant calls
    ; )
    (fibhelper n 0 1)
  )
  (define (fibhelper n a b)
    (if (= n 0) a
      (fibhelper (- n 1) b (+ a b))
    )
  )
  ; (fib 100) ; runs instantly

  ; Working with lists
  ; see http://gg.gg/schemeLists for details
  (define list1 (cons 1 (cons 2 (cons 3 (cons 4 '())))))
  ;(set! list1 '(1 2 3 4)) ; set! can be used instead of cons
  ;(car list1) ; first element
  ;(cdr list1) ; second element if pair, otherwise the last n-1 elements
  (define list2 (append list1 (reverse list1))) ; flattened concat
  ;(cons list1 (reverse list1)) ; concat without spread
  ;(display list2)

  ; Defining list operations from car/cdr/cons
  (define (len L)
    (if (null? L) 0
      (+ 1 (len (cdr L)))
    )
  )
)