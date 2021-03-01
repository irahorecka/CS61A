#lang racket
(require (planet dyoo/simply-scheme:2:2))


; a look into timing algorithms with two recursive calls
; sort has the following runtime:
; 	N * (insert worst case runtime) + 2
; 	therefore, the total runtime is:
; 	N * (4 + (7N/2) + 5) + 2
; how did we get 7N/2? On average, insert will take a sentence of length N/2, because it starts with a length 0, and expands to length N
(define (sort sent)
  (if (empty? sent)
      '()
      (insert (first sent)
	      (sort (bf sent)) )))

; imperative that sent is sorted going in
; insert func has the following runtime:
; 	3 if empty sent
; 	5 if num < first sent
; 	7N + 5 while num > first sent (the worst case)
(define (insert num sent)
  (cond ((empty? sent) (se num))
	((< num (first sent)) (se num sent))
	(else (se (first sent) (insert num (bf sent)))) ))


; trace sort and insert procedure to look @ how the algorithm flows
(trace sort)
(trace insert)
; notice how sort is recursed entirely prior to recursing insert
(sort '(6 3 22 55))


; define two recursive procedures, one with an iterative process and one with a recursive process

; recursive
(define (count sent)
  (if (empty? sent)
      0
      (+ 1 (count (bf sent))) ))

; iterative
(define (_count sent)
  (define (iter wds result)
    (if (empty? wds)
	result 
	(iter (bf wds) (+ 1 result)) )) ; this call to iter is what's returned
  (iter sent 0))

(trace count)
(trace _count)
(count '(I want to hold your hand))
(_count '(I want to hold your hand))


; calculating pascal's triangle 

(define (pascal row col)
  (cond ((= col 0) 1)
	((= col row) 1)
	(else (+ (pascal (- row 1) (- col 1))
		 (pascal (- row 1) col) ))))

(trace pascal)
(pascal 10 2)
;(define (new-pascal row col)
;  (nth col (pascal-row row)) )
