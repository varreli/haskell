
-- foldr', applied to a binary operator, a starting value (typically
-- the right-identity of the operator), and a list, reduces the list
-- using the binary operator, from right to left:
--
-- > foldr f z [x1, x2, ..., xn] == x1 `f` (x2 `f` ... (xn `f` z)...)



foldr :: (a -> b -> b) -> b -> [a] -> b

foldr _ z []     =  z
foldr f z (x:xs) =  f x (foldr f z xs)

(*) has both right and left identity: (1*) (*1)
(+) has both right and left identity: (y+) (+y)

(-) has only right identity
(^) has only right identity
(/) has only right identity: /1
