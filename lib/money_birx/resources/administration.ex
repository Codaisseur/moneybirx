defmodule MoneyBirx.AdministrationBehaviour do
  @moduledoc false
  @callback default :: struct | nil
  @callback all :: {:error, HTTPoison.Error.t()} | {:ok, list(struct)}
end

defmodule MoneyBirx.Administration do
  @behaviour MoneyBirx.AdministrationBehaviour

  @moduledoc """
  # Moneybird Administrations

  The Moneybird Administration is the top level resource under which
  all the other data like contacts, invoices, etc. is found.

  ## Attributes

  Here is an example Administration.

      %Administration{
        id: 123,
        name: "Parkietje B.V.",
        language: "nl",
        currency: "EUR",
        country: "NL",
        time_zone: "Europe/Amsterdam"
      }

  See [Moneybird's API Documentation](https://developer.moneybird.com/api/administration/) for more info.

  ## Examples

  List all administrations the current user has access to.

      MoneyBirx.Administration.all()


  ## The Default Administration

  For convenience, we can also get the first Administration as a default.
  The idea behind this is that API keys are usually created for
  a single Administration only, so just returning the first one from
  the list seems like a good standard behaviour.

      MoneyBirx.Administration.default()

  """
  use MoneyBirx.Client

  alias __MODULE__

  defstruct [
    :id,
    :name,
    :language,
    :currency,
    :country,
    :time_zone
  ]

  @spec default :: %Administration{} | nil
  def default do
    {:ok, administrations} = all()
    List.first(administrations)
  end

  @doc """
  Lists all administrations the current user has access to.
  ```
  """
  @spec all :: {:error, HTTPoison.Error.t()} | {:ok, list(%Administration{})}
  def all do
    with {:ok, res} <- get("administrations") do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> as_struct(Administration)
  end
end
