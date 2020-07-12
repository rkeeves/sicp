#lang racket
;; 1.3
;; Define a procedure that takes three numbers
;; as arguments and returns the sum of
;; the squares of the two larger numbers.

(define (f a b c)
  (define (sq x) (* x x))
  (define (sq-sum x y) (+ (sq x) (sq y)))
  (cond ((and (>= a c) (>= b c) ) (sq-sum a b))
        ((and (>= a b) (>= c b) ) (sq-sum a c))
        (else  (sq-sum b c)) ))


(f 1 2 3) 
(f 1 1 1) 
(f 1 2 2) 
(f 1 1 2) 
