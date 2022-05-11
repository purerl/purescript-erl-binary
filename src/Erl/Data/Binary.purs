module Erl.Data.Binary
  ( module T
  , byteSize
  , part
  ) where

import Data.Maybe (Maybe)
import Erl.Data.Binary.Type (Binary)
import Erl.Data.Binary.Type (Binary, showAsErlang, showAsPurescript) as T

-- | Size in bytes of a binary
foreign import byteSize :: Binary -> Int

-- | Extract part of binary.
-- |
-- | Start: zero-based offset into the binary
-- | Len: A negative length can be used to extract bytes at the end of a binary
-- | Binary: The binary to extract from
foreign import part :: Int -> Int -> Binary -> Maybe Binary
