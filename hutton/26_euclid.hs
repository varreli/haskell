euclid :: Int -> Int -> Int
euclid s t
  | s <= 0, t <= 0 = 0
  | s == t = s
  | s < t = euclid s ( t - s )
  | s > t = euclid ( s - t ) t
