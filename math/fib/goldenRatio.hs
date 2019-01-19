-- find fibonacci numbers using the golden ratio:

f n = ((x ^ n) - (y ^ n)) / (x - y)
    where  
      x = (1 + sqrt 5) / 2
      y = (1 - sqrt 5) / 2


-- homework from upenn : 
-- https://www.seas.upenn.edu/~cis194/spring13/hw/06-laziness.pdf
