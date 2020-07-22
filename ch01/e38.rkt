#lang racket

(define (cont-frac-iterative n d k)
  (define (f i acc)
  (if (< i 0)
      acc
      (f (- i 1) (/ (n i) (+ (d i) acc)))))
  (f k 0))

(define (euler-d i)
  (if (= (remainder i 3) 1)
      (* (/ (+ i 2) 3) 2)
      1))

(define (looper f i k)
  (cond ((> i k) (newline))
         (else 
               (display (f i))
               (display ", ")
               (looper f (+ i 1) k))))

(looper euler-d  0 20)

(define (eulers-number steps)
  (+ 2 (cont-frac-iterative (lambda (i) 1.0)
           euler-d
           steps)))

(eulers-number 100)





