isFactor n = [ x | x <- [1..n] , mod n x == 0]
isPrime  n = isFactor n == [1,n]
