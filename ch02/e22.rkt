#lang racket

(define (square x) (* x x))

(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))


(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

  
(define ls (list 1 2 3 4 5))
(square-list-1 ls)
;; The above proc produces the answer in a reverse order
;; because it works its way back up from
;; the base case
(square-list-2 ls)
;; The above proc conses a list to a number
;; aka (list (list (list ... num))))
