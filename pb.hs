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

z y  is  (\y -> y * 10) (\x -> x + 5)

(λy. y * 10) (5 + 5)

\ is λ and -> is .

let x = 5 in let y = x + 5 in let z y = y * 10 in z y

(\x -> let y = x + 5 in let z y = y * 10 in z y) 5

(\x -> (\y -> let z y = y * 10 in z y) (x + 5)) 5

(\x -> (\y -> let z = \y -> y * 10 in z y) (x + 5)) 5

(\x -> (\y -> (\z -> z y) (\y -> y * 10)) (x + 5)) 5

now we just beta reduce

the last step is: 
(λx. (λy. (λz. z y) (λy. y * 10)) (x + 5)) 5
