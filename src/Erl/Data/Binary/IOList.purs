module Erl.Data.Binary.IOList (IOList, concat) where

import Prelude

import Erl.Data.List (List)

foreign import data IOList :: Type

foreign import mempty_ :: IOList

instance applyIolist :: Monoid IOList where
  mempty = mempty_

foreign import append_ :: IOList -> IOList -> IOList

instance semigroupIolist :: Semigroup IOList where
  append = append_

-- | Concatenate a list of IOList to an IOList. This is a no-op O(1).
foreign import concat :: List IOList -> IOList
