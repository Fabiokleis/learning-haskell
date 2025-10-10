module FunctionwithLet where

printInc2 n = let plusTwo = n + 2
              in print plusTwo

-- turns into

-- printInc2' n =
--   (\plusTwo -> print plusTwo) (n + 2)

-- Intermission: Exercises

mult1      = x * y
   where x = 5
         y = 6

mult2 = let x = 5
            y = 6
        in x * y

-- 1. let x = 3; y = 1000 in x * 3 + y

e1        = x * 3 + y
  where x = 3
        y = 1000


-- 2. let y = 10; x = 10 * 5 + y in x * 5

e2        = x * 5
  where y = 10
        x = 10 * 5 + y

-- 3. let x = 7; y = negate x; z = y * 10 in z / x + y

e3        = z / x + y
  where z = y * 10
        y = negate x
        x = 7

waxOn       = x * 5
    where z = 7
          x = y ^ 2
          y = z + 8

triple x = x * 3

waxOff x = triple x