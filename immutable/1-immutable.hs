main :: IO ()
main = do
   let a = (show 1) ++ " We won't see this"
   let a = (show 2) ++ " !!"
   print a 

-- desugared to 
-- let a = 1 in (let a = 2 in (print a))

--------------------------------------------------
