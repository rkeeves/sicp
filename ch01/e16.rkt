#lang racket

(define (sq x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (expt b n a)
  (cond ((< n 1) a)
        ((even? n) (expt (sq b) (/ n 2) a))
        (else (expt b (- n 1) (* b a)))))

(expt 2 0 1)
(expt 2 1 1)
(expt 2 2 1)
(expt 2 3 1)
(expt 2 4 1)
(expt 2 5 1)