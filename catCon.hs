catCon :: String -> String -> String
catCon x y = x ++ " cream " ++ y

flipper :: String -> String -> String
flipper = flip catCon

apCat :: String -> String
apCat = catCon "woops"

frappe :: String -> String
frappe = flipper "haha"


-- What is the value of :

-- 1. appedCatty "woohoo!"
-- 2. frappe "1"
-- 3. frappe (appedCatty "2")
-- 4. appedCatty (frappe "blue")
-- 5. cattyConny (frappe "pink")
--      (cattyConny "green" (appedCatty "blue"))

-- 6. cattyConny (flippy "Pugs" "are") "awesome"
