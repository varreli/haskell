
-- the evaluation order is now explicit:

-- value (Add (Add (Val 4) (Val 1)) (Val 10))
-- eval (Add (Add (Val 4) (Val 1)) (Val 10)) []
-- eval (Add (Val 4) (Val 1)) [EVAL (Val 10)]
-- eval (Val 4) [EVAL (Val 1), EVAL (Val 10)]
-- exec [EVAL (Val 1), EVAL (Val 10)] 4
-- eval (Val 1) [ADD 4, EVAL (Val 10)]
-- exec [ADD 4, EVAL (Val 10)] 1
-- exec [EVAL (Val 10)] 5
-- eval (Val 10) [ADD 5]
-- exec [ADD 5] 10
-- exec [] 15
-- => 15
