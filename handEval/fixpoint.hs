factorial :: Int -> Int
factorial = fixx body 

body :: (Int -> Int) -> (Int -> Int)
body = (\ff n -> if n <= 1 then 1 else n * ff (n - 1))

fixx :: (t -> t) -> t
fixx f = f (fixx f) 

-- fixx :: ((s -> t) -> s -> t) -> s -> t
-- fixx f x = body (fixx body) x

-- factorial = fixx body 3
--           = body (fixx body) 3
--                  if 3 <= 1
--                  then 1
--                  else 3 * fixx body 2
--
--              =        3 * fixx body 2
--                       3 * body (fixx body) 2

--              =        3 *  (if 2 <= 1
--                            then 1
--                            else 2 * fixx body 1)
--
--              =        3 * 2 * fixx body 1
--                       3 * 2 * body (fixx body) 1
                             
--                       3 * 2 * (if 1 <= 1
--                               then 1
--                               else body (fixx body) 0)
--    
--              =        3 * 2 * 1
--              >        6 


factt n = product [1..n]
