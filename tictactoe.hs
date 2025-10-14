module Main where

type Pos = (Int, Int)
type Cells = [[Symbol]]
data Symbol = E | S | O | X deriving Show
data Board = Board Cells Int Int deriving Show

newBoard :: Int -> Int -> Board
newBoard w h =
  Board (replicate h $ replicate w E) w h

changeBoard :: Board -> Symbol -> Pos -> Board
changeBoard = undefined

pprintBoard :: [[Char]] -> IO ()
pprintBoard [] = putStrLn $ replicate 6 '_'
pprintBoard (x:xs) = do
  let t = tail x
  let h = head x
  putStrLn $ concat $ replicate (length x) "__"
  putStrLn ([h] ++ concat ((map (\s -> ['|'] ++ [s]) t)))
  pprintBoard xs

main :: IO ()
main = do
  let (Board c _ _) = newBoard 3 3
  putStrLn "Board"
  --pprintBoard c
