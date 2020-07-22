#lang racket

(define (square x) (* x x))


(define (smallest-divisor n) (find-divisor n 2))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))


(define (divides? a b) (= (remainder b a) 0))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(smallest-divisor 199)
;; (find-divisor 199 2)
;; (find-divisor 199 3)
;; (find-divisor 199 4)
;; ...
;; (find-divisor 199 15)
;; 199
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(smallest-divisor 1999)
;; (find-divisor 1999 2)
;; (find-divisor 1999 3)
;; ...
;; (find-divisor 1999 45)
;; 1999
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(smallest-divisor 19999)
;; (find-divisor 19999 2)
;; (find-divisor 19999 3)
;; (find-divisor 19999 4)
;; (find-divisor 19999 5)
;; (find-divisor 19999 6)
;; (find-divisor 19999 7)
;; ((divides? 7 19999) 7)
;; 7