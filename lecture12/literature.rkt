#lang racket
(require (planet dyoo/simply-scheme:2:2))

; pg 189
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
	((not (pair? tree))
	 (if (odd? tree) (square tree) 0))
	(else (+ (sum-odd-squares (car tree))
		 (sum-odd-squares (cdr tree))))))

(define (even-fibs n)
  (define (next k)
    (if (> k n)
	'()
	(let ((f (fib k)))
	  (if (even? k)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))


(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1)) (fib (- n 2))))))

; these examples above don't quite fit the signal-cascade structure of enumerate, filter, map, and accumulate that we'd like to see.

; =============================================================
; let's see how we can introduce this signal-flow structure of our two procedures
; first, let's agree to use lists as our signal, an example of mapping for a signal-flow diagram for list is:
(define (square x)
  (* x x))

(map square (list 1 2 3 4 5))

; ==========================================
; let's define a filter signal procedure
(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence) (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))

; test - we should get a list of only even values
(filter even? (list 2 3 4 5 1 23 22))


; ==========================================
; let's define a accumulator signal procedure
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

; test - we should get an accumulation given the operator
(accumulate + 0 (list 1 2 3 4 5))


; ==========================================
; let's define an enumerator over a sequence
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

; test - we should get an enumerated list given a low and high range
(enumerate-interval 0 12)

; we can also define an enumerator for a tree
(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

; test - we should be able to enumerate over a tree object
(define my_tree (list 1 (list 2 (list 3 (list 4 5)))))
(enumerate-tree my_tree)


; ==========================================
; ==========================================
; now, let's define sum-odd-squares in our signal-processing way
(define (_sum-odd-squares tree)
  (accumulate +  ; accumulator
	      0
	      (map square  ; mapper
		   (filter odd?  ; filter
			   (enumerate-tree tree)))))  ; enumerator

; test
(_sum-odd-squares my_tree)


; let's define _even-fibs using our signal-processing design
; write in a way to collect the output elements in a list
(define (_even-fibs n)
  (accumulate cons
	      '()
	      (filter even?
		      (map fib
			   (enumerate-interval 0 n)))))

; test 
(_even-fibs 10)


; we can go as far as to write a procedure to find the fib and square its values given a number
(define (list-fib-squares n)
  (accumulate cons
	      '()
	      (map square
		   (map fib
			(enumerate-interval 0 n)))))

; test
(list-fib-squares 10)



; ==========================================
; TAKE-AWAY, building signal procedures allow for a very modular programming experience, allowing us to plug and play various procedures that have a known conventional interface





