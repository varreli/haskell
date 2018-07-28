fix :: (t -> t) -> t
fix f = f (fix f)

fact = fix fac
   where
     fac f 0 = 1
     fac f x = x * f (x - 1)
