module Risk.Types
    ( Player(..)
    , RegionName
    , Units
    ) where

type RegionName = String

type Units = Int

data Player =
      PlayerRed
    | PlayerGreen
    | PlayerBlue
    | PlayerYellow
    deriving (Show,Eq,Enum)
