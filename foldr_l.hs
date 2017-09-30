foldr f z (a:b:c:d:e:[]) = a `f` (b `f` (c `f` (d `f` (e `f` z))))



foldl f z (a:b:c:d:e:[]) = ((((z `f` a) `f` b) `f` c) `f` d) `f` e
