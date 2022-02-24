-- The variable x can only be bound, not mutated:

main :: IO ()
main = 
   let x = 1 in
   let f y = x + y in
   let x = 2 in
   print (x * f 3)

-- is alpha equivalent to:   -------------------
--
-- main :: IO ()
-- main  =
--    let x1 = 1 in
--    let f y = x1 + y in
--    let x2 = 2 in
--    print (x2 * f 3)
