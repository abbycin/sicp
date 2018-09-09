#lang racket

(define (sequare x) (* x x))
(define (even? n) (= (remainder n 2) 0))
(define (expr b n)
  (cond
    [(= n 0) 1]
    [(even? n) (sequare (expr b (/ n 2)))]
    [else (* b (expr b (- n 1)))]))

(expr 4 4)

 (define (expr-iter b n) 
   (define (iter a b n) 
     (cond ((= n 0) a) 
           ((even? n) (iter a (sequare b) (/ n 2))) 
           (else (iter (* a b) b (- n 1))))) 
   (iter 1 b n)) 

(expr-iter 4 4)