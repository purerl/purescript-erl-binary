module Erl.Data.Bitstring.Type (Bitstring) where

import Prelude

foreign import data Bitstring :: Type

foreign import eq_ :: Bitstring -> Bitstring -> Boolean

instance bitstringEq :: Eq Bitstring where
  eq = eq_
