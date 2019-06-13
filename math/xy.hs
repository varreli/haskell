nums x =
  case compare x 0 of
    LT -> "neg"
    GT -> "pos" 
    EQ -> "0"
