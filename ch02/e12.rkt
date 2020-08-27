#lang racket


(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((d (/ (* c p) 100)))
  (make-interval (- c d) (+ c d))))

(define (percent i)
  (- (/ (upper-bound i) (center i)) 1))

(display (percent (make-interval 1 3)))
(newline)
(display (percent (make-center-width 2 1)))
(newline)
(display (percent (make-center-percent 2 50)))
