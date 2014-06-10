data (Ord a) => BinTree a = Null | Node (BinTree a) a (BinTree a)

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
listOrd [_] = True
listOrd ( x : y : xs ) = ( x <= y ) && listOrd ( y : xs )

treeOrd :: (Ord a) =>BinTree a -> Bool
treeOrd ( Node i x d ) = listOrd ( treeToList ( Node i x d ))
-------------------------------------------------

----- RETRUN THE LESS ELEMENT OF THE TREE -------
firstEle :: [a] -> (a,[a])
firstEle (x:xs) = (x,xs)

-------------------------------------------------



--insABB:: (Ord a) => a -> BinTree a -> BinTree a--inserta un elemento en el arbol
--getMin :: (Ord a) => BinTree a -> (a, BinTree a) -- a = elemento mas chico y bintree a = arbol sin el elemento menor