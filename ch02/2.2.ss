#lang racket
;; constructor
(define (make-point x y)
  (cons x y))

;; selectorl
(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

;; constructor
(define (make-segment p1 p2)
  (cons p1 p2))

;; selector
(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

;; usage
(define (midpoint-segment seg)
  (cons
   (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2)
   (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)))

;; display
(define (print point)
  (display "(")
  (display (x-point point))
  (display ", ")
  (display (y-point point))
  (display ")"))

(print (midpoint-segment (make-segment (make-point 1 3) (make-point 6 2))))





(define (cons x y)
  (define (dispatch m)
    (cond
      [(= m 0) x]
      [(= m 1) y]
      [else (error "Argument not 0 or 1 -- CONS" m)]))
  dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))

