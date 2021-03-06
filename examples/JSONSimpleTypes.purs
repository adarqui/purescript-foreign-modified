module Example.JSONSimpleTypes where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)
import Control.Monad.Except (runExcept)

import Data.Foreign (F, unsafeFromForeign)
import Data.Foreign.Class (readJSON, write)

-- Parsing of the simple JSON String, Number and Boolean types is provided
-- out of the box.
main :: Eff (console :: CONSOLE) Unit
main = do
  logShow $ runExcept $ readJSON "\"a JSON string\"" :: F String
  logShow $ runExcept $ readJSON "42" :: F Number
  logShow $ runExcept $ readJSON "true" :: F Boolean
  log $ unsafeFromForeign $ write "a JSON string"
  log $ unsafeFromForeign $ write 42.0
  log $ unsafeFromForeign $ write true
