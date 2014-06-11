import System.Random

rList n = take n $! (randoms (mkStdGen (0)))::[Integer]

data (Ord a) => BinTree a = Null | Node (BinTree a) a (BinTree a) deriving Show

------- RETURN HE ORIGIN OF THE MAIN TREE ------
raiz :: (Ord a)  => BinTree a -> a
raiz ( Node _ r _) = r
------------------------------------------------

------------- CONVERT THE TREE AT LIST ---------
treeToList :: (Ord a) => BinTree a -> [a]
treeToList Null = []
treeToList ( Node i r d ) =  treeToList ( i ) ++ [r] ++ treeToList ( d ) 
------------------------------------------------

------ VERIFY IF THE TREE IS IN ORDEN OR NOT----
listOrd ::(Ord a) =>[a]->Bool
listOrd [] = True
listOrd [x] = True
listOrd ( x : y : xs ) = ( x <= y ) && listOrd ( y : xs )

isABB :: (Ord a) =>BinTree a -> Bool
isABB ( Node i r d ) = listOrd ( treeToList ( Node i r d ))
--------------------------------------------------

------- CONVERT THE LIST AT TREE ----------------
listToTree::(Ord a) => [a] -> BinTree a
listToTree [] = Null
listToTree (x:xs) = insABB x (listToTree xs)
-------------------------------------------------

----- INSERT AN ELEMENT IN THE TREE --------------
insABB :: (Ord a) => a -> BinTree a -> BinTree a
insABB x Null = (Node Null x Null)
insABB x (Node i r d) | x <= r = (Node (insABB x i) r d)
					  | otherwise = (Node i r (insABB x d))

-------------------------------------------------

--RETURN THE MIN ELEMENT AND THE REST THE LIST---
takeFirst :: (Ord a) => [a] -> ( a , BinTree a)
takeFirst [x] = ( x , Null )
takeFirst (x:xs) = ( x , listToTree xs )

getMin :: ( Ord  a )  =>  BinTree  a  ->  ( a ,  BinTree  a ) 
getMin ( Node Null x Null ) = ( x , Null) 
getMin ( Node  i  r  d )  =  takeFirst ( treeToList ( Node  i  r  d ))

---------------------------------------------------

---------- MAIN FUCTION FOR ORDER LIST ------------
abbSort ::  (Ord a) => [a] -> [a]
abbSort (x:xs) = treeToList( listToTree(x:xs) )

---------------------------------------------------

---------------- SELECT SORT ----------------------
selSort :: (Ord a) => [a] -> [a]
selSort [] = []
selSort xs = let x = minimum xs in x : selSort (remove x xs) 
  where remove _ [] = []
        remove a (x:xs)
          | x == a = xs
          | otherwise = x : remove a xs

{- EXTRACTED FROM : http://rosettacode.org/wiki/Sorting_algorithms/Selection_sort -}

------------------------------------------------