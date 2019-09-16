fact n = if n<=1 then 1 else n*fact(n-1)

-- Some built-in functions
odds = map odd [1,2,3,4,5,6,7]
sumf = foldl (+) 0 [1,2,3,4,5,6,7]
facts = fact `map` [1,2,3,4,5,6,7] -- applies fact on every element

-- Manually creating a list (car, cdr, con in scheme)
list1 = 3:4:5:6:7:[]    -- [3,4,5,6,7]
h1 = head list1         -- 3
t1 = tail list1         -- [4,5,6,7]
size1 = length list1  -- 5

-----------------------------------
-- Redefining built-in functions --
-----------------------------------

-- Length of a list
size list =
  if null list then 0
  else 1 + size (tail list)

-- Map (applies a function to every element and returns a new list)
map' callback list =
  if null list then []
  else callback (head list) : map' callback (tail list)

--- Reverse using the ++ operator (concat)
rev list =
  if null list then []
  else rev (tail list) ++ [head list]
