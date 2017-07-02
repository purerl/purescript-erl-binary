-module(erl_data_binary_uTF32@foreign).
-export([fromString/1, toString/1, toBinary/1]).

fromString(S) -> unicode:characters_to_binary(S, utf8, utf32).

toString(S) -> unicode:characters_to_binary(S, utf32, utf8).

toBinary(S) -> S.
