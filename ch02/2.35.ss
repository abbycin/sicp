#lang racket

;; load accumulate
(require "utils.ss")

(define (count-leaves1 tree)
  (cond [(null? tree) 0]
        [(not (pair? tree)) 1]
        [else (+ (count-leaves1 (car tree))
                 (count-leaves1 (cdr tree)))]))

;; redefine count-leaves by using accumulate
(define (count-leaves tree)
  (accumulate + 0 (map (λ (x)
                         (cond [(null? x) 0]
                               [(not (pair? x)) 1]
                               [else (count-leaves x)])) tree)))

(define tree (list 1 2 (list 3 4) (list 4 5)))

(count-leaves1 tree)
(count-leaves tree)