module Risk.World where

data Region = Region
    { continentName    :: String
    , continentWeight  :: Int
    , continentRegions :: [String]
    }

allRegions = [ northAmerica, southAmerica,  europe, africa, asia, australia ]

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

southAmerica = Region "South America" 2
    [ "Argentina"
    , "Brazil"
    , "Peru"
    , "Venezuela"
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

africa = Region "Africa" 3
    [ "Congo"
    , "East Africa"
    , "Egypt"
    , "Madagascar"
    , "North Africa"
    , "South Africa"
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

australia = Region "Australia" (2)
    [ "Eastern Australia"
    , "Indonesia"
    , "New Guinea"
    , "Western Australia"
    ]
