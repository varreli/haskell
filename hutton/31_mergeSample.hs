> take 2 (merger (0:3:4:7:[]) (1:2:6:7:8:9:[]))   
= take 2 (0:merger (3:4:7:[]) (1:2:6:7:8:9:[]))
= 0:take 1 (merger (3:4:7:[]) (1:2:6:7:8:9:[]))
= 0:take 1 (1:merger (3:4:7:[]) (2:6:7:8:9:[]))
= 0:1:take 0 (merger (3:4:7:[]) (2:6:7:8:9:[]))

= 0:1:[]

-- example of lazy evaluation. merger only
-- operates until take is satisfied.
