module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor said | silence said = "Fine. Be that way!"
                 | shout said = "Woah, chill out!"
                 | question said = "Sure."
                 | otherwise = "Whatever."
                   
silence :: String -> Bool
silence chars = all isSpace chars

shout :: String -> Bool
shout chars = any isAlpha chars && all (not . isLower) chars

question :: String -> Bool
question chars = (last chars) == '?'
