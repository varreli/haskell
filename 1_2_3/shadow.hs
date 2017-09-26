Prelude> let x = 5
Prelude> let y = x + 5
Prelude> y
10
Prelude> y * 10
100
Prelude> let z y = y * 10
Prelude> x
5
Prelude> y
10
Prelude> z 9
90

-- but
Prelude> z y
100


\ is λ and -> is .


-- (\x -> (\y -> let z y = y * 10 in z y) (x + 5)) 5
-- (\x -> let y = x + 5 in let z y = y * 10 in z y) 5

-- following are expressions, not definitions.
-- so we need inputs :

-- let x = 5 in let y = x + 5 in let z y = y * 10 in z 9 
-- (\x -> let y = x + 5 in let z y = y * 10 in z 4) 5

-- a more recent binding of y; the original binding is
-- shadowed. "z" defines its own y binding, completely
-- hiding (shadowing) the original one within the
-- definition of z .

(\x -> (\y -> let z = \y -> y * 10 in z y) (x + 5)) 5

(\x -> (\y -> (\z -> z y) (\y -> y * 10)) (x + 5)) 5

-- this last step is:

(λx. (λy. (λz. z y) (λy. y * 10)) (x + 5)) 5

-- from there we just beta reduce.
