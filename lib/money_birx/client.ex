defmodule MoneyBirx.Client do
  @moduledoc false
  defmacro __using__(_) do
    quote do
      use HTTPoison.Base

      @content_type "application/json"
      @version "v2"

      def endpoint, do: Application.get_env(:money_birx, :endpoint, "https://moneybird.com/api/v2")

      def process_request_url(path) do
        endpoint() <> path
      end

      def process_request_headers(headers) when is_map(headers) do
        Enum.into(headers, [])
        |> Keyword.merge(http_headers())
      end

      def process_request_headers(headers) do
        Keyword.merge(headers, http_headers())
      end

      def as_struct(data, type) when is_list(data) do
        Enum.map(data, fn(d) ->
          as_struct(d, type)
        end)
      end

      def as_struct(data, type) do
        struct(type, Enum.map(data, fn({k, v}) ->
          {String.to_atom(k), v}
        end))
      end

      defp handle_response(resp) do
        case resp do
          {:ok, %{body: body, status_code: 200}} ->
            {:ok, body}
          {:ok, %{body: body, status_code: 201}} ->
            {:ok, body}
          {:ok, %{body: body, status_code: 204}} ->
            {:ok, body}
          {:ok, %{body: body, status_code: 301}} ->
              {:ok, body}
          {:ok, %{body: body, status_code: 404}} ->
            {:error, create_friendly_error(body)}
          {:ok, %{body: body, status_code: 422}} ->
            {:error, create_friendly_error(body)}
          {:ok, %{body: body, status_code: status}} ->
            moneybird_error(status, body["message"])
          {:error, error} ->
            moneybird_error(error.id, error.reason)
        end
      end

      defp http_headers do
        token = Application.get_env(:money_birx, :token)

        [
          "Accept": @content_type,
          "Authorization": "Bearer #{token}",
          "Content-Type": @content_type,
        ]
      end

      def create_friendly_error(body) do
        # TODO: do some stuff
      end

      defp moneybird_error(status, message) do
        # TODO: do some stuff
      end
    end
  end
end
