#lang racket
(require (planet dyoo/simply-scheme:2:2))

; exercise 2.24
(list 1 (list 2 (list 3 4)))

; exercise 2.25
(define x (list 1 3 (list 5 7) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 ( list 6 7)))))))
; extract the 7 using car and cdr
(car(cdr(car(cdr(cdr x)))))
(car(car y))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr z))))))))))))

; exercise 2.26
(define a (list 1 2 3))
(define b (list 4 5 6))
; print the following
(append a b)
(cons a b)
(list a b)


