qusort :: (Ord m) => [m] -> [m] 

qusort [] = [] 

qusort (q:qs) = qusort [m | m <- qs, m < q] ++ [q] ++
     qusort [n | n <- qs, n >= q] 

main = do
       print("Demo to show quicksort in haskell !!")
       let array1 = [10, 30, 56, 2, 1] 
       let array2 = [23, 13, 10, 8, 9, 1, 5, 42, 50] 
       let array3 = [3, 7, 1, 4, 9, 56, 10] 
       let array4 = [9, 6, 12, 15, 10 , 2 , 4, 20] 
       let array5 = [200, 100, 400, 250, 450, 150, 350] 
       print("Printing result after sorting in quicksort in haskell !!")
       
       let result1 = qusort array1
       let result2 = qusort array2
       let result3 = qusort array3
       let result4 = qusort array4
       let result5 = qusort array5
       
       print("first result array is  :", result1)
       print("second result array is :", result2)
       print("third result array is  :", result3)
       print("fourth result array is :", result4)
       print("fifth result array is  :", result5)
