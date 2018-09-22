#lang racket

(define (subsets s)
  (if (null? s)
      (list '())
      (let ([tmp (subsets (cdr s))])
        (append tmp (map (λ (x)
                           (cons (car s) x)) tmp)))))

(define (list-length l)
  (define (impl n i)
    (if (null? i)
        n
        (impl (+ n 1) (cdr i))))
  (impl 0 l))

(list-length (subsets '(1 2 3 4 5)))