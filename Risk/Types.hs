module Risk.Types
    ( Player(..)
    , Region
    , Units
    ) where

type Region = String

type Units = Int

data Player =
      PlayerRed
    | PlayerGreen
    | PlayerBlue
    | PlayerYellow
    deriving (Show,Eq,Enum)
