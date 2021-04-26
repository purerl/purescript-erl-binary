-module(erl_data_binary_iOData@foreign).
-export([mempty_/0, append_/2, concat/1, fromIOList/1, fromBinary/1, toBinary/1, byteSize/1]).

mempty_() -> [].
append_(X,Y) -> [X,Y].
concat(Xs) -> Xs.

fromIOList(X) -> X.
fromBinary(X) -> X.

toBinary(X) -> erlang:iolist_to_binary(X).

byteSize(X) -> iolist_size(X).
