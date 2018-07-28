module Main where
 
euclid :: Int -> Int -> Int
euclid m n | m <= 0 && n <= 0 = error "GCD works for positive numbers only"
           | m == n = m
           | m < n = euclid m (n-m)
           | otherwise = euclid (m-n) n
 
main :: IO ()
main = do putStrLn "Enter the first number: "
          x <- getLine
          putStrLn "Enter the second number: "
          y <- getLine
          let x' = read x :: Int
          let y' = read y :: Int
 
          putStrLn $ "The GCD of " ++ x
                     ++ " and " ++ y
                     ++ " is " ++ show (euclid x' y')
