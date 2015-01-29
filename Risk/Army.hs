module Risk.Army
    ( Army(..)
    ) where

data Army = Army
    { getArmySize :: Int
    } deriving (Show, Read, Eq, Ord)
