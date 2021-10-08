-module(erl_data_binary_type@foreign).
-export([eq_/2
       , mempty_/0
       , append_/2
       , show_/1
      ]).

eq_(X,Y) -> X =:= Y.

mempty_() -> <<>>.

append_(<<>>, Bin2) -> Bin2;
append_(Bin1, <<>>) -> Bin1;
append_(Bin1, Bin2) -> << Bin1/binary, Bin2/binary >>.



show_(<<>>) -> <<"<<>>">>;
show_(Full) ->
    case os:getenv("BINARY_SHOW_STYLE") of
        "ERLANG" -> showErlang(Full);
        _ ->
            showDefault(Full)
    end.

showDefault(Full) ->
    Size = size(Full),
    Limit = case os:getenv("BINARY_SHOW_MAX_SIZE") of
                false ->
                    128;
                Val -> try
                           list_to_integer(Val)
                       catch _:_ -> 128
                       end
            end,
    if Size > Limit ->
            <<Bin:(Limit-1)/binary, Last:8, _/binary>> = Full,
            list_to_binary(io_lib:format("<<~s~s...(~p)>>", [[io_lib:format("~2.16.0B ",[X]) || <<X:8>> <= Bin ], io_lib:format("~2.16.0B",[Last]), Size]));
       true ->
            <<Bin:(Size-1)/binary, Last:8>> = Full,
            list_to_binary(io_lib:format("<<~s~s>>", [[io_lib:format("~2.16.0B ",[X]) || <<X:8>> <= Bin ], io_lib:format("~2.16.0B",[Last])]))
    end.

showErlang(Full) ->
    Size = size(Full),
    <<Bin:(Size-1)/binary, Last:8>> = Full,
    list_to_binary(io_lib:format("<<~s~s>>", [[io_lib:format("16#~2.16.0B,",[X]) || <<X:8>> <= Bin ], io_lib:format("16#~2.16.0B",[Last])])).
