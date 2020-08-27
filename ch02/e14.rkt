#lang racket


(define (make-interval a b) (cons a b))


(define (make-interval-center-percent c pct) 
  (let ((width (* c (/ pct 100.0)))) 
    (make-interval (- c width) (+ c width))))


(define (upper-bound interval) (max (car interval) (cdr interval)))


(define (lower-bound interval) (min (car interval) (cdr interval)))


(define (center i) (/ (+ (upper-bound i) (lower-bound i)) 2))


(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))


(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))


(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))


(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

(define small (make-interval-center-percent 1 0.5)) 
(par1 small small)
(par2 small small)
(define big (make-interval-center-percent 1000 500)) 
(par1 big big)
(par2 big big)

