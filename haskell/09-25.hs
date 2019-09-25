-- Recursive definition of zip
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

-- Recursive zipwith
zipwith' _ [] _ = []
zipwith' _ _ [] = []
zipwith' f (x:xs) (y:ys) = f x y : zipwith' f xs ys

-- Infinite lists
infilist = [(^2) x | x <-[0..]]   -- whole list defined but not evaluated
large_x = infilist !! 400         -- only evaluates what needs to be displayed

-- Lazy evaluation can be used to creatively define lists and functions
powersOf n = 1 : map (*n) (powersOf n)
fib x = fiblist !! x
  where fiblist = 0 : 1 : zipWith (+) fiblist (tail fiblist)

-- Congruent lists, e.g. cong 3 10 = [3, 13, 23, 33, ...]
cong  k n = k : map (+n) (cong k n)
cong' k n = k : [x + n | x <- cong' k n]

-- Infinite list of primes by recursively removing multiples of p (starting with p=2)
primelist = checkdiv [2..]
  where checkdiv (p:xs) = p : checkdiv [x | x<-xs, mod x p /= 0]

-- User-defined types --
data Color = Red | Green | Blue | Yellow deriving (Eq, Ord, Read, Show)       -- like enum
data Shape = Circle Float | Rectangle Float Float | RightTriangle Float Float -- like object
  deriving (Eq, Ord, Read, Show) 