#lang racket

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;; How can 1 be represented?
;; Work back from (add-1 zero)
;; Also, we will use a shorter notation than Racket for lambdas
;; zero: \f.\x.x
;; add-1: \f.\x.(f ((n f) x))
;;
;; (add-1 zero)
;; (add-1 \f.\x x)
;; ((\f.\x.f((n f) x)) (\f.\x x))
;; (\f.\x.f(((\f.\x x) f) x))
;; (\f.\x.f((\x x) x))
;; (\f.\x.f x))
(define one (lambda (f) (lambda (x) (f x))))
;; How can 2 be represented?
;; Work back from (add-1 (add-1 zero))
;; zero: \f.\x.x
;; add-1: \f.\x.(f ((n f) x))
;;
;; (add-1 (add-1 zero))
;; (add-1 (\f.\x.(f ((zero f) x))))
;; renaming (alpha-convert) of add-1 to avoid collision
;; (\g.\y.(g (((\f.\x.(f ((zero f) x))) g) y)))
;; (\g.\y.(g (((\f.\x.(f ((\f.\x.x f) x))) g) y)))
;; (\g.\y.(g (((\f.\x.(f ((\x.x x))) g) y)))
;; (\g.\y.(g (((\f.\x.(f (x)) g) y)))
;; (\g.\y.(g ((\x.(g (x)) y)))
;; (\g.\y.(g (g (y)))
;; renaming (alpha-convert) back from g, y to f, x
;; (\f.\x.(f (f x)))
(define two (lambda (f) (lambda (x) (f (f x))))) 
;; How can addition be represented?
;; What we want:
;; zero:
;; \f.\x.x
;; one:
;; \f.\x.(f x)
;; a+b:
;; \a.\b.\f.\x.( (a f) ((b f) x))
;; 0+1:
;; \b.\f.\x.( (\x.x) ((b f) x))
;; \f.\x.( (\x.x) (f x))
;; \f.\x.(f x)
;; 1+1:
;; \b.\f.\x.( (\f.\x.(f x) f) ((b f) x))
;; \b.\f.\x.( (\x.(f x) ) ((b f) x))
;; \f.\x.( (\x.(f x) ) ((\f.\x.(f x) f) x))
;; \f.\x.( (\x.(f x) ) (f x))
;; \f.\x.(f (f x))
(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (succ x) (+ 1 x))

((zero succ) 0)

((one succ) 0)

((two succ) 0)

(((add one two) succ) 0)

(((add one (add one two)) succ) 0)