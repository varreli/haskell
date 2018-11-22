-- instance Functor IO where  
--     fmap f action = do  
--         result <- action    -- <- binds action to name result  
--         return (f result) 

-- main = do line <- getLine   
--           let line' = reverse line  
--           putStrLn $ "You said " ++ line' ++ " backwards!"  
--           putStrLn $ "Yes, you really said" ++ line' ++ " backwards!"  

-- The same using fmap :

main = do line <- fmap reverse getLine  
          putStrLn $ "You said " ++ line ++ " backwards!"  
          putStrLn $ "Yes, you really said " ++ line ++ " backwards!"
