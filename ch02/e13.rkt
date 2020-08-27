#lang racket
(define (make-interval a b) (cons a b)) 
(define (upper-bound interval) (max (car interval) (cdr interval))) 
(define (lower-bound interval) (min (car interval) (cdr interval))) 
(define (center i) (/ (+ (upper-bound i) (lower-bound i)) 2)) 
  
;; Percent is between 0 and 100.0 
(define (make-interval-center-percent c pct) 
  (let ((width (* c (/ pct 100.0)))) 
    (make-interval (- c width) (+ c width)))) 
  
(define (percent-tolerance i) 
  (let ((center (/ (+ (upper-bound i) (lower-bound i)) 2.0)) 
        (width (/ (- (upper-bound i) (lower-bound i)) 2.0))) 
    (* (/ width center) 100))) 
  
(define (mul-interval x y) 
  (let ((p1 (* (lower-bound x) (lower-bound y))) 
        (p2 (* (lower-bound x) (upper-bound y))) 
        (p3 (* (upper-bound x) (lower-bound y))) 
        (p4 (* (upper-bound x) (upper-bound y)))) 
    (make-interval (min p1 p2 p3 p4) 
                   (max p1 p2 p3 p4)))) 
;; product of dimension 1 and dimension 2
;; low       : c1*(1-p1)*c2*(1-p2)
;; high      : c1*(1+p1)*c2*(1+p2)
;; center    : (high+low)/2
;; width     : (high-low)/2
;; tolerance : width / center
;;             ((high-low)/2) / ((high+low)/2)
;;             (high-low)/(high+low)
;;             (high+low-2*low)/(high+low)
;;              1-2*low/(high+low)
;;              1-2*low/((1+p1)(1+p2)+(1-p1)(1-p2))
;;                  (1+p1)(1+p2) : 1+p1+p2+p1*p2
;;                  (1-p1)(1-p2) : 1-p1-p2+p1*p2
;;              1-2*low/(2+2*p1*p2)
;;              1-2*(1-p1-p2+p1*p2)/(2+2*p1*p2)
;;              1-(2+2*p1*p2-2*(p1+p2))/(2+2*p1*p2)
;;              1-(1-2*(p1+p2)/(2+2*p1*p2))
;;              (p1+p2)/(1+p1*p2)
;; So if both p1 and p2 are small,
;; their product will be such a small number, that the 2 will dominate the denominator.
;; So their average can be used as a close approx
(define (percent-approx a b)
  (* (+ (tol a) (tol b)) 100))

(define (tol i)
  (let (
        (width (/ (- (upper-bound i) (lower-bound i)) 2))
        (center (/ (+ (upper-bound i) (lower-bound i)) 2)))
    (/ width center)))

(define i (make-interval-center-percent 10 0.5)) 
(define j (make-interval-center-percent 10 0.4))
(define k (mul-interval i j))
(percent-tolerance k)
(percent-approx i j)
