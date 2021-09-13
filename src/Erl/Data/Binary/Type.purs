module Erl.Data.Binary.Type
  ( Binary
  , showAsErlang
  , showAsPurescript
  ) where

import Prelude

foreign import data Binary :: Type

foreign import eq_ :: Binary -> Binary -> Boolean
foreign import mempty_ :: Binary
foreign import append_ :: Binary -> Binary -> Binary
foreign import show_ :: Binary -> String

instance Show Binary where
  show = show_

instance binaryEq :: Eq Binary where
  eq = eq_

instance monoidBinary :: Monoid Binary where
  mempty = mempty_

instance semigroupBinary :: Semigroup Binary where
  append = append_

foreign import showAsErlang :: Int -> Binary -> String
foreign import showAsPurescript :: Int -> Binary -> String
