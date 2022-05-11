-module(erl_data_binary_type@foreign).
-export([eq_/2
        , compare_/5
        , mempty_/0
        , append_/2
        , show_/1
        , showAsErlang/2
        , showAsPurescript/2
      ]).

eq_(X,Y) -> X =:= Y.
compare_(LT, EQ, GT, X, Y) ->
  if
    X < Y -> LT;
    X > Y -> GT;
    true  -> EQ
  end.

mempty_() -> <<>>.

append_(<<>>, Bin2) -> Bin2;
append_(Bin1, <<>>) -> Bin1;
append_(Bin1, Bin2) -> << Bin1/binary, Bin2/binary >>.

show_(Full) ->
    Limit = case os:getenv("BINARY_SHOW_MAX_SIZE") of
                false ->
                    128;
                Val -> try
                           list_to_integer(Val)
                       catch _:_ -> 128
                       end
            end,

    case os:getenv("BINARY_SHOW_STYLE") of
         "ERLANG" -> showAsErlang(Limit, Full);
        _ ->
            showAsPurescript(Limit, Full)
    end.

showAsErlang(_Limit, <<>>) ->
    <<"<<>>">>;
showAsErlang(Limit, Full) ->
    Size = size(Full),
    if Size > Limit ->
            <<Bin:(Limit-1)/binary, Last:8, _/binary>> = Full,
            list_to_binary(io_lib:format("<<~s~s...(~p)>>", [[format_erlang(X)|| <<X:8>> <= Bin ], format_erlang_last(Last), Size]));
       true ->
            <<Bin:(Size-1)/binary, Last:8>> = Full,
            list_to_binary(io_lib:format("<<~s~s>>", [[format_erlang(X) || <<X:8>> <= Bin ], format_erlang_last(Last)]))
    end.

showAsPurescript(_Limit, <<>>) ->
    "fromFoldable []";
showAsPurescript(Limit, Full) ->
    Size = size(Full),
    if Size > Limit ->
            <<Bin:(Limit-1)/binary, Last:8, _/binary>> = Full,
            list_to_binary(io_lib:format("fromFoldable [~s~s...(~p)]", [[format_ps(X)|| <<X:8>> <= Bin ], format_ps_last(Last), Size]));
       true ->
            <<Bin:(Size-1)/binary, Last:8>> = Full,
            list_to_binary(io_lib:format("fromFoldable [~s~s]", [[format_ps(X) || <<X:8>> <= Bin ], format_ps_last(Last)]))
    end.

format_erlang(X) ->
    io_lib:format("16#~2.16.0B, ",[X]).
format_erlang_last(X) ->
    io_lib:format("16#~2.16.0B",[X]).

format_ps(X) ->
    io_lib:format("0x~2.16.0B, ",[X]).
format_ps_last(X) ->
    io_lib:format("0x~2.16.0B",[X]).
