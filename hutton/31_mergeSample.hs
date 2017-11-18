> take 2 (merger (0:3:4:7:[]) (1:2:6:7:8:9:[]))   
= take 2 (0:merger (3:4:7:[]) (1:2:6:7:8:9:[]))
= 0:take 1 (merger (3:4:7:[]) (1:2:6:7:8:9:[]))
= 0:take 1 (1:merger (3:4:7:[]) (2:6:7:8:9:[]))
= 0:1:take 0 (merger (3:4:7:[]) (2:6:7:8:9:[]))

= 0:1:[]

-- above is an example of lazy evaluation. 
-- the merger operates until take is 0.


-- reverse is not lazy though:

> take 2 (reverse (2:3:4:5:[]))
= take 2 (5:4:3:2:reverse [])

> take 2 (reverse [2,3,4,5]
[5,4]

