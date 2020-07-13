(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Normal Order - 18
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(gcd 206 40)
;; remainder applications 0 
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;; remainder applications 0 
(gcd 40 (remainder 206 40))
;; remainder applications 0 
(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;; remainder applications 0 
(if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;; remainder applications 1
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;; remainder applications 1 
(if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; remainder applications 1 
(if (= (remainder 40 6) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; remainder applications 2 
(if (= 4 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; remainder applications 3
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; remainder applications 3
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; remainder applications 3
(if (= (remainder 6 (remainder 40 (remainder 206 40))) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; remainder applications 4
(if (= (remainder 6 (remainder 40 6)) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; remainder applications 5
(if (= (remainder 6 4) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; remainder applications 6
(if (= 2 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; remainder applications 7
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; remainder applications 7
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; remainder applications 7
(if (= (remainder (remainder 40 6) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; remainder applications 8
(if (= (remainder 4 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; remainder applications 9
(if (= (remainder 4 (remainder 6 (remainder 40 (remainder 206 40)))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; remainder applications 10
(if (= (remainder 4 (remainder 6 (remainder 40 6))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; remainder applications 11
(if (= (remainder 4 (remainder 6 4)) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; remainder applications 12
(if (= (remainder 4 2) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; remainder applications 13
(if (= 0 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;; remainder applications 14
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;; remainder applications 15
(remainder 6 (remainder 40 (remainder 206 40)))
;; remainder applications 16
(remainder 6 (remainder 40 6))
;; remainder applications 17
(remainder 6 4)
;; remainder applications 18
2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Applicative Order - 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(gcd 206 40)
;; remainder applications 0
(gcd 40 (remainder 206 40))
;; remainder applications 0
(gcd 40 6)
;; remainder applications 1
(gcd 6 (remainder 40 6))
;; remainder applications 1
(gcd 6 4)
;; remainder applications 2
(gcd 4 (remainder 6 4))
;; remainder applications 2
(gcd 4 2)
;; remainder applications 3
(gcd 2 (remainder 4 2))
;; remainder applications 3
(gcd 2 0)
;; remainder applications 4
2