-- | Representation of Erlang iodata(). Some duplication of functions from IOList to avoid unnecessary conversions in common cases.
module Erl.Data.Binary.IOData where

import Prelude

import Erl.Data.Binary.IOList (IOList)
import Erl.Data.Binary.Type (Binary)
import Erl.Data.List (List)

foreign import data IOData :: Type

foreign import mempty_ :: IOData

instance applyIoData :: Monoid IOData where
  mempty = mempty_

foreign import append_ :: IOData -> IOData -> IOData

instance semigroupIoData :: Semigroup IOData where
  append = append_

-- | Coerce an IOList to IOData (no-op)
foreign import fromIOList :: IOList -> IOData

-- | Coerce a Binary to IOData (no-op)
foreign import fromBinary :: Binary -> IOData

-- | Collapse an iodata to binary
foreign import toBinary :: IOData -> Binary

-- | Concatenate a list of IOData to an IOData. This is a no-op O(1).
foreign import concat :: List IOData -> IOData

-- | Calls iolist_size
foreign import byteSize :: IOData -> Int
