module Nav where
--module Abbreviations where

import qualified Data.Map as Map
import Text.XML.HXT.Core
import Text.HandsomeSoup
import Data.Char (isSpace, toUpper)
import qualified Locations as L

twoLetterCodes = map (\(n,l)-> (n, map toUpper l)) L.locations

type CountryName = String
type CC2 = String
type LocationCode = String

cc2Table :: Map.Map CountryName CC2
cc2Table = Map.fromList twoLetterCodes

findCC2 :: CountryName -> Maybe CC2
findCC2 cname = Map.lookup cname cc2Table


cleanCountryName :: CountryName -> CountryName
cleanCountryName = dropWhile isSpace . reverse . dropWhile isSpace . reverse

cleanCCMapping :: [(LocationCode, CountryName)] -> [(CountryName, LocationCode)]
cleanCCMapping = map (\(c, n) -> (cleanCountryName n, c)) . 
  filter (\(c, n) -> c /= "")

parseCCMapping :: String -> IO [(CountryName, LocationCode)]
parseCCMapping html = do
        let doc = parseHtml html
        codes <- runX $ doc >>> css "#search-place option" >>> 
          (getAttrValue "data-place-code" &&& deep getText)
        return $ cleanCCMapping codes

parseCCMapping' :: String -> [(CountryName, LocationCode)]
parseCCMapping' html = cleanCCMapping codes
  where codes = runLA (hread  >>> extractor) html
        extractor = css "#search-place option" >>> 
          (getAttrValue "data-place-code" &&& deep getText)
