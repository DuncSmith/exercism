module DNA (toRNA) where

toRNA :: String -> String
toRNA dna = map transcribe dna

transcribe :: Char -> Char
transcribe c | c == 'G' = 'C'
             | c == 'C' = 'G'
             | c == 'T' = 'A'
             | c == 'A' = 'U'
             | otherwise = c
