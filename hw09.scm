
; Tail recursion

(define (replicate x n)
  'YOUR-CODE-HERE
  (define (helper curr n)
   (if (= n 0) curr
		( helper (cons x curr) (- n 1))))
	(helper nil n)
  )
   

(define (accumulate combiner start n term)

  (if (= n 0) start
  (combiner (term n) (accumulate combiner start (- n 1) term)))
)

(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (helper n total)
  (if (= n 0) total
	(helper (- n 1) (combiner total (term n)))))
(helper n start)
)

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  (cons-stream 3 (map-stream (lambda (x) (+ 3 x)) multiples-of-three)))

  


(define (nondecreastream s)
    'YOUR-CODE-HERE
	;(define (helper n)
	;(cond
	;((null? n) nil)
	;((> (car n) (car (cdr-stream n))) (define s (cdr-stream s))(helper (cdr-stream n)))
	;(else (define s (cdr-stream s))(cons (car n) (helper (cdr-stream n))))))
	
	
	
	;(cond
	;((null? s) nil)
	;(append
	;	(helper s) (nondecreastream s)))

	;)
	(define (helper1 s n)
	(cond
	((null? s) nil)
	((or (null? (cdr-stream s)) (> (car s) (car (cdr-stream s))))(cons-stream (append n (list (car s))) (helper2 (cdr-stream s) nil)))
	(else (helper1 (cdr-stream s) (append n (list (car s)))))))
	
	(define (helper2 s n)
	(cond 
	((null? s) nil)
	((or (null? (cdr-stream s)) (> (car s) (car (cdr-stream s))))(cons-stream (append n (list (car s))) (helper1 (cdr-stream s) nil)))
	(else (helper2 (cdr-stream s) (append n (list (car s)))))))

	(helper1 s nil)
	
	)
(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))