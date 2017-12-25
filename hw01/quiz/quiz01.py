def multiple(a, b):
    """Return the smallest number n that is a multiple of both a and b.

    >>> multiple(3, 4)
    12
    >>> multiple(14, 21)
    42
    """
    A = []
    B = []
    bfa = a * b
    bfb = a * b
    A.append(bfa)
    B.append(bfa)
    while bfa != a :
        A.append(bfa - a)
        bfa = bfa - a
    while bfb !=  b :
        B.append(bfb - b)
        bfb = bfb - b
    C = [x for x in A if x in B]
    print (min(C))

def unique_digits(n):
    """Return the number of unique digits in positive integer n

    >>> unique_digits(8675309) # All are unique
    7
    >>> unique_digits(1313131) # 1 and 3
    2
    >>> unique_digits(13173131) # 1, 3, and 7
    3
    >>> unique_digits(10000) # 0 and 1
    2
    >>> unique_digits(101) # 0 and 1
    2
    >>> unique_digits(10) # 0 and 1
    2
    """
    E = 0
    C = 0
    B = '0123456789'
    A = str(n)
    for b in B:
        E = 0
        for i in A:
                if b == i and E !=1:
                    C += 1
                    E = 1
                else:
                    pass
    return C
    
        




