let jackel :: (Eq a, Ord b) => a -> b -> a; jackel = undefined

λ > :t jackel True [1,2,3,4]
jackel True [1,2,3,4] :: Bool

λ > :t jackel True
jackel True :: Ord b => b -> Bool

λ > :t jackel [1,2,3,4]
jackel [1,2,3,4] :: (Eq t, Num t, Ord b) => b -> [t] 


