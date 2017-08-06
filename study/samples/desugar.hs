-- You can bind parameters using operator-like 
-- names if you surround them with parentheses:

mult = let f (%) x y = x % y
         in  f (*) 3 5 

-- desugars to:
multiply = (\(%) x y -> x % y) (*) 3 5

-- infix backticks define z as operator:
adds = let ff z x y = x `z` y 
          in ff (+) 1 2

