data DayOfWeek = Mon | Tue | Weds | Thu | Fri | Sat | Sun deriving ( Eq, Ord, Show)


data BestDayOfWeek = Monday | Tuesday | Wednesday | Thursday
  | Friday | Saturday | Sunday deriving (Eq, Show)

instance Ord BestDayOfWeek where

  compare Friday Friday = EQ
  compare Friday _      = GT
  compare _ Friday      = LT
  compare _ _           = EQ
