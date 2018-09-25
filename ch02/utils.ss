#!/usr/bin/env racket
#lang racket
;; => Author: Abby Cin
;; => Mail: abbytsing@gmail.com
;; => Created Time: Tue 25 Sep 2018 10:58:40 AM CST

(provide (all-defined-out))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

;; op apply to all elements in sub-seq at same index
;; i.e., let seqs = ((1 2 3) (4 5 6) (7 8 9)) and op = +
;; the resule is ((+ 1 4 8) (+ 2 5 8) (+ 3 6 9))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))