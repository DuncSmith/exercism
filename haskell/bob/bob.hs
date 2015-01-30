module Bob (responseFor) where

import Data.List
import Data.Char

responseFor :: String -> String
responseFor said | silence said = "Fine. Be that way!"
                 | shout said = "Woah, chill out!"
                 | question said = "Sure."
                 | otherwise = "Whatever."
                   
silence :: String -> Bool
silence [] = True
silence said = all (\x -> x == ' ') said

shout :: String -> Bool
shout said = said == map toUpper said

question :: String -> Bool
question said = isSuffixOf "?" said
