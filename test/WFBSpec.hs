module WFBSpec where

import WFB

import Test.Hspec (Spec, describe, context, it, shouldBe)


spec :: Spec
spec = do
  describe "WFB" $ do
    it "parses DOI's with no whitespace" $ do
            (doiFromString "July 1990") `shouldBe` DOI 7 1990
    it "parses DOI's with whitespace" $ do
            (doiFromString "  July 1990 ") `shouldBe` DOI 7 1990
