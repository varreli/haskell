next :: Int -> Int
next 1 = 2
next 2 = 1

type Board = [Int]

initial :: Board
initial = [5,4,3,2,1]

finished :: Board -> Bool
finished = all (== 0)

valid :: Board -> Int -> Int -> Bool
valid board row num = board !! (row - 1) >= num

move :: Board -> Int -> Int -> Board
move board row num = [update r n | (r,n) <- zip [1..] board]
<<<<<<< HEAD
    where 
    update r n = if r == row then (n - num) else n   -- n-num is subtraction !

putRow :: Int -> Int -> IO ()
putRow row num = do putStr (show row)
                    putStr ": "
                    putStrLn (concat (replicate num "* "))



=======
    where update r n = if r == row then n-num else n
>>>>>>> fc4f00b3ee9bdc27740d24dc4c871851298ba672
