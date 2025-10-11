module Print3Broken where

greeting :: String
greeting = "Yarrrrr"

printSecond :: IO ()
printSecond = do
  putStrLn greeting

main :: IO ()
main = do
  putStrLn greeting
  printSecond

-- op -> infix
-- (op) -> prefix

-- 'P' : "apuchon" -> "Papuchon"
-- (:) 'P' "apuchon" -> "Papuchon"
-- head "Papuchon" -> 'P'
-- tail "Papuchon" -> 'apuchon'
-- "Papuchon" !! 0 -> 'P' // works on top of indexes
-- take 1 "Papuchon" -> 'P' // takes until
-- drop 2 "Papuchon" -> "puchon"

-- Chapter Exercises
-- Reading syntax

-- 1
-- a) concat [[1, 2, 3], [4, 5, 6]] -> [1, 2, 3, 4, 5, 6]
-- b) (++) [1, 2, 3], [4, 5, 6] -> [1, 2, 3, 4, 5, 6]
-- c) (++) "hello" " world" -> "hello world"
-- d) ["hello" ++ " world"] -> ["hello world"]
-- e) 4 !! "hello" -> error
-- f) (!!) "hello" 4 -> 'o'
-- g) take "4 lovely" -> error
-- h) take 3 "awesome" -> awe

-- 2
-- a) concat [[1 * 6], [2 * 6], [3 * 6]] -> [6, 12, 18]
-- b) "rain" ++ drop 2 "elbow" -> "rainbow"
-- c) 10 * head [1, 2, 3] -> 10
-- d) (take 3 "Julie") ++ (tail "yes") -> "Jules"
-- e) concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]] -> [2, 3, 5, 6, 8, 9]


awExc :: String -> String
awExc x = x ++ "!"

get4 :: String -> Char
get4 x = x !! 4


thirdLetter :: String -> Char
thirdLetter x = x !! 3

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome" !! x

rvrs :: String -> String
rvrs x =  concat [drop 9 x, take 4 $ drop 5 x, take 5 x]
