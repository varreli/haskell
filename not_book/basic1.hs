-- every expression has a type; if/then must share same type

f baseNum str = replicate repeatStr repeated
  where
    repeatStr = if baseNum > 5

      then baseNum
      else baseNum + 2 

    repeated = "Hello " ++ str


