#lang racket

(define (gcd a b)
    (if (= b 0)
    a
    (gcd b (remainder a b))))

(gcd 20 5)
(gcd 20 3)