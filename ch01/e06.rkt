#lang racket

;; Could we "wrap" the if special form within the following procedure?
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;; No.
;; This will defeat the main advantage of the if special form.
;; The interpreter, even though it might be using any evaluation strategy,
;; always evaluates the conditional first then,
;; based on the conditional, only one of the expressions.

;; The full example is the use case of
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
;; Because of the wrapping both branches of new-if get
;; evaluated despite the result of the conditional.
;; One of these branches is sqrt-iter, a call to itself.
;; Therefore the function has will never terminate.
;;
;; We can also rephrase it like this:
;; even though we provided a "base case" (if goo enough then return and break the recursion)
;; because of the evaluation "strategy" involved it simply cannot cause the end of the recursion.