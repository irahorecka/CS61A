#lang racket
(require (planet dyoo/simply-scheme:2:2))

; homework for week 1
; 2.
(define (squares x)
  (if (empty? x)
      '()
      (se (* (first x) (first x)) (squares (bf x)))
      ))

(squares '(1 2 3 4))

; 3.
(define (switch item)
  (se (switch-first (first item))
      (switch-rest (bf item))))

(define (switch-first item)
  (cond ((equal? item 'you) 'I)
	((equal? item 'I) 'you)
	((equal? item 'me) 'you)
	(else item) ))

(define (switch-rest item)
  (if (empty? item)
      '()
      (se (switch-latter (first item)) (switch-rest (bf item)))
      ))

(define (switch-latter item)
  (cond ((equal? item 'you) 'me)
	((equal? item 'I) 'you)
	((equal? item 'me) 'you)
	(else item) ))

(switch '(I want you to want me))

; 4.
(define (ordered? items)
  (cond ((equal? (bf items) '()) 1)  ; you could've also used `empty?`
	((> (first items) (first (bf items))) 0)
	(else (ordered? (bf items)))))

(ordered? '(1 2 3 6 5))
(ordered? '(3 55 3939 292919))

; 5.
(define (ends-e items)
  (cond ((empty? items) '())
	((equal? (last (first items)) 'e)
	 (se (first items) (ends-e (bf items))))
	(else (ends-e (bf items)))
	))

(ends-e '(please put the salami above the blue elephant))

; 6.
; the best way to check if `or` is a special form or an oridnary form  is to run an `or` expression with an unbound identifier. If an error is thrown, then `or` behaves in ordinary form. Else, `or` behaves in a special form
; let's find out
; (or 1 2 abc)  --  unbound identifier error thrown


