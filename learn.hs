module Learn where

x = 10 * 5 + y

myResult = x * 5

y = 10

foo x =
    let y = x * 2
        z = x ^ 2
    in 2 * y * z

qPr x y = (quot x y) * y + (rem x y) == x
dPr x y = (div x y) * y + (rem x y) == x