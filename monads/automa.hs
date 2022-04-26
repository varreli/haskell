data U x = U [x] x [x]
  deriving Show 


right (U a b (c:cs)) = U (b:a) c cs
left  (U (a:as) b c) = U as a (b:c)

gg = U [-2,-3..] (-1) [0,1..]
