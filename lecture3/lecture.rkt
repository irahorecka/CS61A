#lang racket
(require (planet dyoo/simply-scheme:2:2))

(define (sumsquare a b)
  (if (> a b)
      0
      (+ (* a a) (sumsquare (+ a 1) b)) ))

(sumsquare 10 109)


(define (sumcube a b)
  (if (> a b)
      0
      (+ (* a a a) (sumcube (+ a 1) b)) ))

(sumcube 10 109)


; we can now combine this into one function by passing in a function
; perhaps we can say lisp treats functions as first class objects
(define (sum fn a b)
  (if (> a b)
      0
      (+ (fn a) (sum fn (+ a 1) b)) ))

(define (cube a)
  (* a a a))

(sum cube 1 100)
(sum (lambda (a) (* a a a)) 1 100) ; though not covered, lambda can be invoked
; to pass an invoked function into an argument. it generates procedures. 
; when you call lambda, the arguments are not invoked when you call it.
; so in our case, we do not have to make a func called cube just to pass it
; to sum









