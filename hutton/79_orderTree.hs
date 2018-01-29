data Ordering = LT | EQ | GT
compare :: Ord a => a -> a -> Ordering
