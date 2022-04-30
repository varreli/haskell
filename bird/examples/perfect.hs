tt = head (filter perfect [1..])
         where perfect n = (n == sum (divisors n))
