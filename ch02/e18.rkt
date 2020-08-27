#lang racket

(define (reverse ls)
  (define (f accu xs)
    (if (null? xs)
        accu
        (f (cons (car xs) accu ) (cdr xs))))
  (f '() ls))

(reverse (list 1 4 9 16 25))