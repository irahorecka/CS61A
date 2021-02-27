#lang racket
(require (planet dyoo/simply-scheme:2:2))

; let's build a procedure that returns a procedure
(define (make-adder num)
  (lambda (x) (+ x num)))

(define plus3 (make-adder 3))  ; no paranethesis, no implicit lambda
(define plus5 (make-adder 5))

(plus3 8)
(plus5 20)
(plus5 (plus3 2)) ; notice I can string these funcs together as arguments


; another iteration of this principle
; define compose, that takes two funcs and return the composed func
; i.e. f(x) g(x) --> f(g(x))

(define (compose f g)
  (lambda (x) (f (g x))))

; let's see it in action
; so what this does is takes the but first of sentence then returns its first
((compose first bf) '(she loves you))


; we can take another example
(define (square x)
  (* x x))


(define (twice f) (compose f f ))

; now let's take the square of the square of a num
((twice square) 4)

; let's see the use of 'let' in action
(define (roots a b c)
  (let ((d (sqrt (- (* b b) (* 4 a c))))
	; notice I am still in the scope of let
	(-b (- b))
	(2a (* 2 a))) ; scheme is weird in that we can define a var as 2a
    	; still in scope of let...
     (se (/ (+ -b d) 2a)
	 (/ (- -b d) 2a) ))) ; notice we were in the scope of let pretty
	; much the entire time we were in the define scope

(roots 1 3 5)







