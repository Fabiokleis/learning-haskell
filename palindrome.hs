module Palindrome where

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

myAbs :: Integer -> Integer
myAbs x =
  if x > 0
  then x
  else -x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))

f x y = ((snd x, snd y), (fst x, fst y))

lenP1 :: [a] -> Int
lenP1 xs = length xs + 1

id2 :: a -> a
id2 x = x

h :: [a] -> a
h = \(x:xs) -> x

f1 :: (a, b) -> a
f1 (a, b) = a

type Name = String
data Pet = Cat | Dog Name deriving Show
