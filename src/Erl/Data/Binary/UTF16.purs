module Erl.Data.Binary.UTF16 where

import Erl.Data.Binary

foreign import data UTF16String :: Type

foreign import fromString :: String -> UTF16String

foreign import toString :: UTF16String -> String

foreign import toBinary :: UTF16String -> Binary
