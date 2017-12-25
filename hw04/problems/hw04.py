HW_SOURCE_FILE = 'hw04.py'

def g(n):
    """Return the value of G(n), computed recursively.

    >>> g(1)
    1
    >>> g(2)
    2
    >>> g(3)
    3
    >>> g(4)
    10
    >>> g(5)
    22
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'g', ['While', 'For'])
    True
    """
    if n <= 3:
        return n
    else:
        return g(n - 1) + 2 * g(n - 2) + 3 * g(n - 3)

def g_iter(n):
    """Return the value of G(n), computed iteratively.

    >>> g_iter(1)
    1
    >>> g_iter(2)
    2
    >>> g_iter(3)
    3
    >>> g_iter(4)
    10
    >>> g_iter(5)
    22
    >>> g_iter(6)
    51
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'g_iter', ['Recursion'])
    True
    """
    
    
    if n <= 3:
        return n
    a, b, c = 3, 2, 1
    amount, k = 0, 3
    while k < n:
        amount = a + 2*b + 3*c
        a,b,c = total, a, b
        k = k+ 1
    return total



def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(7)
    7
    >>> pingpong(8)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    0
    >>> pingpong(30)
    6
    >>> pingpong(68)
    2
    >>> pingpong(69)
    1
    >>> pingpong(70)
    0
    >>> pingpong(71)
    1
    >>> pingpong(72)
    0
    >>> pingpong(100)
    2
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'pingpong', ['Assign', 'AugAssign'])
    True
    """
    # x = 0
    # up = True
    # down = False
    # for i in range(1, n+1):
    #     if up == True:
    #         x+= 1
    #     if down == True:
    #         x -= 1
    #     if has_seven_or_multiple(i) == True:
    #         up, down = down, up
    # return x
    

    def helper(k, x, c):
        if c == n:
            return k
        if x == True:
            return way(k + 1, x,c+1 )
        else:
            return  way(k-1, x, c + 1)
    def way(k, x, c):
        if has_seven_or_multiple(c) == True:
            return helper(k, not x, c)
        else:
            return helper(k, x, c)

    
    return helper(1, True, 1)







def has_seven_or_multiple(k):
    """Returns True if at least one of the digits of k is a 7, False otherwise.

    >>> has_seven(3)
    False
    >>> has_seven(7)
    True
    >>> has_seven(2734)
    True
    >>> has_seven(2634)
    False
    >>> has_seven(734)
    True
    >>> has_seven(7777)
    True
    """
    if k % 10 == 7:
        return True
    elif k%7 == 0:
        return True
    elif k < 10:
        return False
    else:
        return has_seven_or_multiple(k // 10)

def count_change(amount):
    """Return the number of ways to make change for amount.

    >>> count_change(7)
    6
    >>> count_change(10)
    14
    >>> count_change(20)
    60
    >>> count_change(100)
    9828
    """

    # def helper(min,amount):
    #     if amount <  0:
    #         return 0
    #     if amount == 1 or amount == 0:
    #         return 1
    #     else:
    #         x = helper(min, amount- min)
    #         y = helper(min*2, amount)
    #     return x + y
    #         # return helper(min, amount- min) + helper(min*2, amount)
    # return helper(1, amount)


    # max_coin = 1
    # while max_coin < amount:
    #     max_coin *= 2
    # max_coin  = int(max_coin/2)
  
    highestcoin = 1
    while highestcoin < amount:
        highestcoin = highestcoin * 2

    def counter(amt, highestcoin):
        if amt == 0:
            return 1
        if highestcoin == 0:
            return 0
        if amt < 0:
            return 0
        return counter(amt - highestcoin, highestcoin) + counter(amt, int(highestcoin/2))

    return counter(amount, highestcoin/2)

"""
    def coin(amount):
        x = 1
        highestcoin = 1
        while highestcoin < amount:
            highestcoin = 2**x
            x = x +1
        highestcoin = 2**(x-2)
        return highestcoin
    def 
    if amount == 1:
        return 1
    elif amount <= 0:
        return 0
    elif amount == 2:
        return 2
    else:
        return count_change(amount - coin(amount)) + count_change(coin(amount)) 

"""
###################
# Extra Questions #
###################

from operator import sub, mul

def make_anonymous_factorial():
    """Return the value of an expression that computes factorial.

    >>> make_anonymous_factorial()(5)
    120
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'make_anonymous_factorial', ['Assign', 'AugAssign', 'FunctionDef', 'Recursion'])
    True
    """
    return 'YOUR_EXPRESSION_HERE'
