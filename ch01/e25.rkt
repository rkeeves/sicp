#lang racket

(require racket/trace)

(define (square x) (* x x))


  
(define (expmod-base base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod-base base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod-base base (- exp 1) m))
          m))))

(define (expmod-other base exp m)
  (define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))
  (remainder (fast-expt base exp) m))
(trace square)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Base solution keeps the arg of square low
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(expmod-base 5 101 101)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The suggested solution lets the arg grow
;; which hinders execution
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(expmod-other 5 101 101)