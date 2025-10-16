module Trivial where

data Trivial = Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True

data Identity a =
  Identity a

-- instance Eq a => Eq (Identity a) where
--   (==) (Identity v) (Identity v') = v == v'

instance Ord a => Eq (Identity a) where
  (==) (Identity v) (Identity v') =
    compare v v' == EQ


-- Intermission: Exercises
-- 1
data TisAnInteger =
  TisAn Integer deriving Show

instance Eq TisAnInteger where
  (==) (TisAn a) (TisAn b) = a == b


-- 2
data TwoIntegers =
  Two Integer Integer deriving Show

instance Eq TwoIntegers where
  (==) (Two a b) (Two a' b') = a == a' && b == b'

-- 3
data StringOrInt =
  TisAnInt Int
  | TisAString String deriving Show

instance Eq StringOrInt where
  (==) (TisAString a) (TisAString b) = a == b
  (==) (TisAnInt a)   (TisAnInt b)   = a == b
  (==) _ _                           = False

-- 4
data Pair a = Pair a a deriving Show

instance Eq a => Eq (Pair a) where
  (==) (Pair a b) (Pair a' b') = a == a' && b == b'

-- 5
data Tuple a b = Tuple a b deriving Show

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple a' b') = a == a' && b == b'

-- 6
data Which a =
  ThisOne a
  | ThatOne a deriving Show

instance Eq a => Eq (Which a) where
  (==) (ThisOne a) (ThisOne b) = a == b
  (==) (ThatOne a) (ThatOne b) = a == b
  (==) (ThatOne a) (ThisOne b) = a == b
  (==) (ThisOne a) (ThatOne b) = a == b

-- 7
data EitherOr a b =
  Hello a
  | Goodbye b deriving Show

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a')     = a == a'
  (==) (Goodbye a) (Goodbye a') = a == a'
  (==) _ _                      = False
