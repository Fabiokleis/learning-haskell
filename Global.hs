module GlobalLocal where

topLevelFunction :: Integer -> Integer
topLevelFunction x = x + woot + topLevelValue
  where woot :: Integer
        woot = 10

topLevelValue :: Integer
topLevelValue = 5

tpFl :: Integer -> Integer
tpFl x = let woot = 10
         in x + woot + topLevelValue

area d = pi * (r * r)
  where r = d / 2
