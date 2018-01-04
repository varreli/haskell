-- That is, for a type to be an instance of Ord it 
-- must be an instance of Eq, and support six 
-- additional operators. Because default definitions 
-- have already been included for min and max, 
-- declaring an equality type (such as Bool) as an 
-- ordered type only requires defining the four 
-- comparison operators:



instance Ord Bool where
    False < True = True
    _     < _    = False

b <= c = (b < c) || (b == c)  

b > c  = c < b 

b >= c = c <= b

-- b > c   is read as: "strictly greater than"
