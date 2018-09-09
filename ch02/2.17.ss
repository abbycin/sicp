#lang racket

;; (last-pair (list 23 72 19 34))
;; (34)

(define (length l)
  (define (iter count l)
    (if (null? l)
        count
        (iter (+ 1 count) (cdr l))))
  (iter 0 l))

(define (last-pair l)
  (if (= 1 (length l))
      l
      (last-pair (cdr l))))

(last-pair (list 23 72 149 34))