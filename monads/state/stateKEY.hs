-- If we define:
-- 
-- newtype T a = TC a  
-- 
-- then the constructor TC is now a function of type 
-- 
-- a -> T a  
-- 
-- for example, TC 5 has the type: 
-- T Int
-- 
-- Likewise:
-- 
-- type ST = Int
-- newtype ST a = S (State -> (a, State))
-- 
-- ghci> :t S 
-- S :: (State -> (a, State)) -> ST a 
-- refers to the type of the constructor S, as a function.
-- 
-- If we wrote:
-- 
-- newtype ST a = S {runST :: State -> (a,State)} 
-- 
-- then this function would be created automatically: 
 
-- runST :: ST a -> State -> (a,State) 

 
newtype MyState s a = MyState { runSt :: (s -> (a,s)) }
-- ghci> :t MyState (\x -> ("pax", x))
-- MyState s [Char]
 
tt = runSt $ MyState (\x -> ("sea",x))
-- ghci> tt 5
-- ("pax",5)
-- 
-- ghci> :t tt
-- tt :: s -> ([Char], s)
