module Erl.Data.Binary
  ( at
  , byteSize
  , copy
  , module T
  , part
  , split
  )
  where

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple)
import Erl.Data.Binary.Type (Binary)
import Erl.Data.Binary.Type (Binary, showAsErlang, showAsPurescript) as T

-- | Size in bytes of a binary
foreign import byteSize :: Binary -> Int

foreign import part_ :: Maybe Binary -> (Binary -> Maybe Binary) -> Int -> Int -> Binary -> Maybe Binary

-- | Extract part of binary.
-- |
-- | Start: zero-based offset into the binary
-- | Len: A negative length can be used to extract bytes at the end of a binary
-- | Binary: The binary to extract from
part :: Int -> Int -> Binary -> Maybe Binary
part = part_ Nothing Just

foreign import split :: Int -> Binary -> Tuple Binary Binary

foreign import at :: Binary -> Int -> Int

foreign import copy :: Binary -> Int -> Binary
