import Data.Monoid

-- the 2 distinct Bool monoids:

conjunctive  = All True <> All True
conjunctive2 = All True <> All False

getConj = getAll $ conjunctive       
-- True                                -- removes wrapper


disjunctive  = Any True <> Any False
disjunctive2 = mappend (Any False) (Any False)

getDisj = getAny $ disjunctive
-- True                                -- removes wrapper


-- mappending condenses or reduces, it doesnt 
-- actually combine:

-- Prelude> All True <> All True
-- All {getAll = True}
