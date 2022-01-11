{ name = "erl-binary-union"
, dependencies = [ "erl-lists", "maybe", "prelude", "tuples" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend = "purerl"
}
