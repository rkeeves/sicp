#lang racket

(define (reverse ls)
  (define (f accu xs)
    (if (null? xs)
        accu
        (f (cons (car xs) accu ) (cdr xs))))
  (f '() ls))

(define (deep-reverse ls)
  (define (f accu xs)
    (if (null? xs)
        accu
        (let ((fst (car xs)))
              (f (cons
                   (if (pair? fst) (deep-reverse fst) fst) accu ) (cdr xs)))))
  (f '() ls))

(define x (list (list 1 2) (list 3 4)))
x
;; ((1 2) (3 4))
(reverse x)
;; ((3 4) (1 2))
(deep-reverse x)
;; ((4 3) (2 1))