#lang racket


(define (rev ls)
  (define (f accu xs)
    (if (null? xs)
        accu
        (f (cons (car xs) accu ) (cdr xs))))
  (f '() ls))


(define (same-parity . rest)
  (define (par a) (if (= (remainder a 2) 0) 1 -1))
  (define (par-different a b) (= 0 (+ (par a) (par b))))
  (define (f fst xs accu)
    (if (null? xs)
        accu
        (f fst (cdr xs) (if (par-different fst (car xs)) accu (cons (car xs) accu )))))
  (rev (f (car rest) rest '())))


(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)