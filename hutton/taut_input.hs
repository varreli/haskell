-- won't run:

λ > eval [('A', False), ('B', True)] (And p1 p2)
False

λ > eval [('A', False), ('B', True)] (And p1 p4)
False

λ > eval [('A', False), ('B', True)] (And p2 p4)
True

λ > eval [('A', False), ('B', True)] (And p3 p4)
True
 

