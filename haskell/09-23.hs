-- Tuples and triples
plus (x, y) = x+y
add = curry plus
plus' = uncurry add
first (x,y,z) = x
second (x,y,z) = y
third (x,y,z) = z

-- Some weird list comprehension syntax
l1 = [1..10]
l2 = [1,3..10]
l3 = [x^2 | x <- [1..10]]
l4 = [x^2 | x <- [1..20], odd x] -- same as map (^2) [1,3..10]
inRange a b list = [x | x <- list, x >= a, x <= b ]
map' f xs = [f x | x <- xs]

-- More ways to define length and factorial because why not
length' list = foldr (+) 0 [1 | x <- list]
length'' list = sum [1 | x <- list]
fact n = foldr (*) 1 [1..n]
fact' n = product [1..n]

-- zipWith by uncurrying f to accept a pair rather than 2 seperate args
zipWith' f xs ys = map (uncurry f) (zip xs ys)

-- defining zip using the subscript operator !!
zip' xs ys = [(xs!!k, ys!!k) | k <- [0..n-1]]
  where n = min (length xs) (length ys)

-- Quick sort using list comprehension
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where smaller = [y | y <- xs, y < x]
        larger = [y | y <- xs, y >= x]