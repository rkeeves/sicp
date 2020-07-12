#lang racket
;; Given the definition of
(define (p) (p))
;; and
(define (test x y)
  (if (= x 0) 0 y))
;; Describe what happens when applicative order or normal order evaluation is used
;; to evaluate the following expression
(test 0 (p))

;; CASE - Normal Order
(test 0 (p)) ;; the evaluation of arguments is deferred until they are actually needed
(if (= 0 0) 0 (p)) ;; test gets "replaced" by its body
(if #t 0 (p)) ;; if is a special form, first the conditional gets evaluated
              ;; and based on that only one of the expressions gets evaluated
0
;; CASE - Applicative Order
(test 0 (p)) ;; before "substituting the body" the interpreter evaluates the args
(test 0 (p)) ;; 0 is a primitive expression
(test 0 (p)) ;; (p) is an expression which calls p
(test 0 (p)) ;; call to p returned a call to p
;; This never terminates