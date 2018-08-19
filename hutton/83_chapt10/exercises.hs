-- exercise 1 chapter 10

displayString xs = sequence_ [ putChar x | x <- xs]
newline = putChar '\n'

ff list = do displayString list
             newline


