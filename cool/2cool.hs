-- 2cool.hs

module AreTheyCool where
areTheyCool :: String -> IO ()

areTheyCool coolness =
  if cool
    then putStrLn "eyyyyy. What's shakin'?"
  else
    putStrLn "pshhhh."
  where cool = coolness == "downright frosty yo"
