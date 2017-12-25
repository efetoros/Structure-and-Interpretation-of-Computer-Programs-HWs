(define (find s predicate)
  (cond
    ((null? s) #f)
    ((predicate (car s)) (car s))
    (else (find (cdr-stream s) predicate))

    )
)

(define (scale-stream s k)
  (cond
    ((null? s) s)
    (else (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k))))

    )


  	)


(define (has-cycle s)

  (let ((copy s)) 
    (cond
      ((null? s) #f)
      ((eq? copy s) #t)
      (else (has-cycle (cdr-stream s)))

      )

    )
  



 	)

 

(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
