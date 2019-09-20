-- Manual definitions of filter
filter' _ [] = []
filter' f (x:xs) =
  if f x then x : filter' f xs
  else filter' f xs

-- using where clause
filter'' _ [] = []
filter'' f (x:xs) =
  if f x then x:y else y
  where y = filter'' f xs

-- elem function (returns true if element in list)
elem' _ [] = False
elem' x (y:ys) = if x == y then True else elem' x ys

-- using logical OR (not disjunction)
elem'' _ [] = False
elem'' x (y:ys) = x == y || elem'' x ys

-- Demonstrating optional args (left to right)
h = (flip map) [10, 20, 30, 40, 50] -- can use flip to pass the rightmost arg first
square_h = h (^2)                   -- using shorthand definition the square fn

-- Tuple can be used to define a hetereogeneous list
tlist = (3, 4.5, True, "abc")