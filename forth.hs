module Forth where

data Expr =
  Lit Int
  | Sym String [Expr]
  | Add
  | Sub
  | Mul
  | Div
  | Dup
  | Swap
  | Over
  | Drop
  deriving (Show, Eq)

type Program = [Expr]
type Row = (String, Expr)
type Table = [Row]
data Compiler = Compiler { program :: Program, table :: Table } deriving Show

upsert :: Table -> Table -> Row -> Table
upsert [] table row = row : table 
upsert (row:rest) table (key, value) =
  if key == fst row then concat [(key, value) : rest, table] else upsert rest (row : table) (key, value) 

parseExpr :: String -> Either String Expr
parseExpr "+" = Right Add 
parseExpr "-" = Right Sub
parseExpr "*" = Right Mul
parseExpr "/" = Right Div
parseExpr "dup"  = Right Dup  
parseExpr "swap" = Right Swap 
parseExpr "over" = Right Dup
parseExpr "drop" = Right Drop
parseExpr "DUP" = Right Dup
parseExpr "SWAP" = Right Swap
parseExpr "OVER" = Right Over
parseExpr "DROP" = Right Drop
parseExpr any = error ("no matching expression: " ++ "'" ++ any ++ "'")

parse :: [String] -> Compiler -> Either String Program
parse [] (Compiler prog _) = Right prog
parse (":":symbol:rest) (Compiler prog table) =
  case parse exprs (Compiler [] table) of
    Right defs ->  
        parse next (Compiler ((Sym symbol defs) : prog) table)
    Left err -> Left err
  where
    exprs = takeWhile (\x -> x /= ";") rest
    next = tail (dropWhile (\x -> x /= ";") rest)
parse (token:rest) (Compiler prog table) =
    case reads token :: [(Int, String)] of
      [(lit, "")] -> parse rest (Compiler ((Lit lit) : prog) table)
      _ ->
        case parseExpr token of
             Right expr ->
               parse rest (Compiler (expr : prog) table)
             Left err -> Left err

compile :: String -> Either String Compiler
compile code =
  case parse (words code) (Compiler [] []) of
    Right prog ->
      Right (Compiler prog [])
    Left err ->
      Left err

type Stack = [Int]
execute :: Compiler -> Either String Int 
execute = undefined

main :: IO ()
main = do
  let
    prog1 = "3 4 +"        
    prog2 = "10 5 - 2 *"   
    prog3 = "20 5 / 3 +"   
    prog4 = "1 2 3 * -"    
    prog5 = "5 2 10 /"     
    prog6 = "1 2 3 +"      
    prog7 = "1 + 3"
    prog8 = "1 2 + : defined 10 ; 1"
    prog9 = "1 2 unknown"  

  
  putStrLn "--- Forth ---"
  print $ compile prog1 
  print $ compile prog1
  print $ compile prog2
  print $ compile prog3
  print $ compile prog4
  print $ compile prog5
  print $ compile prog6
  print $ compile prog7
  print $ compile prog8
  putStrLn "--------------------------------"

  -- putStrLn "Enter a Forth sequence (e.g., 5 6 * 10 2 / -):"
  -- input <- getLine
  -- case parseAndRun input of
  --   Right stack -> putStrLn $ "Final Stack: " ++ show stack
  --   Left err    -> putStrLn $ "Evaluation Failed: " ++ err

