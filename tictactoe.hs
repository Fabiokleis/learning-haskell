module Main where

type Pos = (Int, Int)
type Cells = [[Symbol]]


data Symbol = Emp | Sep | Op | Xp

instance Show Symbol where
  show Emp = " "
  show Sep = "|"
  show Op  = "O"
  show Xp  = "X"

data Board = Board Cells Int Int deriving Show

newBoard :: Int -> Int -> Board
newBoard w h =
  Board (replicate h $ replicate w Emp) w h

pprintBoard :: [[Symbol]] -> Int -> IO ()
pprintBoard [] w = putStrLn $ concat $ replicate w " "
pprintBoard (x:xs) w = do
  let t = tail x
  let h = head x
  let mapped = concat [[h], (concat $ map (\s -> [Sep] ++ [s]) t)]
  putStrLn $ concat $ replicate w "__"
  putStrLn (concat $ map (\s -> show s) mapped)
  pprintBoard xs w

changeBoard :: Board -> Symbol -> Pos -> Board
changeBoard = undefined
  

main :: IO ()
main = do
  let (Board c w _) = newBoard 3 3
  putStrLn "Board"
  pprintBoard c w
