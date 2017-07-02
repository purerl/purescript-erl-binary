module Erl.Data.Binary.UTF8 where

import Erl.Data.Binary

type UTF8String = String

foreign import toBinary :: UTF8String -> Binary
