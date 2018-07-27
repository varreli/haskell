import Data.Monoid
import Safe (readMay)

main = print numbers

numbers :: Maybe [Int]
numbers = readMay "[1,2,3]" <> readMay "[90" <> readMay "[4,5,6]"


-- this is equivalent with line 7, as readMay "[90" doesnt parse
-- and mempty equates to Nothing in the Maybe monoid :

-- numbers = readMay "[1,2,3]" <> mempty <> readMay "[4,5,6]"

