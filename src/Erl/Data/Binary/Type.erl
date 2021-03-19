-module(erl_data_binary_type@foreign).
-export([eq_/2
       , mempty_/0
       , append_/2
      ]).

eq_(X,Y) -> X =:= Y.

mempty_() -> <<>>.

append_(<<>>, Bin2) -> Bin2;
append_(Bin1, <<>>) -> Bin1;
append_(Bin1, Bin2) -> << Bin1/binary, Bin2/binary >>.
