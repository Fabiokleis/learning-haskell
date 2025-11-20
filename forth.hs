module ForthEvaluator where

type Stack = [Int]

operate :: String -> Stack -> Either String Stack
operate op (b:a:stack) =
  let
    opFn = case op of
             "+" -> (+)
             "-" -> (-)
             "*" -> (*)
             "/" -> div
             _   -> error "operator not defined"

    result = opFn a b
  in
    Right (result : stack)
operate _ _ = Left "operation requires two operands"

eval :: [String] -> Stack -> Either String Stack
eval [] stack = Right stack
eval (token:rest) stack =
  case reads token :: [(Int, String)] of
    [(n, "")] ->
      eval rest (n : stack)

    _ | token `elem` ["+", "-", "*", "/"] ->
      case operate token stack of
        Right newStack ->
          eval rest newStack
        Left err ->
          Left err
    _ ->
      Left ("unknown token: " ++ token)

parseAndRun :: String -> Either String Stack
parseAndRun input =
  let
    tokens = words input
  in
    eval tokens []

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
    prog8 = "1 2 unknown"  

  putStrLn "--- Forth Evaluator Examples ---"
  print $ parseAndRun prog1
  print $ parseAndRun prog2
  print $ parseAndRun prog3
  print $ parseAndRun prog4
  print $ parseAndRun prog5
  print $ parseAndRun prog6
  print $ parseAndRun prog7
  print $ parseAndRun prog8
  putStrLn "--------------------------------"

  putStrLn "Enter a Forth sequence (e.g., 5 6 * 10 2 / -):"
  input <- getLine
  case parseAndRun input of
    Right stack -> putStrLn $ "Final Stack: " ++ show stack
    Left err    -> putStrLn $ "Evaluation Failed: " ++ err

