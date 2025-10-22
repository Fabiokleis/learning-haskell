module Main where

type Pos = (Int, Int)
type Cells = [[Symbol]]
type Width = Int
type Height = Int

data Symbol = Emp | Sep | Op | Xp | Pp
data Player = Player { symbol :: Symbol, plays :: [Pos] } deriving Show

instance Show Symbol where
  show Emp = " "
  show Sep = "|"
  show Op  = "O"
  show Xp  = "X"
  show Pp  = "+"

instance Eq Symbol where
  (==) Op  Op  = True
  (==) Xp  Xp  = True
  (==) Pp  Pp  = True
  (==) Emp Emp = True
  (==) Sep Sep = True
  (==) _ _     = False

data Board = Board { cells  :: Cells, width  :: Width, height :: Height } deriving Show
data GameState = GameState { board   :: Board, players :: [Player]} deriving Show

newBoard :: Int -> Int -> Board
newBoard w h =
  Board (replicate h $ replicate w Emp) w h

pprintBoard :: [[Symbol]] -> Int -> IO ()
pprintBoard [] w = putStrLn $ concat $ replicate w " "
pprintBoard (x:xs) w = do
  let t = tail x
  let h = head x
  let mapped = concat [[h], (concat $ map (\s -> [Sep] ++ [s]) t)]
  putStrLn (concat $ map (\s -> show s) mapped)
  putStrLn $ concat $ replicate w "__"
  pprintBoard xs w

changeBoard :: Board -> Symbol -> Pos -> Board
changeBoard (Board c h w) symbol (a,b)
  | a == 0 || b == 0 || a > h || b > w = Board c h w -- invalid position, accepts only (1..h, 1..w) range
  | otherwise = Board cells h w 
    where
      (fh, sh)   = splitAt a c
      row        = last fh
      rest       = take (a - 1) fh
      (rfh, rsh) = splitAt b row
      rrest      = take (b - 1) row
      nrow       = rest ++ [rrest ++ [symbol] ++ rsh]
      cells      = nrow ++ sh

updatePlayers :: [Player] -> Player -> [Player]
updatePlayers players (Player v p1) =
  [ if s == v then (Player s (p1 ++ p2)) else (Player s p2) | (Player s p2) <- players ]

rowWin :: Board -> Player -> Bool
rowWin (Board c h w) (Player s _) =
  length [ x | x <- [ length [ sym | sym <- row, s == sym ] | row <- c ], x == h ] > 0

transpose :: [[a]] -> [[a]] -> [[a]]
transpose [] acc = reverse acc
transpose xs acc =
  transpose ([ t | (_:t) <- xs ]) ([ h | (h:_) <- xs ] : acc)

columnWin :: Board -> Player -> Bool
columnWin (Board c h w) p =
  rowWin (Board (transpose c []) h w) p

diagonalWin :: Board -> Player -> Bool
diagonalWin (Board c h w) (Player s _) = undefined
  
hasWinner :: GameState -> Bool
hasWinner (GameState board []) = False
hasWinner (GameState board (p:ps))
  | rowWin board p       = True
  | columnWin board p    = True
--  | diagonalWin board p  = True
  | otherwise            = hasWinner (GameState board ps)

gameLoop :: GameState -> [Player] -> IO ()
gameLoop (GameState b p) [] =
  gameLoop (GameState b p) p
gameLoop gameState (current:nexts) = do
  let (GameState board players) = gameState
  let (Board c h w) = board
  let (Player symbol plays) = current
  
  putStrLn $ show gameState
  putStrLn "Board"
  pprintBoard c w

  putStrLn "press enter to play or (q)uit to stop: "
  opt <- getLine
  case opt of
    "q" -> putStrLn "exit..."
    "quit" -> putStrLn "exiting ..."
    "" -> do

      putStrLn $ show current ++ ": type a tuple (a,b) to play at the position"
      input <- getLine
      let pos = read input :: Pos
      let newBoard = changeBoard board symbol pos
      let newPlayers = updatePlayers players (Player symbol (pos : plays))
      let newGameState = GameState newBoard newPlayers

      putStrLn $ show (hasWinner newGameState)
      
      gameLoop newGameState nexts
    "help" -> putStrLn "tictactoe options: (q)uit, help or enter to continue"
    _ -> gameLoop gameState (current : nexts)


main :: IO ()
main = do
  let board = newBoard 3 3
  let players = [Player Xp [], Player Op []] -- Player Pp []
  let gameState = GameState board players
  gameLoop gameState players
