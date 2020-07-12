#lang racket


(define (average x y)
  (/ (+ x y) 2.0))


(define (square x)
  (* x x))


(define (sqrt-base x)
  (define (good-enough? guess n)
    (< (abs (- (square guess) n)) 0.001))
  (define (improve-guess guess n)
    (average (/ n guess) guess))
  (define (sqrt-iter guess n)
    (if (good-enough? guess n)
        guess
        (sqrt-iter (improve-guess guess n) n)))
  (sqrt-iter 2.0 x))


(define (sqrt-prec x)
  (define (good-enough? guess oldguess)
    (= guess oldguess))
  (define (improve-guess guess n)
    (average (/ n guess) guess))
  (define (sqrt-iter oldguess guess x)
    (if (good-enough? guess oldguess)
        guess
        (sqrt-iter guess (improve-guess guess x) x)))
  (sqrt-iter 1.0 2.0 x))


(sqrt-base .000004) ;; The precision is getting worse as the number gets closer to the hardcoded precision value.
(sqrt-prec .000004) ;; The precision is dependent on the implementation's precision beacuse of the =.