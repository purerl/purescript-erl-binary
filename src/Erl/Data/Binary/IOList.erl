-module(erl_data_binary_iOList@foreign).
-export([mempty_/0, append_/2, concat/1, toBinary/1, fromBinary/1, byteSize/1]).

mempty_() -> [].
append_(X,Y) -> [X,Y].
concat(Xs) -> Xs.

fromBinary(X) -> [X].
toBinary(X) -> erlang:iolist_to_binary(X).

byteSize(X) -> iolist_size(X).
