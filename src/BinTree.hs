-- -- Example of Tree Module
-- -- From: http://www.haskell.org/tutorial/modules.html

-- module Tree ( Tree(Leaf,Branch), fringe ) where

-- data Tree a = Leaf a | Branch (Tree a) (Tree a)

-- fringe :: Tree a -> [a]
-- fringe (Leaf x)            = [x]
-- fringe (Branch left right) = fringe left ++ fringe right

-- -- The Tree module may now be imported into some other file:

-- -- main.hs file.
-- import Tree ( Tree(Leaf,Branch), fringe )
-- main = print (fringe (Branch (Leaf 1) (Leaf 2)))
