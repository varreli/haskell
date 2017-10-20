hallve :: [a] -> ([a], [a])
hallve xs =
	(take (length xs `div` 2) xs, drop (length xs `div` 2) xs)



