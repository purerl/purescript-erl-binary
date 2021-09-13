module Erl.Data.Binary (module T, byteSize, part) where

import Data.Maybe (Maybe(..))
import Erl.Data.Binary.Type (Binary)
import Erl.Data.Binary.Type (Binary) as T

-- | Size in bytes of a binary
foreign import byteSize :: Binary -> Int

part :: Int -> Int -> Binary -> Maybe Binary
part = part_ Nothing Just

foreign import part_ :: Maybe Binary -> (Binary -> Maybe Binary) -> Int -> Int -> Binary -> Maybe Binary
