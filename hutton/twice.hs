twicce :: (t -> t) -> t -> t
twicce f x = f (f x)


main = print $ twicce succ 1
-- main = print $ twicce (: []) () -- fails typecheck 

-- λ > ((: []) . (: [])) ()
-- [[()]]


-- λ > :t (: [])
-- a -> [a]

-- λ > :t ((: []) . (: [])) ()
-- ((: []) . (: [])) () :: [[()]]
