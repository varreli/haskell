type Bit = Int

int2binary :: Int -> [Bit]
int2binary 0 = []
int2binary n = (mod n 2) : int2binary (div n 2)


-- int2binary 9 = (mod 9 2) : int2binary (div 9 2)
-- int2binary 4 = 1 : 0 :     int2binary (div 4 2)
-- int2binary 2 = 1 : 0 : 0 : int2binary (div 2 2)
-- int2binary 1 = 1 : 0 : 0 : 1 int2binary (div 1 2) 

-- int2binary 0 = 1 : 0 : 0 : 1 : []
-- > [1,0,0,1]
