module Risk.Types
    ( Player(..)
    , Units
    ) where

type Units = Int

data Player =
      PlayerRed
    | PlayerGreen
    | PlayerBlue
    | PlayerYellow
    deriving (Show,Eq,Enum)
