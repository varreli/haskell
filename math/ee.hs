ff :: P * (Q + R) -> P * Q + P * R

ff (x, y)  = left (x, y)
ff (x, z) = right (x, z)
