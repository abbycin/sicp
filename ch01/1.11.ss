#lang racket

(define (recursive n)
  (if (< n 3)
      n
      (+ (recursive (- n 1))
         (* 2 (recursive (- n 2)))
         (* 3 (recursive (- n 3))))))

(define (iter n)
  (define (helper i a b c)
    (cond [(< i 0) i]
          [(= i 0) a]
          [else (helper (- i 1) b c (+ c (* 2 b) (* 3 a)))]))
  (helper n 0 1 2))

;; http://www.billthelizard.com/2009/11/sicp-exercise-111.html
;; https://stackoverflow.com/questions/2365993/no-idea-how-to-solve-sicp-exercise-1-11
(define (iter2 n)
   (if (< n 3)
       n
       (f-iter 2 1 0 n)))

(define (f-iter a b c count)
   (if (< count 3)
       a
       (f-iter (+ a (* 2 b) (* 3 c))
               a
               b
               (- count 1))))

(define (iterative n)
  (define (helper a b c n)
    (if (< n 3)
        a
        (helper (+ a (* 2 b) (* 3 c)) a b (- n 1))))
  (helper 2 1 0 n))
  
(recursive 4)
(iter 4)
(iter2 4)
(iterative 4)

;; C implementation
#|
#include <stdio.h>
#include <stdlib.h>

int foo(int n)
{
  if(n < 3)
  {
    return n;
  }
  int a = 2;
  int b = 1;
  int c = 0;
  while(n >= 3)
  {
    int tmp = a + 2 * b + 3 * c;
    c = b;
    b = a;
    a = tmp;
    --n;
  }
  return a;
}

int main(int argc, char* argv[])
{
  printf("%d\n", foo(atoi(argv[1])));
}
|#