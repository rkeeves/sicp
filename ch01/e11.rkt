#lang racket
;; f(n)
;;   n if n < 3,
;;   f (n - 1) + 2f (n - 2) + 3f (n - 3) if n >= 3

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
      (* 2 (f-rec (- n 2)))
      (* 3 (f-rec (- n 3))))))

(f-rec 0)
(f-rec 1)
(f-rec 2)
(f-rec 3)
(f-rec 4)
(f-rec 5)
(f-rec 6)

(define (foo a b c)
  (+ c (* 2 b) (* 3 a)))

(define (fi a b c n)
  (if (= n 0)
      a
      (fi b c (foo a b c )(- n 1))))

(define (f-iter n)
  (fi 0 1 2 n))

(f-iter 0)
(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 5)
(f-iter 6)