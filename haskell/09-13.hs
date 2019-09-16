-- Factorial function
fact n = if n<=1 then 1 else n*fact(n-1)

-- Fibonacci function (inefficient)
fib n = 
  if n<=0 then 0
  else if n<=2 then 1
  else fib(n-2) + fib(n-1)

-- Fibonacci using helper and the `where` keyword
fib' n = fibhelp n 0 1 where
  fibhelp n a b = if n == 0 then a else fibhelp (n-1) b (a+b)

-- `let` can also be used instead of `where`
fib'' n = let
  fibhelp n a b = if n == 0 then a else fibhelp (n-1) b (a+b)
  in fibhelp n 0 1