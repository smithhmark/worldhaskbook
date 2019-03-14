module PeopleSpec where

import Test.Hspec (Spec, describe, context, it, shouldBe, shouldSatisfy)

import People

spec :: Spec
spec = do
  describe "People" $ do
          it "contains a list of extractable fields" $ do
                  length fields `shouldSatisfy` (> 0)

