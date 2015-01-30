module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor said | silence said = "Fine. Be that way!"
                 | shout said = "Woah, chill out!"
                 | question said = "Sure."
                 | otherwise = "Whatever."
                   
silence :: String -> Bool
silence said = all isSpace said

shout :: String -> Bool
shout said = (any isAlpha said) && not (any isLower said)

question :: String -> Bool
question said = (last said) == '?'
