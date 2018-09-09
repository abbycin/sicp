#lang racket

(provide my-reverse)

;; (reverse (list 1 4 9 16 25))
;; (25 16 9 4 1)

;; (define l (list 1 2))
;; (cons 1 l) => (1 1 2)
;; (cons l 1) => ((1 2) 1)
(define (append l r)
  (if (null? l)
      r
      (cons (car l) (append (cdr l) r))))

(define (my-reverse l)
  (define nil '())
  (define (iter tmp l)
    (if (null? l)
        tmp
        (iter (cons (car l) tmp) (cdr l))))
  (iter nil l))

;;(my-reverse '(1 2 3 4 5))
