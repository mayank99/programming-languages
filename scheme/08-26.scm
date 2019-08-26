; Redefining the append function (for two lists)
(define (concat a b)
  ; recursively append cdr a until null, then append  b
  (if (null? a) b
    (cons (car a) (concat (cdr a) b))
  )
)
; (concat '(a b c) '(1 2 3))

; Redefining reverse inefficiently. O(N^2)
(define (rev L)
  (if (null? L) '( )
    (cons (last_element L)
      (rev (remove_last L))
    )
  )
)

; Helpers for reverse
(define (last_element L)
  (if (null? (cdr L)) (car L)  ;element is already last
    (last_element (cdr L))     ;else recurse until length is 1
  )
)
(define (remove_last L)
  (if (null? (cdr L)) '( )     ;return empty if at last element
    (cons (car L) (remove_last (cdr L)))
  )
)

; Redefining reverse efficiently. O(N)
(define (rev L) (revhelper L '( )))
(define (revhelper L1 L2)
  (if (null? L1) L2            ;move elements from L1 to L2 until null
    (revhelper (cdr L1) (cons (car L1) L2))
  )
)

; Redefining the map function
(define (list_map callback L)
  (if (null? L) '( )
    ; call the supplied function on every element sequentially
    (cons (callback (car L)) (list_map callback (cdr L)))
  )
)
; (list_map square '(1 2 3))

; Calling every function in a list on a value
(define (apply_all L value)
  (if (null? L) '( )
    (cons ((car L) value) (apply_all (cdr L) value))
  )
)
; (apply_all (list square sqrt) 25)