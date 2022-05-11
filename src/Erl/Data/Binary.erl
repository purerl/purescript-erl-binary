-module(erl_data_binary@foreign).
-export([byteSize/1, part/3]).

-define(nothing, {nothing}).
-define(just(A), {just, A}).

byteSize(X) -> erlang:byte_size(X).

part(Start, Len, Binary) ->
    try
        ?just(binary:part(Binary, Start, Len))
    catch
        _:_ -> ?nothing
    end.
