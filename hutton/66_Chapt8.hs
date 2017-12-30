type Assoc k v = [(k,v)]

find :: Eq k => k -> Assoc k v -> v 
find k table =  head [ v | (k',v) <- table, k == k' ]
