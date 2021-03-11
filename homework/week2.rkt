#lang racket
(require (planet dyoo/simply-scheme:2:2))

; homework for week 2

; 1.31a
(define (square x)
    (* x x))

(define (product fn low high)
  (if (= low high)
      (fn high)
      (* (fn low) (product fn (+ low 1) high))))

(product square 1 4)

; 1.32a
; define a simple accumulator
(define (accumulator op low high)
  (if (= low high)
      low
      (op low (accumulator op (+ low 1) high))))

(accumulator * 1 10)
(accumulator + 1 10)

; 1.33a and b, with my own twist
; define a filter-accumulate, where you can add a filter predicate
(define (filter-accumulate pred op base low high)
  (cond ((= low high) (if (pred low) low base))
        ((pred low)
      	  (op low (filter-accumulate pred op base (+ low 1) high)))
      	(else
	  (filter-accumulate pred op base (+ low 1) high))))

(filter-accumulate even? + 0 0 4)
(filter-accumulate even? * 1 1 5)
(filter-accumulate odd? + 0 0 4)
(filter-accumulate odd? * 1 1 5)

; 1.40 - too much calculus; pass
; 1.41 - define `double`, which applies said procedure twice
(define (double proc)
  (lambda (arg) (proc (proc arg))))

(define (inc item)
  (+ 1 item))

((double inc) 3)  ; test
(((double (double double)) inc) 5)  ; the answer is 21

; 1.42
; compose a function such that we can create (f(g(x)))
(define (compose func1 func2)
  (lambda (arg) (func1 (func2 arg))))

((compose square inc) 6)

; 1.43
(define (repeated func n)
  (if (= n 1)
      func
      (lambda (arg) (func ((repeated func (- n 1)) arg)))))

((repeated square 1) 5)

; 1.46
; iterative improve, too long to write at the moment - skip.

; 2.
(define (every proc items)
  (if (empty? items)
      '()
      (se (proc (first items)) (every proc (bf items)))))

(every square '(1 2 3 4 5))
(every first '(nowhere man))


; extra for experts
(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

(fact 5)
; now, define above without using define
(  (  (lambda (f) (lambda (n) (f f n)))
          (lambda (fun x)
	    	(if (= x 0)
		    	    1
			    	    (* x (fun fun (- x 1)))))  )
    5)

