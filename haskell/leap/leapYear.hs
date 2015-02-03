module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear year | year `multiple` 400 = True
                | year `multiple` 100 = False
                | year `multiple` 4 = True
                | otherwise = False

multiple :: Int -> Int -> Bool
multiple value divisor = (value `mod` divisor) == 0              
