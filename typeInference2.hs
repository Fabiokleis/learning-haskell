module TypeInference2 where

f x y = x + y + 3


-- (++) :: [a] -> [a] -> [a]


--myConcat :: String -> String
--myConcat :: [Char] -> [Char]
myConcat x = x ++ " yo"

-- (*) :: Num a => a -> a -> a
myMult :: Fractional x => x -> x
myMult x = (x / 3) * 5

-- take :: Int -> [a] -> [a]
myTake :: Int -> [Char]
myTake x = take x "hey you"

-- (>) :: Ord a => a -> a -> Bool
myCom :: Int -> Bool
myCom x = x > (length [1..10])

-- (<) :: Ord a => a -> a -> Bool
myAlph :: Char -> Bool
myAlph x = x < 'z'

-- triple :: Integer -> Integer
-- triple x = x * 3
triple x = tripleItYo x
  where tripleItYo :: Integer -> Integer
        tripleItYo y = y * 3

-- chapter exercises
-- 1. c
-- 2. a
-- 3. b
-- 4. c

-- determine the type
-- 1.
-- a. (* 9) 6 :: Num a => a   -- 54
-- b. head [(0, "doge"), (1, "kitteh")] :: Num a => (a, String) -- (0, "doge")
-- c. head [(0 :: Integer, "doge"), (1, "kitteh")] :: (Integer, String) -- (0, "doge")
-- d. if False then True else False :: Bool -- False
-- e. length [1, 2, 3, 4, 5] :: Int -- 5
-- f. (length [1, 2, 3, 4]) > (length "TACOCAT") :: Bool -- False

-- 2. Num a => a
-- 3. Fractional a => a
-- 4. [Char]


functionH :: [a] -> a
functionH (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False

functionS :: (a, b) -> b
functionS (x, y) = y

-- 1
i :: a -> a
i x = x

-- 2
c :: a -> b -> a
c x y = x

-- 3
c'' :: b -> a -> b
c'' x y = x

-- 4
c' :: a -> b -> b
c' a b = b

-- 5
r :: [a] -> [a]
--r a = a
r [a] = [a]

-- 6
co :: (b -> c) -> (a -> b) -> (a -> c)
co f g h = f (g h)

-- 7
a :: (a -> c) -> a -> a
a f a = a

-- 8

a' :: (a -> b) -> a -> b
a' f a = f a

-- Type-Kwon-Do

-- 1
-- f :: Int -> String
-- f = undefined

-- g :: String -> Char
-- g = undefined

h :: Int -> Char
h a = 'a'

-- 2
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e x = w (q x)

-- 3
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform a = (xz $ fst a, yz $ snd a)

munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge f h x = fst $ h (f x)
