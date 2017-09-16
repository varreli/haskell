-- functionC x y =
--   case x > y of
--     True -> x
--     False -> y

funcEv x =
  case even x of
    True -> x * 2
    False -> x
