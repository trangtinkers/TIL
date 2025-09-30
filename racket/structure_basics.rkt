#lang racket  

(struct student (name id# dorm))

(define freshman1 (student 'Joe 1234 'NewHall))

;(student-name freshman1)
;(student-id# freshman1)

(struct student-body (freshmen sophomores juniors seniors))

(define all-students
    (student-body (list freshman1 (student 'Mary 0101 'OldHall))
                (list (student 'Jeff 5678 'OldHall))
                (list (student 'Bob 4321 'Apartment))
                empty))

(student-name (first (student-body-freshmen all-students)))
(student-name (second (student-body-freshmen all-students)))
(student-name (first (student-body-juniors all-students)))
