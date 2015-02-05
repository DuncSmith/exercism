module DNA (toRNA) where

toRNA :: String -> String
toRNA dna = map transcribe dna

transcribe :: Char -> Char
transcribe c = case c of
                 'G' -> 'C'
                 'C' -> 'G'
                 'T' -> 'A'
                 'A' -> 'U'
                 _   -> error "Invalid DNA nucleotide"
