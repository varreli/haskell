unnfold :: (d -> Bool) -> (d -> f) -> (d -> d) -> d -> [f]

unnfold p h t x
  | p x       = []
  | otherwise = h x : unnfold p h t (t x)



iterateUnfold :: (a -> a) -> a -> [a]
iterateUnfold f = unnfold (const False) id f 

-- this should have an eta reduce.
-- note non-terminus of function (\_ -> False) or
-- (const False)
                                        



-- ghc iterate :

itterate f x = x : itterate f (f x)


