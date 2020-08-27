#lang racket

(define (last-pair ls)
  (define (f x xs)
    (if (null? xs) (cons x '()) (f (car xs) (cdr xs))))
  (if (null? ls) (error "Empty List") (f (car ls) (cdr ls))))
(last-pair (list 23 72 149 34))