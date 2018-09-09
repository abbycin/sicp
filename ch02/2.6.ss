#lang racket

;; procedure `f` apply 0 time to `x`
(define zero
  (λ (f)
    (λ (x) x)))

(define (add-1 n)
  (λ (f)
    (λ (x)
      (f ((n f) x)))))

;; procedure `f` apply 1 time to `x`
(define one
  (λ (f)
    (λ (x)
      (f x))))

;; procedure `f` apply 2 times to `x`
(define two
  (λ (f)
    (λ (x)
      (f (f x)))))

(define (add a b)
  (λ (f)
    (λ (x)
      ((a f) ((b f) x)))))

(define (print x)
  (display x)
  (newline))

;; test impl
(define trash (((add one two) (λ (x)
          (print x)
          x))
 "are you ok?"))
