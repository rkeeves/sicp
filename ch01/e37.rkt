#lang racket

(define (cont-frac-rec n d k)
  (define (f n d i)
  (if (= i k)
      0
      (/ (n i) (+ (d i) (f n d (+ i 1))))))
  (f n d 0))

(cont-frac-rec (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(define (cont-frac-iter n d k)
  (define (f n d i acc)
  (if (= i k)
      acc
      (f n d (+ i 1) (/ (n i) (+ (d i) acc)))))
  (f n d 0 0))

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)