module WFBSpec where

import WFB

import Test.Hspec (Spec, describe, context, it, shouldBe)


spec :: Spec
spec = do
  describe "WFB.doiFromString" $ do
    it "parses DOI's with no whitespace" $ do
            (doiFromString "July 1990") `shouldBe` DOI 1990 7
    it "parses DOI's with whitespace" $ do
            (doiFromString "  July 1990 ") `shouldBe` DOI 1990 7
