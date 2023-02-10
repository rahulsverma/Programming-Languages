--Question 1

replace :: Int -> Int -> [Int] -> [Int]
replace x y [] = []
replace x y (z:zs)
  |x == z = y : replace x y zs
  |otherwise = z : replace x y zs



--Question 2

deletenth :: Int -> [a] -> [a]
deletenth = remove 1
    where remove _ _ []     = []
          remove i n (x:xs) = if i == n
            then remove 1 n xs
            else x:remove (i+1) n xs
delete = deletenth



--Question 3

oddelem [] = []
oddelem [x] = [x]
oddelem (x:y:ys) = x:oddelem ys

maxodd lt = maximum(oddelem lt)



--Question 4

append :: [a] -> [a] -> [a]
append [] ys = ys
append xs [] = xs
append (x:xs) ys = x: append xs ys
removedups [] = []
removedups (x:xs)
  |elem x xs = removedups xs
  |otherwise = x:removedups xs

union lt1 lt2 = removedups(append lt1 lt2)