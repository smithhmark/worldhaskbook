module NavSpec where

import Nav
import System.IO.Unsafe

import Test.Hspec (Spec, describe, context, it, shouldBe)

sampleHtml = "<html>\n\
        \<head></head>\n\
        \<body>\n\
        \<div>\n\
        \<form action=\"#\" method=\"GET\"> \n\
        \<select name=\"place_selector\" class=\"place_selector\" id='search-place'\n\
        \ onchange=\"document.location.href= this.value;\" \n\
        \ aria-label='Use this to select the country page to view'> \n\
        \ <option value=\"\">Please select a country to view</option> \n\
        \ <option value=\"../geos/xx.html\" data-place-code=\"xx\"> \n\
        \  World \n\
        \ </option> \n\
        \ <option value=\"../geos/af.html\" data-place-code=\"af\">\n Afghanistan </option> \n\
        \<option value=\"../geos/ax.html\" data-place-code=\"ax\"> Akrotiri \t\n</option>\n\
        \ </select>\n\
        \</form> </div> </body>\n</html>"

expectedMapping = [ 
  ("World", "xx"),
  ("Afghanistan", "af"),
  ("Akrotiri", "ax")
  ]


spec :: Spec
spec = do
  describe "Look up 2-letter codes" $ do
    it "Shows Afghanistan as AF" $ do
      Nav.findCC2 "Afghanistan" `shouldBe` Just "AF"
    it "Shows Albania as AL" $ do
      Nav.findCC2 "Albania" `shouldBe` Just "AL"
    it "Shows Unitied States as US" $ do
      Nav.findCC2 "United States" `shouldBe` Just "US"
  describe "build cc2 mapping" $ do 
    it "parses html for the codes in IO" $ do
      unsafePerformIO (Nav.parseCCMapping sampleHtml) `shouldBe` expectedMapping
    it "parses html for the codes pure" $ do
      Nav.parseCCMapping' sampleHtml `shouldBe` expectedMapping
