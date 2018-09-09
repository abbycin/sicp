#lang racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; (a-plus-abs-b 1 -2)

(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

;;(test 0 (p))

;; make a sqrt
;; at first time, the guess is 1.0
;; the second time, the guess is (1.0 + x) / 2
;; so the guess is slowly approach to x
;; till their average differece is litte than 0.001
;; the guess is nearly enough to the real `sqrt` of x

(define (abs x)
  (if (> x 0) x (- x)))

(define (good-enough? guess x)
  (if (< (abs (- (* guess guess) x)) 0.00000001) #t #f))
#|
;; can't replace if to my-if
(define (my-if pred then otherwise)
  (cond ((pred) (then))
        (else (otherwise))))
|#

(define (average x y)
  (/ (+ x y) 2))

(define (guess-again guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (guess-again guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (power x) (* x x))

(sqrt 0.4)