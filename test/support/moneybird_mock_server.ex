require Logger

defmodule Moneybird.MockServer do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["text/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  get "/administrations" do
    success(conn, [
      %{
        id: 123,
        name: "Parkietje B.V.",
        language: "nl",
        currency: "EUR",
        country: "NL",
        time_zone: "Europe/Amsterdam"
      }
    ])
  end

  get "/123/contacts" do
    case conn.query_params do
      %{"query" => "name"} ->
        success(conn, fixture("queried_contacts"))

      %{"query" => "appleseed"} ->
        success(conn, fixture("queried_contacts"))

      %{} ->
        success(conn, fixture("all_contacts"))
    end
  end

  get "/123/contacts/264861044858423000" do
    success(conn, fixture("one_contact"))
  end

  get "/123/contacts/:missing" do
    not_found(conn)
  end

  post "/123/contacts" do
    case conn.params["contact"] do
      %{"valid" => "params"} ->
        new_contact = fixture("new_contact")
        created(conn, new_contact)

      %{"company_name" => "Test B.V."} ->
        new_contact = fixture("new_contact")
        created(conn, new_contact)

      %{"invalid" => "params"} ->
        failure(conn)

      true ->
        failure(conn)
    end
  end

  get "/123/sales_invoices" do
    case conn.query_params do
      %{"filter" => "period:this_month"} ->
        success(conn, fixture("filtered_sales_invoices"))

      %{} ->
        sales_invoices = fixture("all_sales_invoices")
        success(conn, sales_invoices)
    end
  end

  get "/123/sales_invoices/264861201281844836" do
    sales_invoice = fixture("one_sales_invoice")
    success(conn, sales_invoice)
  end

  get "/123/sales_invoices/:missing" do
    not_found(conn)
  end

  post "/123/sales_invoices" do
    case conn.params["sales_invoice"] do
      %{"valid" => "params"} ->
        new_sales_invoice = fixture("new_sales_invoice")
        created(conn, new_sales_invoice)

      %{"invalid" => "params"} ->
        failure(conn)

      true ->
        new_sales_invoice = fixture("new_sales_invoice")
        created(conn, new_sales_invoice)
    end
  end

  patch "/123/sales_invoices/264861210015434486/send_invoice" do
    success(conn, fixture("sent_sales_invoice"))
  end

  get "/123/recurring_sales_invoices" do
    case conn.query_params do
      %{"filter" => "frequency:month"} ->
        success(conn, fixture("filtered_recurring_sales_invoices"))

      %{} ->
        recurring_sales_invoices = fixture("all_recurring_sales_invoices")
        success(conn, recurring_sales_invoices)
    end
  end

  get "/123/recurring_sales_invoices/264861180704589127" do
    recurring_sales_invoice = fixture("one_recurring_sales_invoice")
    success(conn, recurring_sales_invoice)
  end

  get "/123/recurring_sales_invoices/:missing" do
    not_found(conn)
  end

  post "/123/recurring_sales_invoices" do
    case conn.params["recurring_sales_invoice"] do
      %{"valid" => "params"} ->
        new_recurring_sales_invoice = fixture("new_recurring_sales_invoice")
        created(conn, new_recurring_sales_invoice)

      %{"invalid" => "params"} ->
        failure(conn)

      true ->
        new_recurring_sales_invoice = fixture("new_recurring_sales_invoice")
        created(conn, new_recurring_sales_invoice)
    end
  end

  def fixture(resource) do
    data = File.read!(Path.expand(__ENV__.file <> "/../fixtures/" <> resource <> ".json"))
    Poison.decode!(data)
  end

  defp success(conn, body) do
    conn
    |> Plug.Conn.send_resp(200, Poison.encode!(body))
  end

  defp created(conn, body) do
    conn
    |> Plug.Conn.send_resp(201, Poison.encode!(body))
  end

  defp not_found(conn) do
    conn
    |> Plug.Conn.send_resp(404, Poison.encode!(%{message: "not found"}))
  end

  defp failure(conn) do
    conn
    |> Plug.Conn.send_resp(422, Poison.encode!(%{message: "error message"}))
  end
end
