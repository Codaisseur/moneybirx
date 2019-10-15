defmodule Moneybirx.Administration do
  @moduledoc """
  # Moneybird Administrations

  The Moneybird Administration is the top level resource under which
  all the other data like contacts, invoices, etc. is found.

  See [Moneybird's API Documentation](https://developer.moneybird.com/api/administration/) for more info.

  ## Examples

  List all administrations the current user has access to.

      iex> Moneybirx.Administration.all()
      {:ok, [%Moneybirx.Administration{
        id: 123,
        name: "Parkietje B.V.",
        language: "nl",
        currency: "EUR",
        country: "NL",
        time_zone: "Europe/Amsterdam"
      }]}


  ## The Default Administration

  For convenience, we can also get the first Administration as a default.
  The idea behind this is that API keys are usually created for
  a single Administration only, so just returning the first one from
  the list seems like a good standard behaviour.

      iex> Moneybirx.Administration.default()
      {:ok, %Moneybirx.Administration{
        id: 123,
        name: "Parkietje B.V.",
        language: "nl",
        currency: "EUR",
        country: "NL",
        time_zone: "Europe/Amsterdam"
      }}

  """
  use Moneybirx.Client

  alias __MODULE__

  defstruct [
    :id,
    :name,
    :language,
    :currency,
    :country,
    :time_zone
  ]

  @doc """
  Returns the first (default) administration the user has access to.

  ## Examples

      iex> Moneybirx.Administration.default()
      {:ok, %Moneybirx.Administration{
        id: 123,
        name: "Parkietje B.V.",
        language: "nl",
        currency: "EUR",
        country: "NL",
        time_zone: "Europe/Amsterdam"
      }}
  """
  @spec default :: {:ok, %Administration{}} | {:error, HTTPoison.Error.t()}
  def default do
    with {:ok, administrations} <- all() do
      if is_list(administrations) do
        {:ok, List.first(administrations)}
      else
        {:ok, administrations}
      end
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Lists all administrations the current user has access to.

  ## Examples

      iex> Moneybirx.Administration.all()
      {:ok, [%Moneybirx.Administration{
        id: 123,
        name: "Parkietje B.V.",
        language: "nl",
        currency: "EUR",
        country: "NL",
        time_zone: "Europe/Amsterdam"
      }]}
  """
  @spec all ::
          {:error, HTTPoison.Error.t()}
          | {:ok, list(%Administration{})}
          | {:ok, %Administration{}}
  def all do
    with {:ok, res} <- get("/administrations") do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> as_struct(Administration)
  end
end
