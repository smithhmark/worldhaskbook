module Nav where
--module Abbreviations where

import qualified Data.Map as Map

twoLetterCodes = [
        ("Afghanistan", "AF"),
        ("Albania", "AL")
        ]

cc2Table = Map.fromList twoLetterCodes

findCC2 cname = Map.lookup cname cc2Table
