#lang racket
(require (planet dyoo/simply-scheme:2:2))

; define cons, car, and cdr using procedures

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))



(define test (cons 2 3))
(car test)
(cdr test)

; exercise 2.17, define procedure last-pair that returns the last item of a non-empty list
(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(define my_list (list 1 2 3 4 5))
; hmmm, the list implementation doesn't seem to work in this version of scheme... bummer.
;(car my_list)
;(last-pair my_list)

; exercise 2.18, given a list in scheme, take the values in a list and return a reversed list
; perhaps this is an example or returning a reversed linked list
