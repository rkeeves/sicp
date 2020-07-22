#lang racket


(define (cube x) (* x x x))


(define (succ x) (+ x 1))


(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)) )))
  (iter a 0))

(sum cube 0 succ 3)