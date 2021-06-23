#lang racket
(require (planet dyoo/simply-scheme:2:2))


; example of using message passing
(define (make-square side)
  (lambda (message) 
    (cond ((eq? message 'area)
	   (* side side))
	  ((eq? message 'perimeter)
	   (* 4 side))
	  (else (error "unknown message")))))

(define my-square (make-square 5))
(my-square 'perimeter)

; using syntactic sugar to make the call more pleasant to write
; define a generic operator
(define (operate op obj)
  (obj op))

; define the area procedure, using the generic operator in the body
(define (area obj)
  (obj 'area))

(area my-square)
