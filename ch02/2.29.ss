#lang racket

(define (make-mobile left right)
  (list left right))

;; NOTE: object maybe the weight of object or a branch
(define (make-branch length structure)
  (list length structure))

;; a) write corresponding selector left-branch and right-branch which
;; return two branches of that structure, and selector branch-length
;; and branch-structure
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; b) write total-weight which return total weight of a mobile
;; i.e., sum of all right leaf
(define (total-weight mobile)
  (define (branch-weight b)
  (if (pair? (branch-structure b))
      (branch-weight (branch-structure b))
      (branch-structure b)))
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

;; test b
(define x (make-mobile (make-branch 1 (make-branch  1 2)) (make-branch 3 4)))
(total-weight x)

;; c) a mobile is balanced when lenght * weight of left branch equal right branchs'
;; and so does each sub-branch, write a procedure to check if a mobile is balanced

(define (is-balanced mobile) #t) ;; TODO