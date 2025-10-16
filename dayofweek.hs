module DayOfWeek where

import Data.List

data DayOfWeek = Mon | Tue | Weds | Thu | Fri | Sat | Sun deriving Show
-- day of week and numerical day of month
data Date = Date DayOfWeek Int deriving Show
instance Eq DayOfWeek where
  (==) Mon  Mon   = True
  (==) Tue  Tue   = True
  (==) Weds Weds  = True
  (==) Thu  Thu   = True
  (==) Fri  Fri   = True
  (==) Sat  Sat   = True
  (==) Sun  Sun   = True
  (==) _ _        = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') =
    weekday == weekday' && dayOfMonth == dayOfMonth'

instance Ord DayOfWeek where
  compare Fri Fri = EQ
  compare Fri _   = GT
  compare _   Fri = LT
  compare _   _   = EQ

-- 1
data Person = Person Bool 

printPerson :: Person -> IO ()
--printPerson person = putStrLn $ show person -- no instance Show for Person
printPerson (Person a) = putStrLn $ show a

-- 2
data Mood = Blah
  | Woot deriving Show

-- no instance of Eq to use (==) inside the function settledown
instance Eq Mood where
  (==) Woot Woot = True
  (==) _ _ = False

settleDown x = if x == Woot then Blah else x

-- 3
-- a) only Mood data constructors
-- b) fails because Mood doens't have Num instance
-- c) fails because Mood doens't have Ord instance

-- 4
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving Show

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

data Rocks = Rocks String deriving (Eq, Show)

data Yeah = Yeah Bool deriving (Eq, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Show)

-- 1
-- phew = Papu "chases" True -- expects data constructor
truth = Papu (Rocks "chomskydoz") (Yeah True)
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

--comparePapus :: Papu -> Papu -> Bool -- fails Papu doens't have Ord instance
--comparePapus p p' = p > p'

-- 1
-- a) i :: Num a => a
-- i = 1

-- 2) fails
-- 3) works
-- 4) works
-- 5) works
-- 6) works
-- 7) fails
-- 8) fails
-- 9) works
-- 10) works
-- 11) works

mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
--signifier :: Ord a => [a] -> a
signifier xs = head (mySort xs)

-- 1
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f a b = (==) (f a) b

arith :: Num b => (a -> b) -> Integer -> a -> b
arith f x y = (+) (f y) (fromInteger x)
