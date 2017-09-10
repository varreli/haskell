nums x =
  case compare x 0 of
    LT -> " negative " 
    GT -> " positive " 
    EQ -> " zero "
