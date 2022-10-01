{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use max" #-}
module Main where
import Data.Ord (Ord)

toIntsFromString :: String -> [Int]
toIntsFromString s = let ws = words s in map read ws

maxMin :: Ord a => [a] -> Maybe (a, a)
maxMin (x : xs) = Just $ foldr 
    (\x (max, min) -> (if x > max then x else max, if x < min then x else min)) 
    (x, x) 
    xs
maxMin _ = Nothing

minMaxSum :: Ord a => Num a => [a] -> Maybe (a, a, a)
minMaxSum (x : xs) = Just $ foldr
    (\x (min, max, sum) -> (if x < min then x else min, if x > max then x else max, sum + x))
    (x, x, x)
    xs
minMaxSum _ = Nothing 




main :: IO ()
main = do
    let
        data_file :: FilePath
        data_file = "data/numbers.txt"
    numbers <- readFile data_file
    let
        valuesInt = toIntsFromString numbers
        stats = maxMin valuesInt
        stats2 = minMaxSum valuesInt

    putStrLn numbers
    print valuesInt
    print stats
    print stats2
