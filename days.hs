data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun

data Date =
  Date DayOfWeek Int

instance Eq DayOfWeek where
  (==) Mon Mon   = True
  (==) Tue Tue   = True
  (==) Weds Weds = True
  (==) Thu Thu   = True
  (==) Fri Fri   = True
  (==) Sat Sat   = True
  (==) Sun Sun   = True
  (==) _ _       = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') =
    weekday == weekday' && dayOfMonth == dayOfMonth'

    -- the real "skill" here is writing functions to
    -- implement some logic, be it equality, or less
    -- than, or maybe adding two days together, etc.,
    -- using pattern matching.

    --   equalDate (Date w1 s1) (Date w2 s2)
    --   = not (w1 /= w2   ||    s1 /= s2)

    --   [   (w1 =/ w2   ||    s1 /= s2) is the same as
    --   (w1 == w2) && (s1 == s2)  ]
