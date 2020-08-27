#lang racket

(define (for-each f ls)
  (if (null? ls)
      true
      (let()
        (f (car ls))
        (for-each f (cdr ls)))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 1 2 3 4 5))

