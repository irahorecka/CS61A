#lang racket
(require (planet dyoo/simply-scheme:2:2))

; Exercise 1.41
; make a func that takes a procedure and applies it twice
(define (double func)
  (lambda (arg) (func (func arg))))

(define (inc a)
  (+ a 1))

(inc 1)
((double inc) 5)
(((double (double double)) inc) 5)

; Exercise 1.42
; make a function that takes two function and implements composition
; e.g. x -> f(g(x))

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (arg) (f (g arg))))

((compose square inc) 5)

; Exercise 1.43
; make a repeater func like so
; ((repeated square 2) 5)
; >>> 625
; hmmm... i don't know!

(define (repeater func increment)
  (define _increment (- increment 1))
  (cond ((> _increment 0)
      ((repeater func _increment))))
  (lambda (arg) (func arg)))

((repeater square 2) 5)
