#lang racket

(define (avg a b) (/ (+ a b) 2))

(define (make-segment p0 p1)
  (cons p0 p1))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (avg-pts p0 p1)
  (make-point (avg (x-point p0) (x-point p1))
              (avg (y-point p0) (y-point p1))))

(define (midpoint-segment s)
  (avg-pts (start-segment s) (end-segment s)))

(midpoint-segment (make-segment (make-point 1 1) (make-point -3 5)))