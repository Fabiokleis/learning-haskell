module Mfs where

-- 1.
-- all
-- 2.
-- Num a => a -> a -> a

--addOne x = x + 1
addOne = \x -> x + 1

addOnIfOdd n = case odd n of
  True -> f n
  False -> n
  where f = \x -> x + 1 -- f n = n + 1

--addFive x y = (if x > y then y else x) + 5
addFive = \x -> \y -> (if x > y then y else x) + 5
  
--mflip f = \x -> \y -> f y x
mflip f x y = f y x


-- :set -Wall to enable all warnings
itIsTwo :: Integer -> Bool
itIsTwo 2 = True
itIsTwo _ = False
