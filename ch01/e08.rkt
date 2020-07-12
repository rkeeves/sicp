#lang racket


;; Newton's method for cube roots (x/y^2 + 2y)/3
(define (cube-root x)
  (define (square x) (* x x))
  (define (guess-enough? old cur)
    (= old cur))
  (define (improve-guess x y)
    (/ (+ (/ x (square y)) (* 2 y)) 3))
  (define (cube-root-iter oldguess guess x)
    (if (guess-enough? oldguess guess)
        guess
        (cube-root-iter guess (improve-guess x guess) x)))
  (cube-root-iter 1.0 x x))

(cube-root 27.0)