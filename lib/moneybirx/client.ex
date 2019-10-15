defmodule Moneybirx.Client do
  @moduledoc false
  defmacro __using__(_) do
    quote do
      use HTTPoison.Base

      @content_type "application/json"
      @version "v2"

      def endpoint, do: Application.get_env(:moneybirx, :endpoint, "https://moneybird.com/api/v2")

      def process_url(path) do
        if path == "/administrations" do
          endpoint() <> path
        else
          {:ok, administration} = Moneybirx.Administration.default()
          endpoint() <> "/" <> "#{administration.id}" <> path
        end
      end

      def process_request_headers(headers) when is_map(headers) do
        Enum.into(headers, [])
        |> Keyword.merge(http_headers())
      end

      def process_request_headers(headers) do
        Keyword.merge(headers, http_headers())
      end

      def process_request_body(body) do
        Poison.encode!(body)
      end

      def as_struct(data, _) when is_nil(data), do: nil

      def as_struct(data, type) when is_list(data) do
        Enum.map(data, fn d ->
          as_struct(d, type)
        end)
      end

      def as_struct(data, type) do
        struct(
          type,
          Enum.map(data, fn {k, v} ->
            {String.to_atom(k), v}
          end)
        )
      end

      def process_response(resp) do
        case resp do
          %{status_code: 200} ->
            resp

          %{status_code: 201} ->
            resp

          %{status_code: 204} ->
            resp

          %{status_code: 301} ->
            resp

          %{status_code: 404} ->
            raise Moneybirx.NotFoundError

          %{body: body, status_code: 422} ->
            raise Moneybirx.RequestError, Poison.decode!(body)

          resp ->
            raise Moneybirx.ServerError
        end
      end

      defp http_headers do
        token = Application.get_env(:moneybirx, :token)

        [
          Accept: @content_type,
          Authorization: "Bearer #{token}",
          "Content-Type": @content_type
        ]
      end

      def create_friendly_error(body) do
        Poison.decode!(body)
      end

      defp moneybird_error(status, message) do
        # TODO: do some stuff
      end
    end
  end
end

defmodule Moneybirx.NotFoundError do
  defexception message: "Moneybird resource not found"
end

defmodule Moneybirx.RequestError do
  defexception message: "Moneybird request error"
end

defmodule Moneybirx.ServerError do
  defexception message: "Moneybird server error"
end
