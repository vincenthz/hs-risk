module Risk.Battle
    ( runBattle
    ) where

import Control.Applicative
import Control.Monad
import Data.List (sort)
import System.Random
import Risk.Army

runBattle :: Army
          -> Army
          -> IO (Army, Army)
runBattle offensive defensive = do
    offDices <- getDices offensive 3
    defDices <- getDices defensive 2
    return $ runCombats (offensive, defensive) $ zip offDices defDices

runCombats :: (Army, Army)
           -> [(Int, Int)]
           -> (Army, Army)
runCombats armies [] = armies
runCombats (offensive, defensive) ((doff, ddef):xs) =
    if (doff > ddef)
        then runCombats (offensive, decrementArmy defensive) xs
        else runCombats (decrementArmy offensive, defensive) xs

getDices :: Army
         -> Int
         -> IO [Int]
getDices army maxDices =
    reverse . sort <$> replicateM size (randomRIO (1, 7))
  where
    size :: Int
    size = min (getArmySize army) maxDices
