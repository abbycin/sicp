#lang racket

;; first version
(define (pascal-impl r c)
  (cond
    [(or (= c 0) (> c r)) 0]
    [(= c r) 1]
    [else (+ (pascal-impl (- r 1) (- c 1)) (pascal-impl (- r 1) c))]))

(pascal-impl 5 3)

;; second version
(define (pascal-impl2 r c)
  (define res 0)
  (define (impl r c)
    (cond
      [(or (= c 0) (> c r)) (set! res (+ res 0))]
      [(= c r) (set! res (+ res 1))]
      [else (impl (- r 1) (- c 1))
            (impl (- r 1) c)]))
  (impl r c)
  res)

(pascal-impl2 4 1)
