; More local binding / let (https://docs.racket-lang.org/reference/let.html)
(define (f a b) (+ a b))
(define (g a b) (* a b))
;(let* (
;  (g (lambda (a b) (- a b)))
;  (h (lambda (x) (+ (f x x) (g x 3)))))
;  (h 10)
;)

; Using letrec ensures local f is used. let and let* try to use global
(letrec ((f (lambda (n) (if (= n 0) 1 (* n (f (- n 1))))))) (f 5))

; Creating a tree as a nested list
(define T 
  '(a 
    (b (e) (f))
    (c (g (m) (n)))
    (d (h) (j (p)) (k))
  )
)
; (postorder T) => (e f b m n g c h p j k d a)

; Implementing post-order traversal for the tree
(define (postorder T)
  (if (null? T) '()
    (fold-right append (list (car T)) (map postorder (cdr T)))
  )
)

; Redefining the member function (similar to slice() in python/JS)
(define (mem x L)
  (if (null? L) #f
    (if (eq? x (car L)) L
      (mem x (cdr L)) ;recursively call until x is found
    )
  )
)
; can also be used inside if, because it returns #f if not found
; (if (mem 'x '(x y)) 'found 'nope)