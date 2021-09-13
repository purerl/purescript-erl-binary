-module(erl_data_binary@foreign).
-export([byteSize/1, part_/5]).

byteSize(X) -> erlang:byte_size(X).

part_(Nothing, Just, Start, Len, Binary) ->
    try
        Just(binary:part(Binary, Start, Len))
    catch
        _:_ -> Nothing
    end.
