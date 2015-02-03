module Accumulate (accumulate) where
  
accumulate :: (a -> b) -> [a] -> [b]
accumulate _ [] = []
accumulate operation (first:rest) = operation first : accumulate operation rest
