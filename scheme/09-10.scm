; trinary/n-ary tree
(define T '(a (b (e) (f)) (c (g (m) (n))) (d (h) (j (p)) (k))))

; binary tree (need empty lists to denote null leaves)
(define T2 '(a (b (d (h ())) (e () (j))) (c (f () (k)) (g))))

; Alternative implementation of post-order traversal
(define (postorder T)
  (if (null? T) '()
    (append (apply append (map postorder (cdr T))) (list (car T)))
  )
)

; Implementing pre-order traversal for the tree
(define (preorder T)
  (if (null? T) '()
    (fold-left append (list (car T)) (map preorder (cdr T)))
  )
)

; Alternative implementation of pre-order
(define (preorder2 T)
  (cons (car T) (apply append (map preorder (cdr T))))
)

; sum of the fourth powers of odd positives in a list
(define (fun L)
  (fold-right + 0
    (map
      (lambda (x) (square (square x)))
      (filter (lambda (x) (and (positive? x) (odd? x))) L)
    )
  )
)