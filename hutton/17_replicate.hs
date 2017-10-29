repplicate :: Int -> a -> [a]
repplicate i elem = [ elem | _ <- [0..i]] 


-- similar to prelude length :            

llength :: [a] -> Int
llength xs = sum [1 | _ <- xs]
