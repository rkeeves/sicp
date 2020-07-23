#lang racket

(define (average a b) (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))


(define tolerance 0.00001)


(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))


(define (compose f g)
  (lambda (x) (f (g x))))


(define (repeated f k)
  (define (internal prod i)
    (if (= i 0)
        prod
        (internal (compose prod f) (- i 1))))
  (internal f (- k 1)))

(define (sqrt x)
  (fixed-point-of-transform
   (lambda (y) (/ x y)) average-damp 1.0))

(define (pow a n)
  (define (iter acc n)
    (if (= n 0)
        acc
        (iter (* a acc) (- n 1))))
  (iter 1 n))

(define (find-pow n)
  (define (iter i)
    (if (> (pow 2 i) n)
        (- i 1)
        (iter (+ i 1))))
    (iter 0))

(define (n-th-root x n)
  (fixed-point-of-transform (lambda (y) (/ x (pow y (- n 1)))) (repeated average-damp (find-pow n)) 1.0))


(n-th-root 32 5)