module Erl.Data.Binary.UTF32 where

import Erl.Data.Binary

foreign import data UTF32String :: Type

foreign import fromString :: String -> UTF32String

foreign import toString :: UTF32String -> String

foreign import toBinary :: UTF32String -> Binary
