#lang racket
(require (planet dyoo/simply-scheme:2:2))

; an alternate view of deep-map procedure from what we saw in lecture 12
(define (deep-map fn lol)
  (if (list? lol)
      (map (lambda (element) (deep-map fn element))
	   lol)
      (fn lol)))

; example usage
(define lol '((john lennon) (paul mccartney) (george harrison) (ringo starr)))
(deep-map bf lol)  ; apply mapping of word procedure to every word item in a deep list

