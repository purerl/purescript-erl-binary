module Erl.Data.Binary.UTF32 where

foreign import data UTF32String :: *

foreign import fromString :: String -> UTF32String

foreign import toString :: UTF32String -> String

foreign import toBinary :: UTF32String -> Binary
