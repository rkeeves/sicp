#lang racket

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f k)
  (define (internal prod i)
    (if (= i 0)
        prod
        (internal (compose prod f) (- i 1))))
  (internal f (- k 1)))

((repeated square 2) 5)