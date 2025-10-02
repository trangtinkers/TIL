import math

def check_problem(n: int) -> list:
    if n < 2:
        return []
    else:
        res = []
        for i in range(2, n + 1):
            k = math.factorial(i - 1)
            if not (k % i == 0):
                res.append(i)
        return res
    
# Test the function
print("Values where n does not divide (n-1)!:")
print(check_problem(20))