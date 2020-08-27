#lang racket

(define (sq x) (* x x))

(define (square-list-1 items)
  (if (null? items)
      '()
      (cons (sq (car items)) (square-list-1 (cdr items)))))


(define (square-list-2 items)
  (map (lambda (x) (* x x)) items ))

(define ls (list 1 2 3 4 5))
(square-list-1 ls)
(square-list-2 ls)

