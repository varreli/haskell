-- compare to boolsR in taut.hs

λ > update bss = map (False:) bss ++ map (True:) bss

λ > update [[]]
[[False, True]]

λ > update (update [[]])]
[False,False],[False,True],[True,False],[True,True]

