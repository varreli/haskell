main = print $ ack 1 3
  where ack :: Int -> Int -> Int
         
        ack x 0 = 0
        ack 0 y = 2*y
        ack x 1 = 2
        ack x y = ack (x-1) (ack x (y-1))


-- elegant ackermann's function
