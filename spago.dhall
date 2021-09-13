{ name = "erl-binary-union"
, dependencies = [ "erl-lists", "maybe", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend = "purerl"
}
