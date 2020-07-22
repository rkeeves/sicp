#lang racket


(define (square x) (* x x))


(define (divides? a b) (= (remainder b a) 0))


(define (runtime) (current-inexact-milliseconds))


(define (report-prime elapsed-time)
  ;;(display " *** ")
  ;;(display elapsed-time)
  elapsed-time)

  
(define (timed-prime-test-slow n)
  (define (start-prime-test n start-time)
    (cond ((prime? n)
           (report-prime (- (runtime) start-time)))))
  (define (prime? n)
    (= n (smallest-divisor n)))
  (define (smallest-divisor n) (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  ;;(newline)
  ;;(display n)
  (start-prime-test n (runtime)))


(define (timed-prime-test-fast n)
  (define (start-prime-test n start-time)
    (cond ((prime? n)
           (report-prime (- (runtime) start-time)))))
  (define (smallest-divisor n) (find-divisor n 2))
  (define (prime? n)
    (= n (smallest-divisor n)))
  (define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
  (define (next n)
    (if (= n 2) 3 (+ n 2)))
  ;;(newline)
  ;;(display n)
  (start-prime-test n (runtime)))

(define (runtime-ratio n)
  (/  (timed-prime-test-slow n) (timed-prime-test-fast n) ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The following ratios should be 2.
;; Instead they are lower.
;; We didnt get the 2x speed increase, because
;; We still have to compute the if for each "next".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(runtime-ratio 1000000021)
(runtime-ratio 10000000061)
(runtime-ratio 100000000057)
(runtime-ratio 1000000000063)