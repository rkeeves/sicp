#lang racket
(define (inc x) (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
;; 2*2 then 4*4 therefore 16 inc
;; 5 + 16 * 1= 21