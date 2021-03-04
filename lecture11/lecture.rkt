#lang racket
(require (planet dyoo/simply-scheme:2:2))


; EVALUATE AN EXPRESSION:

; build an eval function - simple
; takes either a number or list as argument, else raise exception
(define (calc-eval exp)
  (cond ((number? exp) exp)
	((list? exp) (calc-apply (car exp) (map calc-eval (cdr exp))))
	(else (error "Calc: bad expression:" exp))))


; the call to `map` here is a multi-way recursive call, with the base case being an empty list (i.e. cdr a single-item list)
; i.e. the map will exhaust the nested list almost immediately, due to its application of the arg procedure to every item in the second arg iterable
; the number base case is called one step at a time when recursed. Not horizontally like the map recursive call
; note just because we reach a base case doesn't mean the recursion is over - it just halts for the given argument, but the depth of recursion can travel horizontally henceforth
; note, the `car` must be a primitive operator + - / *, given we pass in a list of math expressions to be evaluated. These operators prefix every list within the specified criteria.
; the `map` procedure here will follow applicative order and evaluate all primitive operators in `cdr` of the list until all expressions are evaluated prior to calling (map) the parent procedure (calc-apply)


; APPLY A FUNCTION TO ARGUMENTS:

; build calc-apply, as called in above procedure
(define (calc-apply fn args)
  (cond ((eq? fn '+) (accumulate + 0 args))
	((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
			   ((- (length args) 1) (- (car args)))
			   (else (- (car args) (accumulate + 0 (cdr args)))))) ; allows for more than two arguments (both - and /)
	(eq? fn '*) (accumulate * 1 args)) ; * is an accumulator function and multiplies 1 with all args bound to the `*` operator
	((eq? fn '/) (cond ((null? args) 1) 
		     ((* (length args) 1) (/ (car args)))
		     (else (/ (car args) (accumulate * 1 (cdr args))))))
  	(else (error "Calc: bad operator:" fn))))





