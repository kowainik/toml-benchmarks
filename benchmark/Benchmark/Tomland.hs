module Benchmark.Tomland
       ( decode
       , parse
       , convert
       ) where

import Data.Text (Text)

import Benchmark.Type (FruitInside (..), HaskellType (..), SizeInside (..))
import Toml (TOML, TomlCodec, TomlDecodeError, parse, (.=))
import Validation (Validation)

import qualified Toml


decode :: Text -> Validation [TomlDecodeError] HaskellType
decode = Toml.decodeValidation codec

convert :: TOML -> Validation [TomlDecodeError] HaskellType
convert = Toml.runTomlCodec codec

-- | Codec to use in tomland decode and convert functions.
codec :: TomlCodec HaskellType
codec = HaskellType
    <$> Toml.text "title" .= htTitle
    <*> Toml.double "atom" .= htAtom
    <*> Toml.bool "cash" .= htCash
    <*> Toml.arrayOf Toml._Text "words" .= htWords
    <*> Toml.arrayOf Toml._Bool "bool" .= htBool
    <*> Toml.zonedTime "today" .= htToday
    <*> Toml.arrayOf Toml._Integer "ints" .= htInteger
    <*> Toml.table insideF "fruit" .= htFruit
    <*> Toml.table insideS "size" .= htSize

insideF :: TomlCodec FruitInside
insideF = FruitInside
    <$> Toml.text "name" .= fiName
    <*> Toml.text "description" .= fiDescription

insideS :: TomlCodec SizeInside
insideS = Toml.diwrap $ Toml.arrayOf (Toml._Array Toml._Double) "dimensions"
