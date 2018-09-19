-module(erl_data_bitstring_type@foreign).
-export([eq_/2]).

eq_(X,Y) -> X =:= Y.
