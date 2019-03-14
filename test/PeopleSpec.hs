module PeopleSpec where

import Test.Hspec (Spec, describe, context, it, shouldBe, shouldSatisfy)

import People

testFilePath = "test/testdata/af.html"
spec :: Spec
spec = do
  describe "People" $ do
          it "contains a list of extractable fields" $ do
                  length fields `shouldSatisfy` (> 0)
          it "can parse a populaion from an country entry" $ do
                  contents <- readFile testFilePath
                  let fieldData = popGen contents
                  length (fieldData) `shouldSatisfy` (== 1)
                  (snd . head) fieldData `shouldBe` Just 34940837

