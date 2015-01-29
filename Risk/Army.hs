module Risk.Army
    ( Army(..)
    , decrementArmy
    ) where

data Army = Army
    { getArmySize :: Int
    } deriving (Show, Read, Eq, Ord)

decrementArmy :: Army
              -> Army
decrementArmy army =
    army { getArmySize = (getArmySize army) - 1 }
