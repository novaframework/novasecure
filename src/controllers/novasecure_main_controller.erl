-module(novasecure_main_controller).
-export([
         get_provider/1,
         get_provider_callback/1,
         create_provider_callback/1,
         logout/1
        ]).

-include_lib("nova/include/nova.hrl").

get_provider(#{bindings := #{<<"provider">> := Provider}}) ->
    provider_module(Provider),
    {status, 200}.

get_provider_callback(_Req) ->
    {status, 200}.

create_provider_callback(_Req) ->
    {status, 201}.

logout(_Req) ->
    {status, 200}.


provider_module(Provider) ->
    binary_to_atom(<<"novasecure_", Provider/binary>>).
