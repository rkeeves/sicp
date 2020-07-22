#lang racket

(define (identity x) x)

(define (succ x) (+ x 1))

(define (accumulate-rec combiner null-value term a next b)
   (if (> a b)
        null-value
        (combiner a (accumulate-rec combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter accu k)
     (if (> k b)
        accu
        (iter (combiner accu (term k)) (next k))))
  (iter null-value a))


(accumulate-rec * 1 identity 1 succ 3)
(accumulate-iter * 1 identity 1 succ 3)
