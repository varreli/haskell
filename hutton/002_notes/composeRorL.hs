(>>>) :: (a -> b) -> (b -> c) -> (a -> c)
f >>> g = g . f     -- or: (>>>) = flip (.)

-- Left-to-right vs. right-to-left composition:

-- > reverse >>> (++" world") >>> (++"!") $ "olleh"
-- "hello world!"

-- > (++"!") . (++ " world") . reverse $ "olleh"
-- "hello world!"



-- (see : Control.Arrow for (>>>) already defined)

