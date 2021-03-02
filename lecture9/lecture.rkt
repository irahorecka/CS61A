#lang racket
(require (planet dyoo/simply-scheme:2:2))

; an introduction to cons, car, and cdr

; note: the output is simply 3 and 5, the rest are for visual punctuation
(cons 3 5)

; a more unexpected result
; note, we do not get the punctuation we are expecting
; rather, we get '(3 4 5)
; what this is is essentially a linked list
(cons 3 (cons 4 (cons 5 '())))

; okay, what if we tried a sequence of linked list with a value in the terminal cdr 
; we get '(3 4 5 . 6)
(cons 3 (cons 4 (cons 5 6)))

; but if we tried this:
; we get '((3 5) 2 1)
(cons '(3 5) '(2 1))

; using the list constructor, which joins the elements together without the abstraction of car and cdr
(list '(3 5) '(1 2))

; append will make a list of the arguments of a list
(append '(3 5) '(9 8))
