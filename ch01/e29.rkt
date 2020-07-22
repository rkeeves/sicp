#lang racket
(define (cube x) (* x x x))

(define (succ x) (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (multiplier k) (cond ((= k 0) 1)
                               ((= k n) 1)
                               ((odd? k) 4)
                               (else 2)))
  (define (get-term k)
    (* (f (+ a (* k h)))
    (multiplier k)))
  (* (/ h 3) (sum get-term 0 succ n))
  )

(simpson cube 0 1 100)
(simpson cube 0 1 1000)