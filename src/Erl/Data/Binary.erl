-module(erl_data_binary@foreign).
-export([bin/1,stringFromBin/1]).

bin(S) -> list_to_binary(S).
stringFromBin(B) -> binary_to_list(B).
