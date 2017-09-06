λ > :t const
const :: a -> b -> a
-- same as :
const :: a -> (b -> a) 

λ > let returnAfterApply :: (a -> b) -> a -> c -> b; returnAfterApply f a c = f a

λ > :t returnAfterApply 
returnAfterApply :: (a -> b) -> a -> c -> b

λ > :t returnAfterApply const
returnAfterApply const :: a -> c -> b -> a

λ > :t returnAfterApply const 1
returnAfterApply const 1 :: Num a => c -> b -> a

λ > :t returnAfterApply const 1 2
returnAfterApply const 1 2 :: Num a => b -> a

λ > :t returnAfterApply const 1 2 "t"
returnAfterApply const 1 2 "t" :: Num a => a

