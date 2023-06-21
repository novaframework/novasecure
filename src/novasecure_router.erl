-module(novasecure_router).
-behaviour(nova_router).

-export([
         routes/1
        ]).

%% The Environment-variable is defined in your sys.config in {nova, [{environment, Value}]}
routes(_Environment) ->
  [#{prefix => "",
  security => false,
  routes => [
             {"/:provider", { novasecure_main_controller, get_provider}, #{methods => [get]}},
             {"/:provider/callback", { novasecure_main_controller, get_provider_callback}, #{methods => [get]}},
             {"/:provider/callback", { novasecure_main_controller, create_provider_callback}, #{methods => [post]}},
             {"/logout", { novasecure_main_controller, logout}, #{methods => [delete]}}
           ]
      }].
