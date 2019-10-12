defmodule Moneybird.MockServer do
  use Plug.Router

   plug Plug.Parsers, parsers: [:json],
                    pass:  ["text/*"],
                    json_decoder: Poison

  plug :match
  plug :dispatch

  get "/administrations" do
    success(conn, [%{
      id: 123,
      name: "Parkietje B.V.",
      language: "nl",
      currency: "EUR",
      country: "NL",
      time_zone: "Europe/Amsterdam"
    }])
  end

  # post "/administrations" do
  #   case conn.params do
  #     %{"name" =>"success-repo"} ->
  #       success(conn, %{"id" => 1234, "name" => "success-repo"})
  #     %{"name" =>"failure-repo"} ->
  #       failure(conn)
  #   end
  # end

  defp success(conn, body) do
    conn
    |> Plug.Conn.send_resp(200, Poison.encode!(body))
  end

  # defp failure(conn) do
  #   conn
  #   |> Plug.Conn.send_resp(422, Poison.encode!(%{message: "error message"}))
  # end
end
