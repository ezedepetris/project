data (Ord a) => BinTree a = Null | Node (BinTree a) a (BinTree a) deriving Show

------- RETURN HE ORIGIN OF THE MAIN TREE ------
raiz :: (Ord a)  => BinTree a -> a
raiz ( Node _ b _) = b
------------------------------------------------

------------- CONVERT THE TREE AT LIST ---------
treeToList :: (Ord a) => BinTree a -> [a]
treeToList Null = []
treeToList ( Node i x d ) =  treeToList ( i ) ++ [x] ++ treeToList ( d ) 
------------------------------------------------

------ VERIFY IF THE TREE IS IN ORDEN OR NOT----
listOrd ::(Ord a) =>[a]->Bool
listOrd [] = True
listOrd [x] = True
listOrd ( x : y : xs ) = ( x <= y ) && listOrd ( y : xs )

isABB :: (Ord a) =>BinTree a -> Bool
isABB ( Node i x d ) = listOrd ( treeToList ( Node i x d ))
-------------------------------------------------

----- RETRUN THE LESS ELEMENT OF THE TREE -------
firstEle :: [a] -> (a,[a])
firstEle (x:xs) = (x,xs)

-------------------------------------------------

------- CONVERT THE LIST AT TREE ----------------
listToTree::(Ord a) => [a] -> BinTree a
listToTree []     = Null
listToTree (x:xs) = insABB x (listToTree xs)

-------------------------------------------------


----- INSERT AN ELEMENT IN THE TREE -------------
insABB :: (Ord a) => a -> BinTree a -> BinTree a
insABB x Null = (Node Null x Null)
insABB x (Node i r d) | x <= r = (Node (insABB x i) r d)
					  | otherwise = (Node i r (insABB x d))

-------------------------------------------------

getMin :: (Ord a) => BinTree a -> (a, BinTree a) -- a = elemento mas chico y bintree a = arbol sin el elemento menor
getMin (Node i r d) = treeToList(Node i r d)

