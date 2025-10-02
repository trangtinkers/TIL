#lang racket

 (struct city (name long lat))

 (define cities)

 (define neighbors (city)
    "Find all cities within 1000 kilometers."
    (find-all-if #'(lambda (c)
            (and (not (eq c city))
                (< (air-distance c city) 1000.0)))
        *cities*))
        
(define city (name)
    "Find the city with this name."
    (assoc name *cities*))