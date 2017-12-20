unnfold :: (d -> Bool) -> (d -> f) -> (d -> d) -> d -> [f]

unnfold p h t x
  | p x       = []
  | otherwise = h x : unnfold p h t (t x)



iterateUnfold :: (a -> a) -> a -> [a]
iterateUnfold f = unnfold (const False) id f 

-- note non-terminus of function (\_ -> False) or
-- (const False) .
-- (const False) returns a function  :
-- const False = \_ -> False
-- so we are essentially passing (\_ -> False)
-- to unnfold.
                                        
-- (f should be eta reduced.)


-- ghc iterate :

itterate f x = x : itterate f (f x)


