lastt, laast :: [a] -> [a]

lastt xs = drop (length xs - 1) xs

laast list = take 1 (reverse (tail list))

