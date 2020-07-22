#lang racket

(define (square x) (* x x))



(define (fermat-test n expmod-impl)
  (define (try-it a expmod-impl)
    (= (expmod-impl a n n) a))
  (try-it (+ 1 (random (- n 1))) expmod-impl))

(define (fast-prime? n times expmod-impl)
  (cond ((= times 0) true)
        ((fermat-test n expmod-impl) (fast-prime? n (- times 1) expmod-impl))
        (else false)))

(define (expmod-base base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod-base base (/ exp 2) m))
          m))
        (else
         (remainder (* base
                       (expmod-base base (- exp 1) m))
                    m))))

(define (expmod-other base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod-other base (/ exp 2) m)
                       (expmod-other base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod-other base (- exp 1) m))
                    m))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compared to the base solution the rewritten second one
;; branches out into two expmod applications each time.
;; The base case runs in log N.
;; The rewritten grows exponentially with the depth of
;; the tree which is log N.
;; e^(log N) = N so it becomes linear, therefore worse
;; than the original.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(time (fast-prime? 1000087 100 expmod-base))
(time (fast-prime? 1000087 100 expmod-other))