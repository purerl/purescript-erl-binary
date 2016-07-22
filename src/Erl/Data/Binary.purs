module Erl.Data.Binary where

foreign import data Binary :: *

-- TODO this is terrible
foreign import bin :: String -> Binary

foreign import stringFromBin :: Binary -> String
