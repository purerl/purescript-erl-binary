-module(erl_data_binary@foreign).
-export([byteSize/1, part_/5]).

byteSize(X) -> erlang:byte_size(X).

part_(Left, Right, Start, Len, Binary) ->
    try
        Right(binary:part(Binary, Start, Len))
    catch
        _:_ ->
            Left
    end.
