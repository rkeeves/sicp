#lang racket

(define (cont-frac-iterative n d k)
  (define (f i acc)
  (if (< i 0)
      acc
      (f (- i 1) (/ (n i) (- (d i) acc)))))
  (f k 0))



(define (tan-cf x k)
  (define (N i) (if (= i 0) x (* x x)))
  (define (D i) (+ (* 2 i) 1))
  (cont-frac-iterative N D k))

(tan-cf 0.5 100000)