#lang racket

 (struct student (name id# dorm))

 (struct cities (name long lat))

 (define neighbors (city)
    "Find all cities within 1000 kilometers."
    (find-all-if #'(lambda (c)
            (and (not (eq c city))
                (< (air-distance c city) 1000.0)))
        *cities*))
        
(define city (name)
    "Find the city with this name."
    (assoc name *cities*))

