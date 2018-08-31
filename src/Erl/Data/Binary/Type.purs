module Erl.Data.Binary.Type (Binary) where

import Prelude

foreign import data Binary :: Type

foreign import eq_ :: Binary -> Binary -> Boolean

instance binaryEq :: Eq Binary where
  eq = eq_
