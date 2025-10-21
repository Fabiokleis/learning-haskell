module Main where

type Pos = (Int, Int)
type Cells = [[Symbol]]
type Width = Int
type Height = Int

data Symbol = Emp | Sep | Op | Xp

instance Show Symbol where
  show Emp = " "
  show Sep = "|"
  show Op  = "O"
  show Xp  = "X"

data Pl

data Board = Board Cells Width Height deriving Show

newBoard :: Int -> Int -> Board
newBoard w h =
  Board (replicate h $ replicate w Emp) w h

pprintBoard :: [[Symbol]] -> Int -> IO ()
pprintBoard [] w = putStrLn $ concat $ replicate w " "
pprintBoard (x:xs) w = do
  let t = tail x
  let h = head x
  let mapped = concat [[h], (concat $ map (\s -> [Sep] ++ [s]) t)]
  pprintBoard xs w
  putStrLn (concat $ map (\s -> show s) mapped)
  putStrLn $ concat $ replicate w "__"

changeBoard :: Board -> Symbol -> Pos -> Board
changeBoard (Board b h w) symbol pos = do
  let (fh, sh) = splitAt (fst pos) b
  let row = last fh
  let rest = take ((fst pos) - 1) fh
  let (rfh, rsh) = splitAt (snd pos) row
  let rrest = take ((snd pos) - 1) row
  let nrow = rest ++ [rrest ++ [symbol] ++ rsh]
  let cells = nrow ++ sh
  Board cells h w

gameLoop :: Board -> IO ()
gameLoop b = do
  let (Board c w _) = b
  putStrLn "Board"
  pprintBoard c w

  putStrLn "press enter to continue, q or quit to stop: "
  opt <- getLine
  case opt of
    "q" -> putStrLn "exit..."
    "quit" -> putStrLn "exiting ..."
    "" -> gameLoop b
    "help" -> putStrLn "tictactoe options: (q)uit, help or enter to continue"
    _ -> putStrLn "exit..."


main :: IO ()
main = do
  let board = newBoard 3 3
  gameLoop board
