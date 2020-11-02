-- Type unification for join:

join x = x >>= id
join (m (m a)) = (m (m a)) >>= id


(>>=) :: Monad m => m b -> (b -> m c) -> m c


-- pass in as left operand : m (m a)

(>>=) :: Monad m => m (m a) -> (m a -> m c) -> m c
                    m   b   -> (b   -> m c) -> m c



-- pass in as right operand : id 

(>>=) :: Monad m => m (m a) -> (m a -> m a) -> m a
                    m   b ->   (d   ->  d ) -> m c 
                                
    note ^ d = m a = m c .  so a = c  (return value is (m a))

          note also: ma >>= return >>= ma
----------------------------------------------------------------
ghci> let mma = Just (Just 1) in   do {ma <- mma; ma}
Just 1

ghci> let x = Just (Just 1) in do {y <- x; y}
Just 1

ghci> let x = Just (Just 1) in do {y <- x; z <- y; return z}
Just 1

          note: we can define (>>=) using (>>= id) 

ghci> let x = Just (Just 1) in x >>= id
Just 1

ghci> :t join
join :: Monad m => m (m a) -> m a

ghci> :t (>>= id)
(>>= id) :: Monad m => m (m b) -> m b

