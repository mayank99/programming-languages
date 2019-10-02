-- thanks to Rick Bostwick for contributing this code

--defining enumerated objects
data Shape = Circle Float | Rectangle Float Float | RightTriangle Float Float -- like object
  deriving (Eq, Ord, Read, Show)

--list and functions on the enumerated types  
shapelist = [Circle 5, Rectangle 3 4, RightTriangle 5 6,
            Circle 10, Rectangle 2 7, Circle 20]
area(Circle radius) = pi * (radius^2)
area(Rectangle w h) = w * h
area(RightTriangle w h) = w*h/2

perimeter(Circle radius) = 2*pi*radius
perimeter(Rectangle w h) = 2*w + 2*h
perimeter(RightTriangle w h) = w + h + sqrt(w^2 + h^2)

--defining trees like above using a symbol so any types
--can be entered unlike above which is defined as Float
data Tree a = Node a [Tree a]
              deriving (Eq, Ord, Read, Show)  
tree1 = Node 20 [Node 10 [],Node 30 []]
tree2 = Node 40 [Node 10 [Node 20 []],
                 Node 30 [],
                 Node 50 [],
                 Node 70 [Node 60 []]]
tree3 = Node 'd' [Node 'a' [Node 'b' []],
                 Node 'c' [],
                 Node 'e' [],
                 Node 'g' [Node 'f' []]]
--functions on trees where x is the value of node and
--ts are the subtrees
preorder(Node x ts) = x : foldr (++) [] [preorder t | t<-ts]
postorder(Node x ts) = foldr (++) [] [postorder t | t<-ts] ++ [x]

--binary tree
data BinTree a = Null | BinNode a (BinTree a) (BinTree a)
                 deriving (Eq, Ord, Read, Show)
bintree1 = BinNode 20 (BinNode 10 Null Null)
                      (BinNode 30 Null Null)
bintree2 = BinNode 40 (BinNode 20 (BinNode 10 Null Null)
                                  (BinNode 30 Null Null))                                 
                      (BinNode 60 (BinNode 50 Null Null)
                                  (BinNode 70 Null Null))
bintree3 = BinNode 'd' (BinNode 'b' (BinNode 'a' Null Null)
                                    (BinNode 'c' Null Null))                                 
                       (BinNode 'f' (BinNode 'e' Null Null)
                                    (BinNode 'g' Null Null))
                                       
--functions need to be different since BinTree type
preorder'(Null) = []
preorder'(BinNode x left right) = [x] ++ preorder' left ++ preorder' right 

postorder'(Null) = []
postorder'(BinNode x left right) = postorder' left ++ postorder' right ++ [x]

inorder'(Null) = []
inorder'(BinNode x left right) =  inorder' left ++ [x] ++ inorder' right 