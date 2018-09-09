#lang scheme

;; (x . y)
;; means first part is x and the rest part is list of y
;; if x is empty then the y is the entire list
;; that's why built-in method `+` `-` `*` and `list` can accpet arbitrary arguments
(define (f . y)
  (print y))

;; print (1 2 3 4)
;;(f 1 2 3 4)

(define nil '())

;; iterative version
;; have to apply `reverse` on result, since its stack-like structure
(define (same-parity first . rest)
  (define (get-evens-or-odds l condition)
  (define (iter tmp l)
    (if (null? l)
        tmp
        (iter (if (condition (car l))
                  (cons (car l) tmp)
                  tmp)
              (cdr l))))
  (reverse (iter nil l)))
  (get-evens-or-odds rest (if (even? first) even? odd?)))

(same-parity 1 1 2 3 4 5 6 7)
(same-parity 2 1 2 3 4 5 6 7 8)

;; recursive version
(define (same-parity-rec first . rest)
  (define (iter l condition)
    (if (null? l)
        nil
        (if (condition (car l))
            (cons (car l)
                  (iter (cdr l) condition))
            (iter (cdr l) condition))))
  (iter rest (if (even? first) even? odd?)))

(same-parity-rec 1 1 2 3 4 5 6 7)
(same-parity-rec 2 1 2 3 4 5 6 7)