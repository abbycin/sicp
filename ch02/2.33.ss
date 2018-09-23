#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (accumulate2 op initial sequence)
  (if (null? sequence)
      initial
      (accumulate2 op (op (car sequence) initial) (cdr sequence))))

(define (gen-list n)
  (define (impl l m)
    (if (zero? m)
        l
        (impl (append (list m) l) (- m 1))))
  (impl '() n))

;; fill the missing parts
#|
(define (map2 p sequence)
  (accumulate (λ (x y) ?? nill sequence)))

(define (append2 seq1 seq2)
  (accumulate cons ?? ??))

(define (length2 sequence)
  (accumulate ?? 0 sequence))
|#
(define nil '())

;; since in accumulate impl, the first arg is an atom
;; and the second is a list, and map2 return a list
(define (map2 p sequence)
  (accumulate (λ (x y)
                (cons (p x) y)) nil sequence))
(map2 (λ (x) (* x x)) (gen-list 5))
(map (λ (x) (* x x)) (gen-list 5))

;; since the initial(seq2) never change, only need iterate
;; over seq1, i.e., the second arg of accumulate
(define (append2 seq1 seq2)
  (accumulate cons seq2 seq1))
(append2 (gen-list 2) (gen-list 5))
(append (gen-list 2) (gen-list 5))

;; since in accumulate impl, the op accept two args, here
;; we can expand the flow
;; (+ 1 (op '(1 2 3 4 5)))
;; (+ 1 (+ 1 (op '(2 3 4 5))))
;; ...
;; (+ 1 (+ 1 (+ 1 (+ 1 (+ 1 0))))))
;; (+ 1 (+ 1 (+ 1 (+ 1 1))))
;; ...
;; 5
(define (length2 sequence)
  (accumulate (λ (x y) (+ 1 y)) 0 sequence))
(length2 (gen-list 5))
(length (gen-list 5))