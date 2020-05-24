divisibleBy :: Int -> Int -> Bool
divisibleBy = ((0 ==) .) . mod

--  crestfallen @let divisibleBy = (( 0 == ) . ) . mod
--  lambdabot  Defined.
 
--  fog :t ((.).(.))
--  lambdabot (b -> c) -> (a1 -> a2 -> b) -> a1 -> a2 -> c
  
--  awpr :t on
--  lambdabot (b -> b -> c) -> (a -> b) -> a -> a -> c
  
--  wavemode_ @pointful divisibleBy = (( 0 == ) . ) . mod
--  lambdabot divisibleBy x x0 = 0 == mod x x0
  
--  fog :t \f -> (f.(.))
--  lambdabot (((a -> b) -> a -> c1) -> c2) -> (b -> c1) -> c2
  
--  fog :t \f g -> (f .) . g
--  lambdabot (b -> c) -> (a1 -> a2 -> b) -> a1 -> a2 -> c
 
--  awpr the partial application is referring to the type that 
--  the outermost `.` is working on. i.e. if you chop up that 
--  definition into functions that are composed together, it's 
  
--  mod :: Int -> (Int -> Int)` and `((==0) .) :: (Int -> Int) -> (Int -> Bool)
 
--  wavemode_ (f .) . g => you call g on a value, then compose 
--  the resulting function with f

-- fog ((f .) . g) a b = (((f .) . g) a) b = ((f .) (g a)) b = (f . (g a)) b = f (g a b)
 
--  wavemode_ mod takes two arguments, so calling it on one value 
--  returns a function that is still awaiting one argument. you 
--  then compose that function with (0 ==)
--  
--  fog ((f . ) . g)  a = f . (g a)
--  
--  awpr @let (.:) = (.).(.)
--  lambdabot  Defined.
--  
--  awpr :t (==0) .: mod
--  lambdabot Integral a => a -> a -> Bool
--  
--  awpr there: compose equality with zero past two arguments
