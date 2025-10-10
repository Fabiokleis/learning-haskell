-- hello haskell programming

sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

triple :: Integer -> Integer
triple x = x * 3

piSqr :: Double -> Double
piSqr x = pi * x * x