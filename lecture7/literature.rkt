#lang racket
(require (planet dyoo/simply-scheme:2:2))

; define the Ackerman mathematical function

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

; let's try some use cases
(A 1 10)
(A 2 4)
(A 3 3)


; defining the fibonacci sequence in a procedure
; this is an example of a tree recursion

(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

; let's try this out
(fib 8)


; an iterative way of defining the fibonacci eq
(define (_fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

; let's test
(_fib 8)

; define a recursive and iterative process to compute problem 1.11
; now i have this so that anything below 3 will be computed as n,
; otherwise, I feel that I will introduce an iterative process, rather than recursive
(define (rec func n)
  (if (< n 3)
      n
      (* n (rec func (- n 1)) )))

; arg... seems wrong.
(define (it func n)
  (define (inner-it func n counter)
  	(if (< counter 3)
      		n
      		(inner-it func (+ n (* n (func (- n 1)))) (- counter 1)) ))
	(inner-it func n n))  

(define (square n)
  (* n n))

(rec square 6)
(it square 6)
