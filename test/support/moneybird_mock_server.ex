require Logger

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

  get "/123/contacts" do
    contacts = fixture("contacts")
    case conn.query_params do
      %{"query" => name} ->
        success(conn, contacts
        |> Enum.filter(fn c -> String.downcase(c["lastname"]) == String.downcase(name) end))
      %{} -> success(conn, contacts)
    end
  end

  get "/123/contacts/264861044858423000" do
    success(conn, %Moneybirx.Contact{
      id: "264861044858423000",
      administration_id: 123,
      company_name: "Foobar Holding B.V.",
      firstname: "John",
      lastname: "Appleseed",
      address1: "Hoofdstraat 12",
      address2: "",
      zipcode: "1234 AB",
      city: "Amsterdam",
      country: "NL",
      phone: "",
      delivery_method: "Email",
      customer_id: "1",
      tax_number: "",
      chamber_of_commerce: "",
      bank_account: "",
      attention: "",
      email: "info@example.com",
      email_ubl: true,
      send_invoices_to_attention: "",
      send_invoices_to_email: "info@example.com",
      send_estimates_to_attention: "",
      send_estimates_to_email: "info@example.com",
      sepa_active: false,
      sepa_iban: "",
      sepa_iban_account_name: "",
      sepa_bic: "",
      sepa_mandate_id: "",
      sepa_mandate_date: nil,
      sepa_sequence_type: "RCUR",
      credit_card_number: "",
      credit_card_reference: "",
      credit_card_type: nil,
      tax_number_validated_at: nil,
      tax_number_valid: nil,
      invoice_workflow_id: nil,
      estimate_workflow_id: nil,
      si_identifier: "",
      si_identifier_type: nil,
      created_at: "2019-08-26T09:19:57.588Z",
      updated_at: "2019-08-26T09:19:57.588Z",
      version: 1566811197,
      sales_invoices_url: "http://moneybird.dev/123/sales_invoices/e0a3d1d96784a6fe490e29b24b3fc9f40f0a57bb3786912ac67d3b9983f3043b/all",
    })
  end

  get "/123/contacts/:missing" do
    not_found(conn)
  end

  post "/123/contacts" do
    case conn.params["contact"] do
      %{"company_name" => "Test B.V."} ->
        new_contact = fixture("new_contact")
        created(conn, new_contact)
      %{"invalid" => "params"} ->
        failure(conn)
      true -> failure(conn)
    end
  end

  def fixture(resource) do
    data = File.read!(Path.expand(__ENV__.file <> "/../fixtures/" <> resource <> ".json"))
    Poison.decode!(data)
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
