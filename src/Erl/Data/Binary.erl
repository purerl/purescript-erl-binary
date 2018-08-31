-module(erl_data_binary@foreign).
-export([eq_/2,toIolist/1,fromIolist/1]).

eq_(X,Y) -> X == Y.

toIolist(X) -> X.
fromIolist(X) -> iolist_to_binary(X).
