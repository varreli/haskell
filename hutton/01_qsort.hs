qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
             where
                     smaller = [ a | a <- xs, a <= x ]
                     larger  = [ b | b <- xs, b  > x ]



-- remove redundancies with a < x :

qsortt [] = []
qsortt (x:xs) = qsortt smaller ++ [x] ++ qsortt larger
             where
                     smaller = [ a | a <- xs, a < x ]
                     larger  = [ b | b <- xs, b > x ]


