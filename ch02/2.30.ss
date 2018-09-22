#lang racket

;; write a procedure square-tree, it has the following behavior
#|
(square-tree
 (list 1
       (list 2 (list 3 4) 5) (list 6 7)))
|#
;; print (1 (4 (9 16) 25) (36 49))

(define (square-tree tree)
  (cond
    [(null? tree) tree]
    [(not (pair? tree)) (* tree tree)]
    [else (cons (square-tree (car tree))
                (square-tree (cdr tree)))]))

(define x (list 1
                (list 2 (list 3 4) 5) (list 6 7)))

(square-tree x)

(define (square-tree2 tree)
  (map (λ (y) (if (pair? y)
                  (square-tree2 y)
                  (* y y))) tree))
(square-tree2 x)