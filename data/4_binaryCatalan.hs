-- binary trees with 4 leaves :

-- these two are symmetric:

  /\         /\
 /\           /\
/\             /\  


-- these two are symmetric:
   .          . 
  / \        / \
 /\            /\  
  /\          /\  


    . 
   / \
  /\ /\

-- There are 5 bin trees with 4 leaves.
-- So the number of binary trees with n + 1 leaves
-- is equal to Cn, the nth Catalan number, which is 5 :

T = a + a^2 + 2a^3 + 5a^4 + 14a^5 ...

-- so this gives a way to count the number of values
-- contained in the binary tree data type.
