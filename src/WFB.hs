module WFB where

import Data.Time

type FieldName = String

type HTML = String
type Count = Int
type Percentage = Double

data Portion = Portion { porLable :: String, 
                 porPercent :: Percentage
               }
type BreakDown = [Portion]

data DOI = DOI { doiMonth :: Int
               , doiYear :: Int
               } deriving (Show, Eq)

doiFromString :: String -> DOI
doiFromString s = case md of
                       Nothing -> DOI 0 0
                       Just d -> let (y, m, _) = toGregorian d
                                 in DOI m (fromIntegral y)
    where md = parseTimeM True defaultTimeLocale "%B %Y" s :: Maybe Day


