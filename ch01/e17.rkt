#lang racket

;; this was given by the exercise
(define (double x) (* x 2))
;; this was given by the exercise
(define (halve x) (/ x 2))
;; this was given by the exercise
(define (even? n)
  (= (remainder n 2) 0))



(define (fast-mul a b)
  (define (f x y a)
    (cond ((= y 0) a)
          ((even? y) (f (double x) (halve y) a))
          (else (f x (- y 1) (+ a x)))))
  (f a b 0))

(fast-mul 2 3)
