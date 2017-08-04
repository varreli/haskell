triple x = tripleInner x
  where tripleInner :: Integer -> Integer
        tripleInner y = y * 3

-- From triple, the type inference of 
-- tripleInner is 'strong.'
