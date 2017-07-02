-module(erl_data_binary_uTF16@foreign).
-export([fromString/1, toString/1, toBinary/1]).

fromString(S) -> unicode:characters_to_binary(S, utf8, utf16).

toString(S) -> unicode:characters_to_binary(S, utf16, utf8).

toBinary(S) -> S.
