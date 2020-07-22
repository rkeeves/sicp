#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define product
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)) )))
  (iter a 1))
;; Example
(define (identity x) x)

(define (succ x) (+ x 1))

(product identity 1 succ 3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define factorial by product
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (fact n)
  (product identity 1 succ n))
;; Example
(fact 3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Approximate pi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (pi-approx n)
  (define (seq beg prev current)
    (cond ((= prev 0) beg)
          ((= prev current) (+ current 2))
          (else current)))
  (define (pi-current k)
    (cond ((= k 0) (/ 2 3))
          (else (/ (+ 2 (* 2 (quotient k 2))) (+ 3 (* 2 (quotient (- k 1) 2)))))))
    (* 4 (product pi-current 1 succ n)))
(exact->inexact (pi-approx 10000))

(define (pi-approx-2 n)
  (define (a++ a b) (if (> a b) a (+ a 2)))
  (define (b++ a b) (if (> b a) b (+ b 2)))
  (define (iter a b accu n)
    (if (< n 0)
        accu
        (iter (a++ a b) (b++ a b) (* accu (/ a b)) (- n 1))))
  (* 4 (iter 2 3 1 n)))
(exact->inexact (pi-approx-2 10000))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define product as recursive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

(product-rec identity 1 succ 3)