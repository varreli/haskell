-- Having the last case resolve to False
-- is logically and stylistically a better
-- way to end the cases :

_:_ <= [ ] = False

-- without this,

[1,2] <= []


-- will not compute to False, but rather
-- crash (abort computation, like undefined does.)

-- -- -- --

PrimaryColor = Red | Green | Blue

Red == Red     = True
Green == Green = True
Blue == Blue   = True
    _ == _     = False


-- without using a catch-all here, we'd need
-- to enumerate all the remaining six cases
-- explicitly, which is tiresome.
