#lang racket

;; Describe this procedure

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; The procedure does a case split on input b
;; If b is positive it adds b to a
(a-plus-abs-b 1 1)
;; else it subtracts b from a
(a-plus-abs-b 1 -1)