newtype Staat s a = Staat { runstate :: s -> (a,s) }

instance Functor (Staat s) where
-- fmap :: (a -> b) -> Staat s a -> Staat s b
    fmap f (Staat sa) = Staat (\s0 -> let (a, s1) = sa s0 in (f a, s1))
