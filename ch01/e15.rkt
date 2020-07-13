#lang racket

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))
;; (sine 12.15)
;; (p (sine 4.05))
;; (p (p (sine 1.35)))
;; (p (p (p (sine 0.45))))
;; (p (p (p (p (sine 0.15)))))
;; (p (p (p (p (p (sine 0.05))))))
;; (p (p (p (p (p 0.05)))))
;;
;; So the following difference should be zero
(- (sine 12.15) (p (p (p (p (p 0.05))))))
;; p gets applied 5 times
;; O(log x) complexity
;; Take into consideration the below example
;; which mimicks the core of the recursivity of the above sine
(define (fn-logn x)
  (define (looper x c)
    (if (> (abs x) 1) (looper (/ x 2) (+ c 1)) c))
  (looper x 0))
;; For example lets see 
(fn-logn 1)
(fn-logn 2)
(fn-logn 4)
(fn-logn 8)
(fn-logn 16)