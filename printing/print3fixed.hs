module Print3Fixed where

printSecond :: IO ()
printSecond = do
  putStrLn greeting
  where greeting = "Yarrrrr"

main :: IO ()
main = do
  putStrLn greeting
  printSecond
  where greeting = "Yarrrrr"
