#lang racket

;; Small Carmichael's numbers
;; 561, 1105, 1729, 2465, 2821, 6601


(define (square x) (* x x))

(define (fermat? n a)
      (= (expmod a n n) a))

(define (fermat-test-full n)
  (define (f n a max)
     (cond ((> a max) #t)
           ((fermat? n a) (f n (+ 1 a) max))
           (else #f)))
  (f n 1 (/ n 2)))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))
;; Non Carmichel
(fermat-test-full 10)
(fermat-test-full 155)
(fermat-test-full 121)
;; Carmichel
(fermat-test-full 561)
(fermat-test-full 1105)
(fermat-test-full 1729)
(fermat-test-full 2465)
(fermat-test-full 2821)
(fermat-test-full 6601)
