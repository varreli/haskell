
-- factors n = [x | x <- [1..n] , mod n x == 0]

-- primeCheck n = factors n == [1, n]  

-- main = print $ max $ filter (primeCheck) $ factors (600851475143 :: Int)

main = putStrLn (show ans)
ans = largestPrimeFactor (600851475143 :: Integer)

largestPrimeFactor n =
    let
        p = smallestPrimeFactor n
    in
              if p == n then p
              else largestPrimeFactor (div n p)

smallestPrimeFactor n = head [k | k <- [2..n], mod n k == 0]

