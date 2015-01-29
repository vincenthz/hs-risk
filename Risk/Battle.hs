module Risk.Battle
    ( runBattle
    ) where

import Control.Applicative
import Control.Monad
import Data.List (sort)
import System.Random
import Risk.Types

runBattle :: Units
          -> Units
          -> IO (Units, Units)
runBattle offensive defensive = do
    offDices <- getDices offensive 3
    defDices <- getDices defensive 2
    return $ runCombats (offensive, defensive) $ zip offDices defDices

runCombats :: (Units, Units)
           -> [(Int, Int)]
           -> (Units, Units)
runCombats armies [] = armies
runCombats (offensive, defensive) ((doff, ddef):xs) =
    if (doff > ddef)
        then runCombats (offensive    , defensive - 1) xs
        else runCombats (offensive - 1, defensive    ) xs

getDices :: Units
         -> Int
         -> IO [Int]
getDices army maxDices =
    reverse . sort <$> replicateM size (randomRIO (1, 7))
  where
    size :: Int
    size = min army maxDices
