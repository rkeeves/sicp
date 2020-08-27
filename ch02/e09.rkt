#lang racket
(define (add-interval x y)
(make-interval (+ (lower-bound x) (lower-bound y))
(+ (upper-bound x) (upper-bound y))))


(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

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

(define (sub-interval x y)
  (add-interval x (make-interval (- (lower-bound y)) (- (upper-bound y)))))

(define (width-interval i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
;; Addition
;; (a,b) + (c,d) = (a+c,b+d)
;;
;; pair      | width
;; (a,b)     | (b-a)/2
;; (c,d)     | (d-c)/2
;; (a+c,b+d) | ((b+d)-(a+c))/2 = (b-a)/2+(d-c)/2
(let (
      (a (make-interval 2 4))
      (b (make-interval 1 2))
      )
  (display "Add: ")
  (display (width-interval (add-interval a b)))
  (display " = ")
  (display (+ (width-interval a) (width-interval b)))
  (newline))

;; Subtraction
;; (a,b) + (c,d) = (a-c,b-d)
;; pair      | width
;; (a,b)     | (b-a)/2
;; (c,d)     | (d-c)/2
;; (a-c,b-d) | ((b-d)-(a-c))/2 = (b-a)/2-(d-c)/2
(let (
      (a (make-interval 2 4))
      (b (make-interval 1 2))
      )
  (display "Sub: ")
  (display (width-interval (sub-interval a b)))
  (display " = ")
  (display (- (width-interval a) (width-interval b)))
  (newline))

(let (
      (a (make-interval 2 4))
      (b (make-interval 1 2))
      )
  (display "Mul: ")
  (display (width-interval (mul-interval a b)))
  (display " = ")
  (display (* (width-interval a) (width-interval b)))
  (newline))

(let (
      (a (make-interval 2 4))
      (b (make-interval 1 2))
      )
  (display "Div: ")
  (display (width-interval (div-interval a b)))
  (display " = ")
  (display (* (width-interval a) (width-interval b)))
  (newline))