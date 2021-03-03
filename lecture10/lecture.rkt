#lang racket
(require (planet dyoo/simply-scheme:2:2))

; map a list of sentences:
; map `first` procedure on every sentence in the provided list - return list of words
(map first '((john lennon) (paul mccartney) (george harrison) (ringo starr)))


; let's look at an example where reversing a list of sentences goes wrong
(define (reverse seq)
  (if (null? seq)
      '()
      (cons (reverse (cdr seq)) (car seq))))

; you'll get a strange output - this is because cons behaves appropraitely if the second argument is a list, not a word
(reverse '(a b c d))

; let's fix this
(define (_reverse seq)
  (if (null? seq)
      '()
      (append (_reverse (cdr seq)) (list (car seq)))))

; this works because used append to a list constructor
; what this does is take a list of cdr reverse and append the item in list of car
(_reverse '(a b c d))

; reverse is one of those functions that actually gets easier to read in an iterative process rather than a recursive process

; MAPS - the output of maps, unlike `every`, can itself be a list of lists
; i.e. this will return a list of lists
(map bf '((she loves you) (i want to tell you) (magical mystery tour)))
; every element in the second argument of a map must be in the domain of the first argument of map
; for example this will also work because `bf` works for words and lists of words (sentences)
(map bf '((she loves you) help! (i want to tell you) (magical mystery tour)))

; e.g. if I had `square` as  the first argument in map, then the second argument must be a list of number








