require Logger

defmodule Moneybirx.SalesInvoice do
  @moduledoc """
  # Moneybird Sales Invoices

  ## Attributes

  Sales Invoices are quite large data structures so we omitted full documentation examples. Here is a full Sales Invoice in JSON format.

      {
        "id": "264861204459030166",
        "administration_id": 123,
        "contact_id": "264861203795281549",
        "contact": {
          "id": "264861203795281549",
          "administration_id": 123,
          "company_name": "Foobar Holding B.V.",
          "firstname": "",
          "lastname": "",
          "address1": "Hoofdstraat 12",
          "address2": "",
          "zipcode": "1234AB",
          "city": "Amsterdam",
          "country": "NL",
          "phone": "",
          "delivery_method": "Email",
          "customer_id": "1",
          "tax_number": "",
          "chamber_of_commerce": "",
          "bank_account": "",
          "attention": "",
          "email": "info@example.com",
          "email_ubl": true,
          "send_invoices_to_attention": "",
          "send_invoices_to_email": "info@example.com",
          "send_estimates_to_attention": "",
          "send_estimates_to_email": "info@example.com",
          "sepa_active": false,
          "sepa_iban": "",
          "sepa_iban_account_name": "",
          "sepa_bic": "",
          "sepa_mandate_id": "",
          "sepa_mandate_date": null,
          "sepa_sequence_type": "RCUR",
          "credit_card_number": "",
          "credit_card_reference": "",
          "credit_card_type": null,
          "tax_number_validated_at": null,
          "tax_number_valid": null,
          "invoice_workflow_id": null,
          "estimate_workflow_id": null,
          "si_identifier": "",
          "si_identifier_type": null,
          "created_at": "2019-08-26T09:22:29.161Z",
          "updated_at": "2019-08-26T09:22:29.161Z",
          "version": 1566811349,
          "sales_invoices_url": "http://moneybird.dev/123/sales_invoices/62dd27d4a4eda96a66e6c8293227d3a4f1d5a310435733460adc43b8bc3f0590/all",
          "notes": [],
          "custom_fields": []
        },
        "invoice_id": null,
        "recurring_sales_invoice_id": null,
        "workflow_id": "264861010714690884",
        "document_style_id": "264861011128878414",
        "identity_id": "264861010400118083",
        "draft_id": 2,
        "state": "draft",
        "invoice_date": null,
        "due_date": "2019-09-09",
        "payment_conditions": "We verzoeken u vriendelijk het bovenstaande bedrag van {document.total_price} voor {document.due_date} te voldoen op onze bankrekening onder vermelding van de omschrijving {document.payment_reference}. Voor vragen kunt u contact opnemen per e-mail.",
        "payment_reference": null,
        "reference": "30052",
        "language": "nl",
        "currency": "EUR",
        "discount": "0.0",
        "original_sales_invoice_id": null,
        "paused": false,
        "paid_at": null,
        "sent_at": null,
        "created_at": "2019-08-26T09:22:29.792Z",
        "updated_at": "2019-08-26T09:22:29.808Z",
        "public_view_code": "303058",
        "version": 1566811349,
        "details": [
          {
            "id": "264861204466370199",
            "administration_id": 123,
            "tax_rate_id": "264861010337203517",
            "ledger_account_id": "264861010182014250",
            "product_id": null,
            "amount": null,
            "amount_decimal": 1,
            "description": "Rocking Chair",
            "price": "129.95",
            "period": null,
            "row_order": 0,
            "total_price_excl_tax_with_discount": "129.95",
            "total_price_excl_tax_with_discount_base": "129.95",
            "tax_report_reference": ["NL/1a"],
            "created_at": "2019-08-26T09:22:29.800Z",
            "updated_at": "2019-08-26T09:22:29.800Z"
          }
        ],
        "payments": [],
        "total_paid": "0.0",
        "total_unpaid": "157.24",
        "total_unpaid_base": "157.24",
        "prices_are_incl_tax": false,
        "total_price_excl_tax": "129.95",
        "total_price_excl_tax_base": "129.95",
        "total_price_incl_tax": "157.24",
        "total_price_incl_tax_base": "157.24",
        "total_discount": "0.0",
        "url": "http://moneybird.dev/123/sales_invoices/af93fa653c5ec1c8b6ac3d7d939000a2cc2d7b380f117943f4a26a0b8e4d3178/62dd27d4a4eda96a66e6c8293227d3a4f1d5a310435733460adc43b8bc3f0590",
        "custom_fields": [],
        "notes": [],
        "attachments": [],
        "events": [
          {
            "administration_id": 123,
            "user_id": 15668111646740,
            "action": "sales_invoice_created",
            "link_entity_id": null,
            "link_entity_type": null,
            "data": {},
            "created_at": "2019-08-26T09:22:29.812Z",
            "updated_at": "2019-08-26T09:22:29.812Z"
          }
        ],
        "tax_totals": [
          {
            "tax_rate_id": "264861010337203517",
            "taxable_amount": "129.95",
            "taxable_amount_base": "129.95",
            "tax_amount": "27.29",
            "tax_amount_base": "27.29"
          }
        ]
      }

  See [Moneybird's API Documentation](https://developer.moneybird.com/api/sales_invoices) for more info.

  """
  use Moneybirx.Client

  alias __MODULE__
  alias Moneybirx.{
    Contact,
    SalesInvoiceDetails
  }

  defstruct [
    :id,
    :administration_id,
    :contact_id,
    :contact,
    :invoice_id,
    :recurring_sales_invoice_id,
    :workflow_id,
    :document_style_id,
    :identity_id,
    :draft_id,
    :state,
    :invoice_date,
    :due_date,
    :payment_conditions,
    :payment_reference,
    :reference,
    :language,
    :currency,
    :discount,
    :original_sales_invoice_id,
    :paused,
    :paid_at,
    :sent_at,
    :created_at,
    :updated_at,
    :public_view_code,
    :version,
    :details,
    :payments,
    :total_paid,
    :total_unpaid,
    :total_unpaid_base,
    :prices_are_incl_tax,
    :total_price_excl_tax,
    :total_price_excl_tax_base,
    :total_price_incl_tax,
    :total_price_incl_tax_base,
    :total_discount,
    :url,
    :custom_fields,
    :notes,
    :attachments,
    :events,
    :tax_totals
  ]

  @doc """
  ## Lists all Sales Invoices in the Administration.

  ## Parameters

  * `page`, `Integer` – The page number.
  * `per_page`, `Integer`	– Amount of sales_invoices per page (max 100).
  * `filter`, `String`	– Search terms. See below for a list of fields being filtered.

  ## Examples

      Moneybirx.SalesInvoice.all()

  ## Filter Query

  Moneybird allows filtering on the following attributes and formats:

  * `state`	`String` –	all	all, draft, open, scheduled, pending_payment, late, reminded, paid or uncollectible
  * `period`	`String` –	this_year	This can either be the description of a period (this_month, prev_month, next_month, this_quarter, prev_quarter, next_quarter, this_year, prev_year, next_year) or a custom period (201301..201302, 20130101..20130131)
  * `contact_id`	`Integer` –	 	Select invoices belonging to a certain contact
  * `recurring_sales_invoice_id`	`Integer` –	 	Select invoices created by a certain recurring invoice
  * `workflow_id`	`Integer` –	 	Select invoices that use a certain workflow

      Moneybirx.SalesInvoice.all(%{filter: "period:this_month"})
  """
  def all(opts \\ %{}) do
    queryString =
      opts
      |> Map.keys()
      |> Enum.reduce("?", fn opt, qs ->
        value = String.replace(opts[opt], ":", "%3A")
        qs <> "#{opt}=#{value}&"
      end)

    with {:ok, res} <- get("/sales_invoices" <> queryString) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Find a SalesInvoice by it's `id`.

  ## Examples

      Moneybirx.SalesInvoice.find("264861201281844836")

  """
  def find(id) do
    with {:ok, res} <- get("/sales_invoices/" <> id) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Create a SalesInvoice.

  ## Examples

      Moneybirx.SalesInvoice.create(%{"valid" => "params"})
  """
  def create(params) do
    with {:ok, res} <- post("/sales_invoices", %{sales_invoice: params}) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> as_struct(SalesInvoice)
    |> process_contact_body()
    |> process_details_body()
  end

  def process_details_body(invoices) when is_list(invoices) do
    invoices
    |> Enum.map(&process_details_body/1)
  end

  def process_details_body(invoice) do
    details =
      invoice.details
      |> as_struct(SalesInvoiceDetails)

    %SalesInvoice{invoice | details: details}
  end

  def process_contact_body(invoices) when is_list(invoices) do
    invoices
    |> Enum.map(&process_contact_body/1)
  end

  def process_contact_body(invoice) do
    contact =
      invoice.contact
      |> as_struct(Contact)

    %SalesInvoice{invoice | contact: contact}
  end
end

defmodule Moneybirx.SalesInvoiceDetails do
  defstruct [
    :id,
    :administration_id,
    :tax_rate_id,
    :ledger_account_id,
    :product_id,
    :amount,
    :amount_decimal,
    :description,
    :price,
    :period,
    :row_order,
    :total_price_excl_tax_with_discount,
    :total_price_excl_tax_with_discount_base,
    :tax_report_reference,
    :created_at,
    :updated_at
  ]
end
