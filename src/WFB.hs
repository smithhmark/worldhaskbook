module WFB where

import Data.Time

type FieldName = String
type FieldGenerator a = HTML -> [(FieldName, Maybe a)]

type HTML = String
type Count = Int
type Percentage = Double

data Portion = Portion { porLable :: String, 
                 porPercent :: Percentage
               }
type BreakDown = [Portion]

data DOI = DOI { doiYear :: Int
               , doiMonth :: Int
               } deriving (Show, Eq, Ord)

doiFromString :: String -> DOI
doiFromString s = case md of
                       Nothing -> DOI 0 0
                       Just d -> doiFromDay d
    where md = parseTimeM True defaultTimeLocale "%B %Y" s :: Maybe Day

doiFromDay d = DOI (fromIntegral y) m
  where (y, m, _) = toGregorian d
