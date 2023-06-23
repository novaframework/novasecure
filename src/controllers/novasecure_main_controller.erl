-module(novasecure_main_controller).
-export([
         get_provider/1,
         get_callback/1,
         post_callback/1,
         logout/1
        ]).

get_provider(#{bindings := #{<<"provider">> := Provider}}) ->
    provider_module(Provider),
    {status, 200}.

get_callback(#{bindings := #{<<"provider">> := Provider}} = Req) ->
    Module = provider_module(Provider),
    ok = Module:callback(Req),
    #{redirect_url := Redirect} = application:get_env(novasecure, binary_to_atom(Provider), undefined),
    {redirect, <<"/user">>}.

post_callback(_Req) ->
    {status, 201}.

logout(_Req) ->
    {status, 200}.


provider_module(Provider) ->
    binary_to_atom(<<"novasecure_", Provider/binary>>).
