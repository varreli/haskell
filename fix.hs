fix :: (t -> t) -> t
fix f = f (fix f)

fact = fix fac
   where
     fac ff 0 = 1
     fac ff x = x * ff (x - 1)



-- Above related to y-combinator, study this :

-- https://stackoverflow.com/questions/38902504/how-to-use-y-combinator-why-does-this-infinite-recursion-return-9
