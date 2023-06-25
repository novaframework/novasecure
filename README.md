# novasecure

Novasecure is a Nova app that will provide callback url for different auth providers. This library is based on (Ueberauth)[https://github.com/ueberauth/ueberauth] that have does this for Phoenix and Elixir.

This app is a generic layer that will depend on other repos depending on what provider you want to use for your site.

## Providers

### Dependencies

To start using this in your Nova app you will need to add Novasecure to your `rebar.config`:

```
{deps, [
        nova,
        {flatlog, "0.1.2"},
        {novasecure, ".*", {git, "https://github.com/novaframework/novasecure.git", {branch, "main"}}},
        {novasecure_github, ".*", {git, "https://github.com/novaframework/novasecure_github.git", {branch, "main"}}}
       ]}.
```

This configuration have also added the github provider that will handle the logic for how to authenticate using an github account.

### Configuration

In your `sys.config` you will need to configure for different providers:

```
{novasecure, [{github, #{client_id => CLIENTID,
                         client_secret => CLIENTSECRET,
                         redirect_url => <<"/user">>}}]}
```

