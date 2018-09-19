module Erl.Data.Bitstring (module T, isBinary, fromBinary, toBinary, bitSize, byteSize) where

import Data.Maybe (Maybe(..))
import Erl.Data.Binary (Binary)
import Erl.Data.Bitstring.Type (Bitstring)
import Erl.Data.Bitstring.Type (Bitstring) as T

-- | If this bitstring is in fact a binary, coerce it
foreign import toBinaryImpl :: Maybe Binary -> (Binary -> Maybe Binary) -> Bitstring -> Maybe Binary

toBinary :: Bitstring -> Maybe Binary
toBinary = toBinaryImpl Nothing Just

foreign import isBinary :: Bitstring -> Boolean

-- | Witness that every binary is a bitstring
foreign import fromBinary :: Binary -> Bitstring

-- | Size in bits of a bit string
foreign import bitSize :: Bitstring -> Int

-- | Size in bytes of a bit string (rounded up)
foreign import byteSize :: Bitstring -> Int
