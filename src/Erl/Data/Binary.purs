module Erl.Data.Binary
  ( module T
  , byteSize
  , part
  -- , fromFoldable
  -- , listToBinary
  ) where

import Data.Maybe (Maybe)
import Erl.Data.Binary.Type (Binary)
import Erl.Data.Binary.Type (Binary, showAsErlang, showAsPurescript) as T

foreign import byteSize :: Binary -> Int
foreign import part :: Int -> Int -> Binary -> Maybe Binary

-- Can't have these here as they rely on Octet - which is in erl-kernel
-- foreign import listToBinary :: List Octet -> Binary
-- fromFoldable :: forall f. Foldable f => f Octet -> Binary
-- fromFoldable a =
--   let
--     asList = List.fromFoldable a
--   in
--     listToBinary asList
