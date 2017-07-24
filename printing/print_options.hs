module Print3Flipped where

myGreeting :: String
myGreeting = (++) "yo" " Bogota!"

yo :: String
yo = "yo"

bogota :: String
bogota = "Bogota!"

main :: IO ()
main = do
  putStrLn myGreeting
  putStrLn secondGreeting
  where secondGreeting =
          (++) yo ((++) " " bogota)
