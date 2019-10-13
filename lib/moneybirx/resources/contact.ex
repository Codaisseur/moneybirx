defmodule Moneybirx.Contact do
  @moduledoc """
  # Moneybird Contacts

  ## Attributes

  Here is an example Contact.

      %Contact{
        id: "264861044949649118",
        administration_id: 123,
        company_name: "Foobar Holding B.V.",
        firstname: "",
        lastname: "",
        address1: "Hoofdstraat 12",
        address2: "",
        zipcode: "1234AB",
        city: "Amsterdam",
        country: "NL",
        phone: "",
        delivery_method: "Email",
        customer_id: "3",
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
        sepa_mandate_date: null,
        sepa_sequence_type: "RCUR",
        credit_card_number: "",
        credit_card_reference: "",
        credit_card_type: null,
        tax_number_validated_at: null,
        tax_number_valid: null,
        invoice_workflow_id: null,
        estimate_workflow_id: null,
        si_identifier: "",
        si_identifier_type: null,
        created_at: "2019-08-26T09:19:57.675Z",
        updated_at: "2019-08-26T09:19:57.675Z",
        version: 1566811197,
        sales_invoices_url: "http://moneybird.dev/123/sales_invoices/682edb346851c5a612c6292e8415174369af854274bae742cdfcc649da2b6914/all",
        notes: [

        ],
        custom_fields: [

        ],
        events: [
          {
            administration_id: 123,
            user_id: 15668111646740,
            action: "contact_created",
            link_entity_id: null,
            link_entity_type: null,
            data: {
            },
            created_at: "2019-08-26T09:19:57.688Z",
            updated_at: "2019-08-26T09:19:57.688Z"
          }
        ]
      }

  See [Moneybird's API Documentation](https://developer.moneybird.com/api/contacts) for more info.

  ## Examples

  A paginated list of contacts in the administration.

      Moneybirx.Contact.all()

  Searching for contacts can be done by providing the query parameter with search terms. The API searches for matches in the following contact fields:

  * `company_name`
  * `attention`
  * `firstname`
  * `lastname`
  * `address1`
  * `address2`
  * `zipcode`
  * `city`
  * `country`
  * `email`
  * `phone`
  * `customer_id`
  * `tax_number`
  * `chamber_of_commerce`
  * `bank_account`

      Moneybirx.Contact.all(%{query: "Codaisseur"})

  """
  use Moneybirx.Client

  alias __MODULE__

  defstruct [
    :id,
    :administration_id,
    :company_name,
    :firstname,
    :lastname,
    :address1,
    :address2,
    :zipcode,
    :city,
    :country,
    :phone,
    :delivery_method,
    :customer_id,
    :tax_number,
    :chamber_of_commerce,
    :bank_account,
    :attention,
    :email,
    :email_ubl,
    :send_invoices_to_attention,
    :send_invoices_to_email,
    :send_estimates_to_attention,
    :send_estimates_to_email,
    :sepa_active,
    :sepa_iban,
    :sepa_iban_account_name,
    :sepa_bic,
    :sepa_mandate_id,
    :sepa_mandate_date,
    :sepa_sequence_type,
    :credit_card_number,
    :credit_card_reference,
    :credit_card_type,
    :tax_number_validated_at,
    :tax_number_valid,
    :invoice_workflow_id,
    :estimate_workflow_id,
    :si_identifier,
    :si_identifier_type,
    :created_at,
    :updated_at,
    :version,
    :sales_invoices_url
  ]

  @doc """
  ## Lists all Contacts in the Administration.

  ### Parameters

  * `page`, `Integer` – The page number.
  * `per_page`, `Integer`	– Amount of contacts per page (max 100).
  * `query`, `String`	– Search terms. See above for a list of fields being searched.

  """
  def all(opts \\ %{}) do
    queryString = []

    if opts[:page], do: ["page=" <> opts[:page] | queryString]
    if opts[:per_page], do: ["per_page=" <> opts[:per_page] | queryString]
    if opts[:query], do: ["query=" <> opts[:query] | queryString]

    with {:ok, res} <- get("/contacts?" <> Enum.join(queryString, "&")) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> as_struct(Contact)
  end
end
