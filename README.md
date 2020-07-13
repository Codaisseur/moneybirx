# Moneybirx

[![Coverage Status](https://coveralls.io/repos/github/Codaisseur/moneybirx/badge.svg?branch=refs/heads/master)](https://coveralls.io/github/Codaisseur/moneybirx?branch=refs/heads/master) [![Test Status](https://github.com/Codaisseur/moneybirx/workflows/Run%20Tests/badge.svg)](https://github.com/Codaisseur/moneybirx)

This is an unofficial [Moneybird API](https://developer.moneybird.com/) client. It uses HTTPoison for requests and Poison for dealing with JSON payloads.

## Installation

The package can be installed by adding `moneybirx` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:moneybirx, "~> 0.1.6"}
  ]
end
```

## Configuration

First go to https://moneybird.com/user/applications/new and create an API token for **Personal Use**. Then configure Moneybirx to use your token:

```elixir
# config/config.exs

config :moneybirx,
  endpoint: "https://moneybird.com/api/v2",
  token: "your-api-token"
```

## Documentation

The [documentation](https://hexdocs.pm/moneybirx) for this package can be found on HexDocs. If you want to know more about the Moneybird API itself, read it's [official documentation](https://developer.moneybird.com/).

Documentation is generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). The docs can
be found at [https://hexdocs.pm/moneybirx](https://hexdocs.pm/moneybirx).
