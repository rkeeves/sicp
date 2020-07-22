#lang racket

(define (square x) (* x x))

(define (f g) (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))
;; What happens if we try to interpret (f f)
;; (f f)
;; (f 2)
;; (2 2) -> application of something which is not a procedure
(f f)