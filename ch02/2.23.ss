#lang racket

(define (for-each f l)
  (define (iter tmp x)
    (if (null? x)
        #t
        (iter (f (car x)) (cdr x))))
  (iter #t l))

(for-each (λ (x) (newline) (display x)) (list 1 2 3))