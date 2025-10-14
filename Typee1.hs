module Type where

-- ex
-- 1
-- a) not :: Bool -> Bool
-- b) length :: [a] -> Int
-- c) concat :: [[a]] -> [a]
-- d) head :: [a] -> a
-- e) (<) :: Ord a => a -> a -> Bool

addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5

funcIgnoresArgs :: a -> a -> a -> String
funcIgnoresArgs x y z = "Blah"

nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

typicalCurriedFunction :: Integer
                       -> Bool
                       -> Integer
typicalCurriedFunction i b =
  i + (nonsense b)

uncurriedFunction :: (Integer, Bool)
                  -> Integer
uncurriedFunction (i, b) =
  i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonsense b)

anonymousAndManuallyNested :: Integer
                           -> Bool
                           -> Integer

anonymousAndManuallyNested =
  \i -> \b -> i + (nonsense b)

-- intermission: Exercises

-- 1.
-- let f :: a -> a -> a -> a; f = undefined
-- let x :: Char; x = undefined;
-- :t f x
-- f x :: Char -> Char -> Chat

-- 2. g 0 'c' "woot" :: Char
g :: a -> b -> c -> b
g a b c = b

-- a -> (b -> (c -> b))
-- a -> (b -> (c -> b)) 0 'c' "woot"
-- (b -> (c -> b)) 0 'c' "woot"
-- (b -> (c -> b)) 'c' "woot"
-- (c -> 'c') 'c' "woot"
-- (c -> 'c') "woot"
-- 'c'

-- 3. h 1.0 2 :: Num b => b
h :: (Num a, Num b) => a -> b -> b
h a b = b
-- h 1.0 2

-- 4. h 1 (5.5 :: Double) :: Double
h2 :: (Num a, Num b) => a -> b -> b
h2 a b = b
-- h 1 (5.5 :: Double)

-- 5. jackal "keyboard" "has the word jackal in it" :: String ([Char])
jackal :: (Ord a, Eq b) => a -> b -> a
jackal = undefined
-- jackal "keyboard" "has the word jackal in it"

-- 6. jackal "keyboard" :: Eq b => b -> String 
-- 7. kessel 1 2 :: (Ord a, Num a) => a
kessel :: (Ord a, Num b) => a -> b -> a
kessel a b = a

-- 8. kessel 1 (2 :: Integer) :: (Num a, Ord b) => a

-- 9. kessel (1 :: Integer) 2 :: Integer

aaa :: a -> a -> a
aaa x y = x -- y

abb :: a -> b -> b
abb a b = b -- 

x = 6 / fromIntegral (length [1, 2, 3])
