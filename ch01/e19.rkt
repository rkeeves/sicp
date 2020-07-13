#lang racket

(define (sq x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fib-fast n)
  (define (T p q a b c)
    (cond ((= c 0) b)
          ((even? c) (T (+ (sq p) (sq q)) (+ (sq q) (* 2 (* p q))) a b (/ c 2)))
          (else (T p q (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) (- c 1)))))
  (T 0 1 1 0 n))


(define (fib-rec n)
  (if (< n 2) n (+ (fib-rec (- n 1)) (fib-rec (- n 2)))))

(time (fib-rec 35))
(time (fib-fast 35))
