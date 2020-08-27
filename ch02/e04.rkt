#lang racket

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 1 2))
;; (car (lambda (m) (m 1 2)))
;; ((lambda (m) (m 1 2)) (lambda (p q) p))
;; ((lambda (p q) p) 1 2)
;; 1
(cdr (cons 1 2))