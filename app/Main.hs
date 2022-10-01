module Main where

toIntsFromString :: String -> [Int]
toIntsFromString s = let ws = words s in map read ws

maxMin :: Ord a => [a] -> Maybe (a, a)
maxMin (x : xs) = Just $ foldr 
    (\x (max, min) -> (if x > max then x else max, if x < min then x else min)) 
    (x, x) 
    xs

maxMin _ = Nothing


main :: IO ()
main = do
    let
        data_file :: FilePath
        data_file = "data/numbers.txt"
    numbers <- readFile data_file
    let
        valuesInt = toIntsFromString numbers
        stats = maxMin valuesInt

    putStrLn numbers
    print valuesInt
    print stats
