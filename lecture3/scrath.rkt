#lang racket
(require (planet dyoo/simply-scheme:2:2))

; this is a quick scratchpad for literature demo purposes

; how about making a simple lambda rep
(define (apply_func func a b)
  (func a b))

; execute using a lambda
(apply_func (lambda (a b) (+ a b)) 3 5)
