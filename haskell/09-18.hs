-- Lambda expression
cube = (\x -> x*x*x)

-- Fibonacci using pattern matching
fib1 0 = 0
fib1 1 = 1
fib1 n = fib1(n-2) + fib1(n-1)

-- using guards
fib2 n
  | n<=0 = 0
  | n<=1 = 1
  | otherwise = fib1(n-2) + fib1(n-1)

-- Maximum using guards (inline)
max' a b | a > b = a | otherwise = b  

-- Length using pattern matching
length1 [] = 0
length1 list = 1 + length1 (tail list)

-- using cons operator (x is head, xs is tail)
length2 [] = 0
length2 (x:xs) = 1 + length2 xs

-- can use underscore for unused vars
length3 [] = 0
length3 (_:xs) = 1 + length3 xs

-- Map implementation using pattern matching (and cons)
map1 _ [] = []
map1 f (x:xs) = f x : map1 f xs

-- Reverse using pattern matching
rev1 [] = []
rev1 (x:xs) = rev1 xs ++ [x]

-- Append (++) using pattern matching
append [] list = list
append (x:xs) list = x : append xs list

-- Infix implementation of append
[] +++ ys = ys
(x:xs) +++ ys = x : (xs +++ ys)

-- Fold left using pattern matching
foldl' _ id [] = id
foldl' f id (x:xs) = foldl' f (f id x) xs

-- Fold right using guards
foldr' f id list
  | null list = id
  | otherwise = f (head list) (foldr' f id (tail list))

-- Reverse cons
rcons x y = y:x