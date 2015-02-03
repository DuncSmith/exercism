module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year | year `multiple` 400 = True
                | year `multiple` 100 = False
                | year `multiple` 4 = True
                | otherwise = False

multiple :: Integer -> Integer -> Bool
multiple value divisor = (value `mod` divisor) == 0              
