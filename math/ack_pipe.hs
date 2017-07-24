  main = print $ ack 1 3 
    where ack :: Int -> Int -> Int

          ack x y | y == 0 = 0
                  | x == 0 = 2*y
		  | y == 1 = 2
                  | otherwise =  ack (x-1) (ack x (y-1)) 


-- this is a close transcription to ackermann in scheme 
