#lang racket

(define (square x) (* x x))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
  
(define (smallest-divisor n) (find-divisor n 2))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))


(define (divides? a b) (= (remainder b a) 0))


(define (rel-prime? i n)
  (if (< i n) (= (gcd i n) 1) false))


(define (prime? n)
  (= n (smallest-divisor n)))

(define (identity x) x)


(define (succ x) (+ x 1))

(define (accumulate-filtered combiner null-value term a next b filter)
  (define (iter accu k)
     (if (> k b)
        accu
        (iter (if (filter k) (combiner accu (term k)) accu) (next k))))
  (iter null-value a))

(define (squares-of-primes-a-to-b a b)
  (accumulate-filtered + 0 square a succ b prime?))
  
(define (product-rel-primes-of-n n)
  (define (rel-prime-of-n? i)
    (rel-prime? i n))
  (accumulate-filtered * 1 identity 1 succ 3 rel-prime-of-n?))

(squares-of-primes-a-to-b 4 6)
(product-rel-primes-of-n 5)