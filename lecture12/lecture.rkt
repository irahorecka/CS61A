#lang racket
(require (planet dyoo/simply-scheme:2:2))

; create abstract selectors for trees using pairs
(define make-tree cons)
(define datum car)
(define children cdr)

(define (leaf? node)
  (null? (children node)))

(define (leaves . seq)
  (map (lambda (x) (make-tree x'())) seq))

; an example of a tree built this way
(define t1
  (make-tree 1
	     (list (make-tree 2 (leaves 3 4))
		   (make-tree 5 (leaves 6 7 8)) )))

t1

; define a simple square procedure
(define (square x)
  (* x x))

; define a treemap procedure that maps a procedure to the elements of a tree
(define (treemap fn tree)
  ; ignoring the use of `datum` and `child` for `car` and `cdr` would be breaking the abstraction of selectors we chose to deal with trees, which is what we are dealing with here.
  (make-tree (fn (datum tree))
	     ; note, we use `map` here because we are dealing with a > 1 argument function (treemap)
	     (map (lambda (child) (treemap fn child))
		  (children tree) )))

(treemap square t1)


; here, we'll define another rendition of the treemap function without a deliberate call to `map`
; notice the mutual recursion here between forest-map and _treemap
(define (_treemap fn tree)
  (make-tree (fn (datum tree))
	     (forest-map fn (children tree))))

(define (forest-map fn forest)
  (if (null? forest)
      '()
      ; notice we don't use `datum` and `children`, as this would be breaking our tree abstraction because forests aren't trees.
      (cons (_treemap fn (car forest))
	    (forest-map fn (cdr forest)))))

(treemap square t1)





