#lang racket
(require (planet dyoo/simply-scheme:2:2))

; homework for week 3
; 1.16
; an example of a recursive O(logn) exponential recursive process
(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

; define `fast-exp` iteratively
(define (iter-fast-expt b n)
  (define (iter count a b n)
    (cond ((= count n) a)
	  ((even? n) (iter (+ count 1) (* a (square (/ n 2))) b n))
	  (else (iter (+ count 1) (* b a) b n))))
  ; (trace iter)
  (iter 0 1 b n)
  )

; auxiliary functions
(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

; (trace fast-expt)
(fast-expt 2 3)
(iter-fast-expt 2 3)

; 1.35, 1.37, 1.38, discussion about fixed-point procedure, golden ratios, and k-finite continued fractions - will skip for now

; 2. - compute perfect number
(define (next-perf n)
  (define (iter a n count)
    (cond ((= count n) a)
	  ((= (remainder n count) 0)
	   (iter (append a (list count)) n (+ count 1)))
	  (else (iter a n (+ count 1)))))
  ;(trace iter)
  (if (equal? (sum-of-factors (iter '() n 1)) n)
      n
      (next-perf (+ n 1)))
  )

(define (sum-of-factors n)
  (if (empty? n)
      0
      (+ (car n) (sum-of-factors (cdr n))))
  )

;(trace next-perf)
(next-perf 1)
(next-perf 7)
(next-perf 29)

; 3. - stumped! 
(define (count-change amount)
  (cc amount 5))

(define (_count-change amount)
  (_cc amount 5))

(define (cc amount kinds-of-coins)
  (cond 
    ((or (< amount 0) (= kinds-of-coins 0)) 0)
    ((= amount 0) 1)
	(else (+ (cc amount
		     (- kinds-of-coins 1))
		 (cc (- amount
			(first-denomination kinds-of-coins))
		     kinds-of-coins)))))

(define (_cc amount kinds-of-coins)
  (cond
    ((= amount 0) 1)
    ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))

(define (cc-iter fn1 fn2 num)
  (define (iter n count)
    (display (fn1 n)) (display ':) (display (fn2 n)) (display ':) (display n) (newline)
    (if (= count 100)
	n
	(iter (+ n 1) (+ count 1))))
  (iter num 1))

(cc-iter count-change _count-change -10)

; 4. - this is a sentence-based question. skip





