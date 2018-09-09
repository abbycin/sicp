#lang racket

;; return the sum of big two of three
(define (big-two x y z)
  (cond
    [(> x y)
     (if (> y z) (+ x y) (+ x z))]
    [else
     (if (> x z) (+ x y) (+ y z))]
    ))

(big-two 3 -2 0)