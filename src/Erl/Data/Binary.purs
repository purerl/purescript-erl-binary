module Erl.Data.Binary (module T, byteSize) where

import Erl.Data.Binary.Type (Binary) as T
import Erl.Data.Binary.Type (Binary)

-- | Size in bytes of a binary
foreign import byteSize :: Binary-> Int
