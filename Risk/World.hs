module Risk.World where

import Risk.Types

data Region = Region
    { continentName    :: String
    , continentWeight  :: Int
    , continentRegions :: [RegionName]
    , continentInter   :: [InterRegion]
    }

type InterRegion = (RegionName, RegionName)

allRegions :: [Region]
allRegions = [ northAmerica, southAmerica,  europe, africa, asia, australia ]

allInters :: [InterRegion]
allInters = concat (map continentInter allRegions ++ [interContinents])

northAmerica, southAmerica, europe, africa, asia, australia :: Region

northAmerica = Region "North America" 5
    [ "Alaska"
    , "Alberta"
    , "Central America"
    , "Eastern United States"
    , "Greenland"
    , "Northwest Territory"
    , "Ontario"
    , "Quebec"
    , "Western United States"
    ]
    [ ("Alaska","Northwest Territory")
    , ("Alaska","Alberta")
    , ("Alberta","Northwest Territory")
    , ("Alberta","Western United State")
    , ("Alberta","Ontario")
    , ("Central America","Eastern United States")
    , ("Central America","Western United State")
    , ("Eastern United States","Ontario")
    , ("Eastern United States","Quebec")
    , ("Eastern United States","Western United State")
    , ("Greenland","Northwest Territory")
    , ("Greenland","Ontario")
    , ("Greenland","Quebec")
    , ("Northwest Territory","Ontario")
    , ("Ontario","Quebec")
    , ("Ontario","Western United State")
    ]


southAmerica = Region "South America" 2
    [ "Argentina"
    , "Brazil"
    , "Peru"
    , "Venezuela"
    ]
    [ ("Argentina","Brazil")
    , ("Argentina","Peru")
    , ("Brazil","Peru")
    , ("Brazil","Venezuala")
    ]


europe = Region "Europe" 5
    [ "Great Britain"
    , "Iceland"
    , "Northern Europe"
    , "Scandinavia"
    , "Southern Europe"
    , "Ukraine"
    , "Western Europe"
    ]
    [ ("Great Britain","Iceland")
    , ("Great Britain","Northern Europe")
    , ("Great Britain","Scandinavia")
    , ("Iceland","Scandinavia")
    , ("Northern Europe","Scandinavia")
    , ("Northern Europe","Southern Europe")
    , ("Northern Europe","Ukraine")
    , ("Northern Europe","Western Europe")
    , ("Scandinavia","Ukraine")
    , ("Southern Europe","Ukraine")
    , ("Southern Europe","Western Europe")
    ]

africa = Region "Africa" 3
    [ "Congo"
    , "East Africa"
    , "Egypt"
    , "Madagascar"
    , "North Africa"
    , "South Africa"
    ]
    [ ("Congo","East Africa")
    , ("Congo","North Africa")
    , ("East Africa","Egypt")
    , ("East Africa","Madagascar")
    , ("Egypt","North Africa")
    , ("Madagascar","South Africa")
    ]

asia = Region "Asia" 7
    [ "Afghanistan"
    , "China"
    , "India"
    , "Irkutsk"
    , "Japan"
    , "Kamchatka"
    , "Middle East"
    , "Mongolia"
    , "Siam"
    , "Siberia"
    , "Ural"
    , "Yakutsk"
    ]
    [ ("Afghanistan","China")
    , ("Afghanistan","India")
    , ("Afghanistan","Middle East")
    , ("Afghanistan","Ural")
    , ("China","India")
    , ("China","Mongolia")
    , ("China","Siam")
    , ("China","Siberia")
    , ("China","Ural")
    , ("India","Middle East")
    , ("India","Siam")
    , ("Irkutsk","Kamchatka")
    , ("Irkutsk","Mongolia")
    , ("Irkutsk","Siberia")
    , ("Irkutsk","Yakutsk")
    , ("Japan","Kamchatka")
    , ("Japan","Mongolia")
    , ("Kamchatka","Mongolia")
    , ("Kamchatka","Yakutsk")
    , ("Mongolia","Siberia")
    , ("Siberia","Ural")
    , ("Siberia","Yakutsk")
    ]

australia = Region "Australia" (2)
    [ "Eastern Australia"
    , "Indonesia"
    , "New Guinea"
    , "Western Australia"
    ]
    [ ("Eastern Australia","New Guinea")
    , ("Eastern Australia","Western Australia")
    , ("Indonesia","New Guinea")
    , ("Indonesia","Western Australia")
    , ("New Guinea","Western Australia")
    ]

interContinents :: [InterRegion]
interContinents =
    [ ("Greenland","Iceland")
    , ("Brazil","North Africa")

    , ("Western Europe","North Africa")
    , ("Southern Europe","Egypt")
    , ("Southern Europe","Egypt")
    , ("Southern Europe","Middle East")
    , ("Ukraine","Middle East")
    , ("Ukraine","Ural")
    , ("Ukraine","Afghanistan")

    , ("Egypt","Middle East")
    , ("East Africa","Middle East")

    , ("Kamchatka","Alaska")
    , ("Siam","Indonesia")
    ]
