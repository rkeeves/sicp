#lang racket

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (compose f g)
  (lambda (x) (f (g x))))


(define (f x) (* x x x))

(define (repeated f k)
  (define (internal prod i)
    (if (= i 0)
        prod
        (internal (compose prod f) (- i 1))))
  (internal f (- k 1)))



((smooth f) -100)


(((repeated smooth 2) f) -100)
