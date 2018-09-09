#lang racket

(require "2.18.ss")

(define (deep-reverse l)
  (define (map f x)
    (if (null? x)
        x
        (cons (f (car x)) (map f (cdr x)))))
  (if (pair? l)
      (my-reverse (map deep-reverse l))
      l))

(define x (list (list 1 2) (list 3 4)))
(println x)
(deep-reverse x)
;; print
;; '((4 3) (2 1))
