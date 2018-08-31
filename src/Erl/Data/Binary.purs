module Erl.Data.Binary (Binary, toIolist, fromIolist) where

import Prelude
import Erl.Data.Binary.IOList (IOList)

foreign import data Binary :: Type

foreign import toIolist :: Binary -> IOList

foreign import fromIolist :: IOList -> Binary

foreign import eq_ :: Binary -> Binary -> Boolean

instance binaryEq :: Eq Binary where
  eq = eq_
