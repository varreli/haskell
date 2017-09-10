data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' = 
  putStrLn $ show e ++ " is boss of " ++ show e'

codersRule :: Employee -> Employee -> Ordering
codersRule Coder Coder = EQ
codersRule Coder     _ = GT
codersRule _     Coder = LT
codersRule e e'        = compare e e'

employeeRank :: (Employee -> Employee -> Ordering) 
                -> Employee
                -> Employee 
                -> IO ()

employeeRank f e e' =
  case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither is the boss"
    LT -> (flip reportBoss) e e'

