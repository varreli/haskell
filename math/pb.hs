import Debug.Trace

extendEu' :: Integer -> Integer -> (Integer, Integer)
extendEu' a b = let y = extendEu a b
                in y `seq` trace ("extendEu " ++ show a ++ " " ++ show b
		                                  ++ " = " ++ show y) y

