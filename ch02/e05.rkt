#lang racket

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (log-of x base acc)
  (if (= (remainder x base) 0)
      (log-of (/ x base) base (+ acc 1) )
      acc))

(define (car x)
  (log-of x 2 0))

(define (cdr x)
  (log-of x 3 0))

(cons 1 2)
(car (cons 1 2))
(cdr (cons 1 2))