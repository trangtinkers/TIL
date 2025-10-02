#lang racket

 (struct city (name long lat))

 (define cities)

; this code is still written in lisp
 (define (neighbors city)
    ;Find all cities within 1000 kilometers.
    (find-all-if #'(lambda (c)
            (and (not (eq c city))
                (< (air-distance c city) 1000.0)))
        *cities*))
        
(define city (name)
    "Find the city with this name."
    (assoc name *cities*))

;; calculating air-distance

(define (air-distance city1 city2)
        ...)
(define (distance point1 point2)
        ...)
