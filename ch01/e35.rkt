#lang racket

;; Golden ration by defintion
;; p^2 = p + 1
;; p = 1 + 1/p
;; Therefore we have to find the fixed point of
;;  x -> 1 + 1/x
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden-ratio x) (+ 1 (/ 1 x)))

(fixed-point golden-ratio 2.0)