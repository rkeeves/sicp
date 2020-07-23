#lang racket

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (negative? x) (< x 0))

(define (pos? x) (< x 0))

(define (make-rat n d)
   (let ((abs-d (abs d)))
    (cons ((if (> abs-d d) - +) n) abs-d)))

;; (define (sign-norm-rat x)
;;   (let ((abs-d (abs (denom x))))
;;     (cons ((if (= abs-d (denom x)) + -) (numer x)) abs-d)))
  
(print-rat (make-rat -1 -2))
(print-rat (make-rat -1 2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat 1 2))