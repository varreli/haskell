instance Ord Bool where
	False < True = True
	_     < _    = False

        b <= c = (b < c) || (b == c)
	b > c  = c < b
	b >= c = c <= b
