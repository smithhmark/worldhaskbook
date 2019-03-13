module NavSpec where

import Nav

import Test.Hspec (Spec, describe, context, it, shouldBe)


spec :: Spec
spec =
        describe "Look up 2-letter codes" $ do 
                it "Shows Afghanistan as AF" $ do
                        Nav.findCC2 "Afghanistan" `shouldBe` Just "AF"
                it "Shows Albania as AL" $ do
                        Nav.findCC2 "Albania" `shouldBe` Just "AL"
                it "Shows Unitied States as US" $ do
                        Nav.findCC2 "United States" `shouldBe` Just "US"
