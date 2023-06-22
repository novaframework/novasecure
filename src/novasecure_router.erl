-module(novasecure_router).
-behaviour(nova_router).

-export([
         routes/1
        ]).

%% The Environment-variable is defined in your sys.config in {nova, [{environment, Value}]}
routes(_Environment) ->
  [#{prefix => "",
  security => false,
  plugins => [{pre_request, nova_request_plugin, #{decode_json_body => true,
                                                   parse_qs => true
                                                  }}],
  routes => [
             {"/:provider", { novasecure_main_controller, get_provider}, #{methods => [get]}},
             {"/:provider/callback", { novasecure_main_controller, get_callback}, #{methods => [get]}},
             {"/:provider/callback", { novasecure_main_controller, post_callback}, #{methods => [post]}},
             {"/logout", { novasecure_main_controller, logout}, #{methods => [delete]}}
           ]
      }].
