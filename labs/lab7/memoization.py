def memoization(func):
    memo = {}
    def wrapper(*args):
        if args not in memo:
            memo[args] = func(*args)
        return memo[args]
    return wrapper

if __name__ == "__main__":
    @memoization
    def factorial(n):
        res = 1
        for i in range(1,n+1):
            res*=i
        return res
    # factorial = memoization(factorial)
    for i in range(5):
        print(factorial(int(input("Введите число для факториала: "))))
