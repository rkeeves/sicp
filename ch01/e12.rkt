#lang racket

(define (p r c)
  (cond ((< r 1) 0)
        ((< c 1) 0)
        ((> c r) 0)
        ((= c 1) 1)
        ((= c r) 1)
        (else (+ (p (- r 1) (- c 1)) (p (- r 1) c)))
        ))

(p 5 3)
(p -1 6)
