#lang racket

;; fill the missing part, e.g.
;; calculate 1 + 3x + 5x^3 + x^5 when x = 2
;; (horner-eval 2 (list 1 3 0 5 0 1))
#|
(define (horner-eval x coefficient-sequence)
  (accumulate (λ (this-coeff higher-terms)
                ??)
              0
              coefficient-sequence))
|#


;; according to Horner's law we can eval the following
;; A_nX^n + A_n-1X^(n-1) + ... + A_1X + A_0
;; by evaluating
;; (...(A_nX + A_n-1)X + ... + A_1)X + A_0

;; thus, the given example can write to
;; 1 + x * (3 + x * (0 + x * (5 + x * (0 + x))))
;; in scheme, it's
;; (+ 1 (∗ x (+ 3 (∗ x (+ 0 (∗ x (+ 5 (∗ x (+ 0 x)))))))))

(define (horner-eval x coefficient-sequence)
  (define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))
  (accumulate (λ (this-coff higher-terms)
                (+ this-coff  (* x higher-terms)))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))