; fold/reduce left
(define (reduce_left callback seed L)
  (if (null? L) seed
    (reduce_left callback (callback seed (car L)) (cdr L))
  )
)

; fold/reduce right
(define (reduce_right callback seed L)
  (if (null? L) seed
    (callback (car L) (reduce_right callback seed (cdr L)))
  )
)

; filtering lists: the callback is a predicate to test each element
; use with built-in predicates such as: boolean? number? symbol? odd? even? list? eq?
; e.g.: (filt odd? '(1 2 3 4)) => (1 3)
(define (filt callback L)
  (if (null? L) '( )
    (if (callback (car L))
      (cons (car L) (filt callback (cdr L))) ;concat if true
      (filt callback (cdr L))                ;skip if false
    )
  )
)

; extending eq? function to support pairs/lists (same as equal?)
(define (is_equal? x y)
  (if (and (pair? x) (pair? y))
    (and (is_equal? (car x) (car y)) and (is_equal? (cdr x) (cdr y)))
    (eq? x y)
  )
)
