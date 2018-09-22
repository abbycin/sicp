#lang scheme

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
;; i.e., sum of all right leafs

;; mutual recursion
(define (branch-weight b)
  (if (pair? (branch-structure b))
      (total-weight (branch-structure b))
      (branch-structure b)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

;; test b
(define x (make-mobile (make-branch 1 2) (make-branch 3 4)))
(total-weight x)

;; c) a mobile is balanced when torque of left branch equal right branchs'
;; and so does each sub-branch, write a procedure to check if a mobile is balanced
(define (is-balanced mobile)
  (define (torque b)
    (* (branch-length b) (branch-weight b)))
  (define (is-branch-balanced b)
  (if (pair? (branch-structure b))
      (is-balanced-impl (branch-structure b))
      #t))
  (define (is-balanced-impl m)
    (and (= (torque (left-branch m))
            (torque (right-branch m)))
         (is-branch-balanced (left-branch m))
         (is-branch-balanced (right-branch m))))
  (printf "~a~n" (if (is-balanced-impl mobile) "true" "false")))

(is-balanced x)

(is-balanced (make-mobile
              (make-branch 3
                           (make-mobile
                            (make-branch 3 3)
                            (make-branch 1 9)))
              (make-branch 6
                           (make-mobile
                            (make-branch 3
                                         (make-mobile
                                          (make-branch 2 1)
                                          (make-branch 1 2)))
                            (make-branch 3 3)))))


;; d) replace list with cons in constructors, change selectors to make it work
(define (make-mobile2 left right)
  (cons left right))

(define (make-branch2 length structure)
  (cons length structure))

;; the only modification is right-branch and branch-structure, since cons
;; require the right must be list
(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))
