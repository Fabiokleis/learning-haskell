module Reverse where

rvrs :: String -> String
rvrs x =  concat [drop 9 x, take 4 $ drop 5 x, take 5 x]

main :: IO ()
main = print ()


area d = pi * (r * r)
  where r = d / 2

area2 d = let r = d / 2
         in pi * (r * r)

