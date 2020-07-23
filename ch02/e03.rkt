#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Point (Concrete)
;;
;; This is just a convenience.
;; This is basically a list in the following order:
;; 1st x coordinate.
;; 2nd y coordinate.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (pnt-new x y)(cons x y))

(define (pnt-x p) (car p))

(define (pnt-y p) (cdr p))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rectangle (Abstract)
;;
;; Clients use the procedures of this abstract
;; rectangle to get area and perimeter.
;;
;; This is basically a list in the following order:
;; 1st is user-defined data.
;; 2nd is user-defined procedure for getting width.
;; 3rd is user-defined procedure for getting height.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (rect-new this w-getter h-getter)
  (cons  this ( cons w-getter h-getter)))

(define (rect-this o)
  (car o))
  
(define (rect-w-getter o)
  (car (cdr o)))

(define (rect-h-getter o)
  (car (cdr o)))

(define (rect-w o)
  ((rect-w-getter o) (rect-this o)))

(define (rect-h o)
  ((rect-h-getter o) (rect-this o)))

(define (rect-area o)
  (* (rect-w o) (rect-h o)))

(define (rect-perimeter o)
  (* 2 (+ (rect-w o) (rect-h o))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RectByPointWH extends Rectangle (Concrete)
;;
;; This implementation models rectangles by:
;; - one point
;; - width
;; - height
;;
;; The ctor is responsible for calling the super's ctor!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (rect-by-point+wh-new p0 w h)
  (rect-new (cons p0 (cons w h))  rect-by-point+wh-w rect-by-point+wh-h))

(define (rect-by-point+wh-w r) (car (cdr r)))

(define (rect-by-point+wh-h r) (cdr (cdr r)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RectBy2Points extends Rectangle (Concrete)
;;
;; This implementation models rectangles by 2 points.
;; By using let in the ctor, we are hiding the procedures,
;; from global public usage.
;; For instance rect-by-2-points-w is entirely local.
;; Pnt-diff was created to show, that because of the
;; evaluation rules for let, if we want to use pnt-diff,
;; then we must define it in an enclosing scope.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (rect-by-2-points-new p0 p1)
  (let ((pnt-diff (lambda (accessor p0 p1) (- (accessor p1) (accessor p0)))))
  (let (
        (rect-by-2-points-w (lambda (this) (pnt-diff pnt-x (car this) (cdr this))))
        (rect-by-2-points-h (lambda (this) (pnt-diff pnt-y (car this) (cdr this))))
        )
    (rect-new (cons p0 p1) rect-by-2-points-w rect-by-2-points-h)
    )))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(let (
      (a (rect-by-2-points-new (pnt-new 5 0) (pnt-new 10 4)))
      (b (rect-by-point+wh-new (pnt-new 5 0) 5 4))
      )
  (display "rect-by-2-points Area: ")
  (display (rect-area a))
  (newline)
  (display "rect-by-2-points Peri: ")
  (display (rect-perimeter a))
  (newline)
  (display "rect-by-point+wh Area: ")
  (display (rect-area b))
  (newline)
  (display "rect-by-point+wh Peri: ")
  (display (rect-perimeter b)))