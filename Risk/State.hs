module Risk.State where

import qualified Data.Map as M
import Risk.Types
import Risk.World

--------------- circular zipper
data Zipper a = Zipper [a] [a]

zipFromList :: [a] -> Zipper a
zipFromList [] = error "cannot create zipper of empty list"
zipFromList l = Zipper [] l

zipNext (Zipper p [])     = Zipper [] (reverse p)
zipNext (Zipper p (x:xs)) = Zipper (x:p) xs

zipAtEnd (Zipper p l) = length l == 1

zipCurrent (Zipper _ [])    = error "internal error : cannot happen"
zipCurrent (Zipper _ (x:_)) = x
--------------------------------

data State = State
    { worldMap :: M.Map RegionName (Player, Units)
    , players  :: Zipper Player
    }

initialState :: [Player] -> State
initialState players =
    State
        { worldMap = M.fromList $ map (\r -> (r, (PlayerRed, 0))) $ concatMap continentRegions $ allRegions
        , players  = zipFromList players
        }

stSetRegion :: RegionName -> Player -> Units -> State -> State
stSetRegion region player nbUnits st =
    st { worldMap = M.adjust (const (player, nbUnits)) region (worldMap st) }

stGetRegion :: RegionName -> State -> Maybe (Player, Units)
stGetRegion region st = M.lookup region (worldMap st)
