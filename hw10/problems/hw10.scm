(define (substitute s old new)
  (cond
    ((null? s) nil)
    ((pair? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
    ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
    (else (cons (car s) (substitute (cdr s) old new))) 
    )
)


(define (sub-all s olds news)
   ; (cond
   ;  ((null? s) nil)
   ;  ((pair? (car s)) (cons (sub-all (car s) olds news) (sub-all (cdr s) olds news)))
   ;  ((equal? (car s) (car olds)) (cons (car news) (sub-all (cdr s) (cdr olds) (cdr news))))
   ;  (else (cons (car s) (sub-all (cdr s) olds news))) 
   ;  )
   (cond
    ((null? news) s)
    (else (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news)))
    )
)

(define (cadr s) (car (cdr s)))
(define (caddr s) (cadr (cdr s)))


; derive returns the derivative of EXPR with respect to VAR
(define (derive expr var)
  (cond ((number? expr) 0)
        ((variable? expr) (if (same-variable? expr var) 1 0))
        ((sum? expr) (derive-sum expr var))
        ((product? expr) (derive-product expr var))
        ((exp? expr) (derive-exp expr var))
        (else 'Error)))

; Variables are represented as symbols
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; Numbers are compared with =
(define (=number? expr num)
  (and (number? expr) (= expr num)))

; Sums are represented as lists that start with +.
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (sum? x)
  (and (list? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))

; Products are represented as lists that start with *.
(define (make-product m1 m2)
(cond ((or (=number? m1 0) (=number? m2 0)) 0)
      ((=number? m1 1) m2)
      ((=number? m2 1) m1)
      ((and (number? m1) (number? m2)) (* m1 m2))
      (else (list '* m1 m2))))
(define (product? x)
  (and (list? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (derive-sum expr var)
  (cond
    ((number? expr) 0)
    ((same-variable? expr var) 1)
    (else (make-sum (derive-sum (addend expr) var) (derive-sum(augend expr) var)))

  
    )
  )

(define (derive-product expr var)
  (cond
    ((number? expr) 0)
    ((same-variable? expr var) 1)
    ((and (variable? expr) (not (same-variable? expr var))) 0)
    ((sum? expr) (derive-sum expr var))
    (else (make-sum 
      (make-product (derive-product (addend expr) var) (augend expr)) 
      (make-product (derive-product (augend expr) var) (addend expr))
      ))
      ) 
  )

; Exponentiations are represented as lists that start with ^.
(define (make-exp base exponent)
  (cond
    ((equal? exponent 0) 1)
    ((equal? exponent 1) base)
    ((and (number? base) (number? exponent)) (expt base exponent))
    (else (list '^ base exponent))

  ))


(define (base exp)
  (addend exp)
  )

(define (exponent exp)
  (augend exp)
  )

(define (exp? exp)
  (cond 
    ((integer? exp) False)
    ((variable? exp) False)
    ((equal? (car exp) '^ ) True)
  ))

(define x^2 (make-exp 'x 2))
(define x^3 (make-exp 'x 3))

(define (derive-exp exp var)
  (cond
    ((equals? (car exp) 'make-sum) 'hello)
      ; (make-sum (derive-exp (addend exp) var) (derive-exp (augend exp) var)))
    ((product? exp) (make-product (derive-exp (addend exp) var) (derive-exp (augend exp) var)))
    (else (make-product (exponent exp) (make-exp (base exp) (- (exponent exp) 1)))) 
    )
  )




