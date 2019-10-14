require Logger

defmodule Moneybirx.Contact do
  @moduledoc """
  # Moneybird Contacts

  See [Moneybird's API Documentation](https://developer.moneybird.com/api/contacts) for more info.

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

  ## Parameters

  * `page`, `Integer` – The page number.
  * `per_page`, `Integer`	– Amount of contacts per page (max 100).
  * `query`, `String`	– Search terms. See above for a list of fields being searched.

  ## Examples

      iex> Moneybirx.Contact.all()
      {:ok, [
        %Moneybirx.Contact{
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
          created_at: "2019-08-26T09:19:57.675Z",
          updated_at: "2019-08-26T09:19:57.675Z",
          version: 1566811197,
          sales_invoices_url: "http://moneybird.dev/123/sales_invoices/682edb346851c5a612c6292e8415174369af854274bae742cdfcc649da2b6914/all",
        },
        %Moneybirx.Contact{
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
        },
        %Moneybirx.Contact{
          id: "264861044912948955",
          administration_id: 123,
          company_name: "Foobar Holding B.V.",
          firstname: "John",
          lastname: "Doe",
          address1: "1 Infinite Loop",
          address2: "",
          zipcode: "123456",
          city: "Redmond",
          country: "NL",
          phone: "",
          delivery_method: "Email",
          customer_id: "2",
          tax_number: "",
          chamber_of_commerce: "",
          bank_account: "NL50TEST0166567191",
          attention: "",
          email: "info@example.com",
          email_ubl: true,
          send_invoices_to_attention: "",
          send_invoices_to_email: "info@example.com",
          send_estimates_to_attention: "",
          send_estimates_to_email: "info@example.com",
          sepa_active: true,
          sepa_iban: "NL50TEST0166567191",
          sepa_iban_account_name: "Foobar Holding B.V.",
          sepa_bic: "RABONL2U",
          sepa_mandate_id: "MAN12313",
          sepa_mandate_date: "2014-01-01",
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
          created_at: "2019-08-26T09:19:57.639Z",
          updated_at: "2019-08-26T09:19:57.639Z",
          version: 1566811197,
          sales_invoices_url: "http://moneybird.dev/123/sales_invoices/d4f20db01b1aafe2f1f1fcb5b56adb1592958feb3e2dce4e1d98d2ecd3df7e3b/all",
        }
      ]}

  ## Search Query

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

      iex> Moneybirx.Contact.all(%{query: "Appleseed"})
      {:ok, [
        %Moneybirx.Contact{
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
        }
      ]}
  """
  def all(opts \\ %{}) do
    queryString =
      opts
      |> Map.keys()
      |> Enum.reduce("?", fn opt, qs ->
        qs <> "#{opt}=#{opts[opt]}&"
      end)

    with {:ok, res} <- get("/contacts" <> queryString) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Find a Contact by it's `id`.

  ## Examples

      iex> Moneybirx.Contact.find("264861044858423000")
      {:ok, %Moneybirx.Contact{
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
      }}

  """
  def find(id) do
    with {:ok, res} <- get("/contacts/" <> id) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Create a Contact.

  ## Examples

      iex> Moneybirx.Contact.create(%{"company_name" => "Test B.V."})
      {:ok, %Moneybirx.Contact{
        attention: "",
        sepa_iban_account_name: "",
        sales_invoices_url:
          "http://moneybird.dev/123/sales_invoices/236de183d032318bb60f9f8b05181ea80fd695ea67aeb0f8792f39651bcd4574/all",
        customer_id: "3",
        city: "",
        si_identifier_type: nil,
        id: "264861050065651551",
        estimate_workflow_id: nil,
        firstname: "",
        zipcode: "",
        send_estimates_to_attention: "",
        address2: "",
        sepa_sequence_type: "RCUR",
        chamber_of_commerce: "",
        administration_id: 123,
        sepa_bic: "",
        created_at: "2019-08-26T09:20:02.581Z",
        phone: "",
        tax_number: "",
        email_ubl: true,
        company_name: "Test B.V.",
        tax_number_valid: nil,
        credit_card_type: nil,
        sepa_iban: "",
        si_identifier: "",
        invoice_workflow_id: nil,
        sepa_mandate_date: nil,
        credit_card_number: "",
        tax_number_validated_at: nil,
        address1: "",
        send_invoices_to_attention: "",
        email: "",
        lastname: "",
        country: "NL",
        updated_at: "2019-08-26T09:20:02.581Z",
        credit_card_reference: "",
        bank_account: "",
        delivery_method: "Email",
        send_invoices_to_email: "",
        sepa_active: false,
        version: 1_566_811_202,
        send_estimates_to_email: "",
        sepa_mandate_id: ""
      }}
  """
  def create(params) do
    with {:ok, res} <- post("/contacts", %{contact: params}) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> as_struct(Contact)
  end
end
