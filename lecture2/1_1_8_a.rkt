#lang racket
(require (planet dyoo/simply-scheme:2:2))

; build square root alg with approx of 0.001
; NOW, LET'S USE LEXICAL SCOPING TO REMOVE FORMAL PARAMETER X IN SCOPE OF AUX FUNCS
; NOTICE WE ABSRACTED X FROM FORMAL PARAMETERS WITHIN SCOPE'S AUX FUNCTIONS

(define (sqrt x)
    (define (good_enough? guess)
        (< (abs (- (square guess) x)) 0.001))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (sqrt_iter guess)
        (if (good_enough? guess)
            guess
            (sqrt_iter (improve guess))))
    (define (square x)
        (* x x))
    (define (average x y)
        (/ (+ x y) 2))
    (sqrt_iter 1.0)
)

(sqrt 110003984)