-module(erl_data_bitstring@foreign).
-export([fromBinary/1, isBinary/1, toBinaryImpl/3, bitSize/1, byteSize/1]).

fromBinary(X) -> X.

isBinary(X) -> erlang:is_binary(X).

toBinaryImpl(_Nothing,Just,X) when erlang:is_binary(X) -> Just(X);
toBinaryImpl(Nothing,_Just,_) -> Nothing.

bitSize(X) -> erlang:bit_size(X).
byteSize(X) -> erlang:byte_size(X).