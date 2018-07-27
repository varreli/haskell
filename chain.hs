chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain x
    | even x = x:chain (x `div` 2)
    | odd x  = x:chain (3 * x + 1)

{--

f x
    | even x = x - 2
    | odd  x = 3 * x + 10

--}
