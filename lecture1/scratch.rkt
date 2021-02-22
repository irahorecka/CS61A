; ~~~~~ LECTURE 1 ~~~~~
#lang racket
(require (planet dyoo/simply-scheme:2:2))

; this is the first test
(butfirst (butfirst '(hello bob)))

; this is a comment
(butlast '(hello my name is ira))

; try first
(first 'hello)

; define a square
(define (square x)
    (* x x))

(square (+ 2 3))

; concat s to end
(define (plural wd)
    (word wd 's))  ; word here is a primitive function

(plural 'computer)
(plural 'boy)
(plural 'book)

; use conditional to differentiate s from ies
(define (plurals wd)
    (if (equal? (last wd) 'y)  ; if
        (word (butlast wd) 'ies)
        (word wd 's)))  ; else

(plurals 'book)
(plurals 'fly)

; get middle of word (e.g. get third char)
(item 3 'computer)

; define a pig-latin program
(define (pigl wd)
    (if (pl-done? wd)
    ; recursion must have a conditional of some sort for an exit strategy
    (word wd 'ay)
    (pigl (word (bf wd) (first wd)))))  ; notice this is recursion
(define (pl-done? wd)
    (vowel? (first wd)))
(define (vowel? letter)
    (member? letter '(a e i o u)))

; let's try this out
(pigl 'Johnathon)
(pigl 'Titanic)
(pigl 'scheme)
