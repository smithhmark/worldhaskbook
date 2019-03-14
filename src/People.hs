module People
where

import Text.XML.HXT.Core
import Text.HandsomeSoup

import WFB

import Data.Char (isDigit)

fields = [popGen]

parsePopulation :: HTML -> Maybe Count
parsePopulation countryHtml = undefined

popGen :: FieldGenerator Count
popGen h = [("Population", pop)]
  where pStr = runLA (hread >>> extractor) h
        extractor = css "#field-population .subfield-number" >>> deep getText
        pop = case pStr of 
                   [] -> Nothing
                   [""] -> Nothing
                   [p] -> Just . read $ filter isDigit p

