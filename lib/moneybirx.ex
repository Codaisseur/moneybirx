defmodule Moneybirx do
  @moduledoc """
  This is an unofficial [Moneybird API](https://developer.moneybird.com/) client. It uses HTTPoison for requests and Poison for dealing with JSON payloads.

  ## Installation

  The package can be installed by adding `moneybirx` to your list of dependencies in `mix.exs`:

      def deps do
        [
          {:moneybirx, "~> 0.1.1"}
        ]
      end

  ## Configuration

  First go to https://moneybird.com/user/applications/new and create an API token for **Personal Use**. Then configure Moneybirx to use your token:

      # config/config.exs

      config :moneybirx,
        endpoint: "https://moneybird.com/api/v2",
        token: "your-api-token"

  """
end
