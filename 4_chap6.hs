data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
  (==) (ThisOne a) (ThisOne b) = a == b
  (==) (ThatOne a) (ThatOne b) = a == b
  (==) _ _ = False

-- Pattern matching is what brings it to the
-- ignore case here.
-- If the eq instance is "passed"   
-- ThisOne 5 == ThatOne 5, what will happen 
-- is that first: You have the line 
-- (==) (ThisOne a) (ThisOne b); you have a 
-- ThatOne in the second parameter so it 
-- doesn't match and it tries the second line.

-- The second line has a ThatOne as the first 
-- parameter and so it doesn't match the 
-- comparison you "passed in", so it goes to 
-- the third line. The third line says "return 
-- False for anything you give me" so it 
-- returns false.
