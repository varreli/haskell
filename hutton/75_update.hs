-- compare to boolsR in 74_taut.hs


λ > update bss = map (False:) bss ++ map (True:) bss

λ > update [[]]
[[False, True]]

λ > update (update [[]])]
[False,False],[False,True],[True,False],[True,True]


-- recall map 's signature:

map :: (a -> b) -> [a] -> [b]
