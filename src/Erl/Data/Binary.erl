-module(erl_data_binary@foreign).
-export([bin/1,stringFromBin/1,eq_/2,toIolist/1,fromIolist/1,mempty_/0,append_/2]).

bin(S) -> list_to_binary(S).
stringFromBin(B) -> binary_to_list(B).

eq_(X,Y) -> X == Y.

toIolist(X) -> [X].
fromIolist(X) -> iolist_to_binary(X).

mempty_() -> [].
append_(X,Y) -> [X,Y].
