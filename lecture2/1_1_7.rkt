#lang racket
(require (planet dyoo/simply-scheme:2:2))

; build square root alg with approx of 0.001
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)  ; recursion
            x)))

; below is a mock if-statement that mimics if using cond
; (define (new-if predicate then-clause else-clause)
;     (cond (predicate then-clause)
;         (else else-clause)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    ; (display (square guess)) (newline)  ; console out
    ; (display x) (newline)
    ; (< (abs (- (square guess) x)) 0.001))  ; original algorithm without a close-enough implementation
    (if (< (/ (abs (- (square guess) x)) x) 0.00001)  ; the new algorithm with the close-enough implementation
        (= 1 1)  ; emulate true lol
        (< (abs (- (square guess) x)) 0.001)))  ; else go into another round of recursion

; (define (good-enough? guess x)
;     (display guess) (newline)  ; console out
;     (cond ((< (abs (- (square guess) x)) 0.001))
;         ((< (/ (abs (- (square guess) x)) x) 0.00001))))

(define (square x)
    (* x x))

(define (sqrt x)
    (sqrt-iter 1.0 x))

; let's put this to a test... it works!
(sqrt 1100039847932847991329438273982473892472984237490)
; (sqrt 12)
; (sqrt 9)
; (square (sqrt 100))

; (new-if (= 3 2) 0 5)