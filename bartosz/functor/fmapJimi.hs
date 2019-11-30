aa = fmap (++) (Just "Hey")
bb = (\f -> f (" Joe"))
jimi = bb <$> aa
 
