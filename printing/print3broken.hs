module Print3Broken where

printSecond :: IO ()
printSecond = do
  putStrLn greeting -- Yarrrrr out of scope
  --plus this must be indented because otherwise
  --you can't get out of this do block for 2nd one
  --on line 11 and ghc can't see the 2nd do block. 
  
main :: IO ()
main = do
  putStrLn greeting
  printSecond
  where greeting = "Yarrrrr"
