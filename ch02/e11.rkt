#lang racket

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x (make-interval (- (lower-bound y)) (- (upper-bound y)))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (span-interval i)
  (- (upper-bound i) (lower-bound i)))

(define (div-interval x y)
  (if (= (span-interval y) 0)
      (error "Div by 0 span interval")
  (mul-interval-1
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y))))))

(define (mul-interval-1 x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (mul-interval-2 x y)
  (define (sign-of lo hi)
    (cond ((>= lo 0) 1)
          ((<= hi 0) -1)
          (else 0)))
  (define (sign-of-interval i)
    (sign-of (lower-bound i) (upper-bound i)))
  (let (
        (sx (sign-of-interval x))
        (sy (sign-of-interval y))
        (x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y))
        )
    (cond [(= sx  1)
           (cond [(= sy  1) (make-interval (* x1 y1) (* x2 y2))]
                 [(= sy -1) (make-interval (* x2 y1) (* x1 y2))]
                 [else (make-interval (* x2 y1) (* x2 y2))])]
          [(= sx -1)
           (cond [(= sy  1) (make-interval (* y2) (* y1))]
                 [(= sy -1) (make-interval (* y2) (* y1))]
                 [else (make-interval (* x1 y2) (* x1 y1))])]
          [else
           (cond [(= sy  1) (make-interval (* x1 y2) (* x2 y2))]
                 [(= sy -1) (make-interval (* x2 y1) (* x1 y1))]
                 [else (make-interval (min (* x1 y2) (* x2 y1)) 
                                              (max (* x1 y1) (* x2 y2)))])])))


(let (
      (a (make-interval -1 1))
      (b (make-interval 2 2)))
  (display (mul-interval-1 a b))
  (display (mul-interval-2 a b)))