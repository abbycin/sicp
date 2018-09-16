#lang racket

(define (append l r)
  (if (null? l)
      r
      (cons (car l) (append (cdr l) r))))

;; flatten a tree
(define (fringe l)
  (cond [(null? l) l]
        [(not (pair? l)) (list l)]
        [else (append (fringe (car l)) (fringe (cdr l)))]))


(fringe (list 0
         (list 1 2
               (list 5 6))
         (list 3 4
               (list 7 8
                     (list 9 10)
                     (list 11 12)))))