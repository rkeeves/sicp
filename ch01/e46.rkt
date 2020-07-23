#lang racket

(define (avg x y) (/ (+ x y) 2))


(define (iterative-improve good-enough? improve)
  (lambda (x) (if (good-enough? x (improve x))
                  (improve x)
                  ((iterative-improve good-enough? improve) (improve x)))))

  
(define (sqrt x)
  (define (close-enough? a b) (< (abs (- a b)) 0.001))
  (define (improve y) (avg y (/ x y)))
  ((iterative-improve close-enough? improve) 1.0))

(sqrt 64)