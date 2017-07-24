-- area d = pi * (r * r)
-- r = d / 2  -- r is out of scope

area d = pi * (r * r)
  where r = d / 2
