module Main where

fibs = 1 : scanl (+) 1 fibs

main = print $ take 11 fibs
 
