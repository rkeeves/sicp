#lang racket
(define (square n) (* n n))

(define (non-trivi-sqrt? x n)
  (cond ((= x 1) false)
        ((= x (- n 1)) false)
        (else (= (remainder (square x) n) 1))))


(define (expmod base exp m) 
 (cond ((= exp 0) 1)
       ((even? exp)
        (let (
              (x (expmod base (/ exp 2) m))
              )
          (if (non-trivi-sqrt? x m)
              0
              (remainder (square x) m))))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

  
(define (miller-rabin-test a n) 
  (cond ((= a 0) true) 
        ((= (expmod a (- n 1) n) 1) (miller-rabin-test (- a 1) n)) 
        (else false))) 

(define (miller-rabin n)
  (miller-rabin-test (random n) n))

(miller-rabin 49)
(miller-rabin 101)