-module(erl_data_binary@foreign).
-export([byteSize/1]).

byteSize(X) -> erlang:byte_size(X).