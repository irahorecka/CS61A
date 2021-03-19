#lang racket
(require (planet dyoo/simply-scheme:2:2))

; SECTION 2.3.1
; symbols can be invoked as follows:
(define a 1)
(define b 2)

(list a b)
(list 'a b)
(list a 'b)

(car '(a b c))
(cdr '(a b c))

; we can determine whether two symbols are equal:
(eq? 'a 'b)

; we can use the primitive `eq?` to determine if an item in a list contains a symbol

(define (memq item x)
  (cond ((eq? x '()) false)
	((eq? (car x) item) x)
	(else (memq item (cdr x)))))

(memq 'apple '(pear orange banana))
(memq 'apple '(x (apple sauce) y apple pear))

; SECTION 2.3.3
; sets as unordered list

; define if element `x` is in `set`
; takes O(n)
(define (element-of-set? x set)
  (cond ((eq? set '()) false)
	((eq? (car set) x) true)
	(else (element-of-set? x (cdr set)))))

; define whether to add `x` to `set` if `x` not in `set`
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

; define intersection of two sets
; takes O(n2) (O(n) from `element-of-set?` and O(n) from intersection-set)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1) (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(define set1 (list 1 2 3 4))
(define set2 (list 3 4 5 6))
; should return '(3 4)
(intersection-set set1 set2)


; sets as ordered list

; redefine element-of-set?
(define (_element-of-set? x set)
  (cond ((null? set) false)
	((= x (car set)) true)
	((> x (car set)) false)
	(else (_element-of-set? x (cdr set)))))

; redefine intersection-set to have an O(n) time complexity when paired with _element-of-set?
(define (_intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
	  '()
	  (let ((x1 (car set1)) (x2 (car set2)))
	    (cond ((= x1 x2)
		   (cons x1 (_intersection-set (cdr set1) (cdr set2))))
		  ((< x1 x2)
		   (_intersection-set (cdr set1) set2))
		  ((< x2 x1)
		   (_intersection-set set1 (cdr set2)))))))

(define _set1 (list 1 2 3 4))
(define _set2 (list 3 4 5 6))
; should return '(3 4)
(_intersection-set _set1 _set2)
