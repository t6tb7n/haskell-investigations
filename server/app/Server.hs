module Server (serve) where
import Data.Char (toUpper)

mymap :: (Char -> Char) -> [Char] -> [Char]
mymap f (x:xs) = [(f x)] ++ (mymap f xs)
mymap f [] = []

serve :: String -> String
serve x = mymap toUpper x