import Tree

---------- MAIN FUCTION FOR ORDER LIST ----------
abbSort ::  (Ord a) => [a] -> [a]
abbSort (x:xs) = treeToList( listToTree(x:xs) )
-------------------------------------------------

---------------- SELECTION SORT -----------------
selSort :: (Ord a) => [a] -> [a]
selSort [] = []
selSort xs = let x = minimum xs in x : selSort (remove x xs) 
  where remove _ [] = []
        remove a (x:xs)
          | x == a = xs
          | otherwise = x : remove a xs

{- EXTRACTED FROM : http://rosettacode.org/wiki/Sorting_algorithms/Selection_sort -}
-------------------------------------------------