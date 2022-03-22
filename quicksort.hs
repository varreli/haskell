qqsort :: (Ord m) => [m] -> [m] 

qqsort [] = [] 

qqsort (q:qs) = qqsort [m | m <- qs, m < q] ++ [q] ++
     qqsort [n | n <- qs, n >= q] 

main = do
       print("Demo to show quicksort in haskell !!")
       let array1 = [10, 30, 56, 2, 1] 
       let array2 = [23, 13, 10, 8, 9, 1, 5, 42, 50] 
       let array3 = [3, 7, 1, 4, 9, 56, 10] 
       let array4 = [9, 6, 12, 15, 10 , 2 , 4, 20] 
       let array5 = [200, 100, 400, 250, 450, 150, 350] 
       print("Printing result after sorting in quicksort in haskell !!")
       
       let result1 = qqsort array1
       let result2 = qqsort array2
       let result3 = qqsort array3
       let result4 = qqsort array4
       let result5 = qqsort array5
       
       print("first result array is ::", result1)
       print("second result array is ::", result2)
       print("third result array is ::", result3)
       print("fourth result array is ::", result4)
       print("fifth result array is ::", result5)
