require Logger

defmodule Moneybirx.ExternalInvoice do
  @moduledoc """
  # Moneybird External Invoices

  ## Attributes

  External Invoices are quite large data structures so we omitted full documentation examples. Here is a full Sales Invoice in JSON format.

      {
        "id": "293129730970879446",
        "administration_id": 123,
        "contact_id": "293129730915304915",
        "contact": {
          "id": "293129730915304915",
          "administration_id": 123,
          "company_name": "Relation 22",
          "firstname": null,
          "lastname": null,
          "address1": null,
          "address2": null,
          "zipcode": null,
          "city": null,
          "country": "NL",
          "phone": null,
          "delivery_method": "Email",
          "customer_id": "175cf69a7ffddf52a5e8fc3afd68af6bb5eac0bc10c190b48c81150bcdbf759e",
          "tax_number": null,
          "chamber_of_commerce": null,
          "bank_account": null,
          "attention": null,
          "email": null,
          "email_ubl": false,
          "send_invoices_to_attention": null,
          "send_invoices_to_email": null,
          "send_estimates_to_attention": null,
          "send_estimates_to_email": null,
          "sepa_active": false,
          "sepa_iban": null,
          "sepa_iban_account_name": null,
          "sepa_bic": null,
          "sepa_mandate_id": null,
          "sepa_mandate_date": null,
          "sepa_sequence_type": "RCUR",
          "credit_card_number": null,
          "credit_card_reference": null,
          "credit_card_type": null,
          "tax_number_validated_at": null,
          "tax_number_valid": null,
          "invoice_workflow_id": null,
          "estimate_workflow_id": null,
          "si_identifier": null,
          "si_identifier_type": null,
          "created_at": "2020-07-03T09:58:37.441Z",
          "updated_at": "2020-07-03T09:58:37.441Z",
          "version": 1593770317,
          "sales_invoices_url": "http://moneybird.dev/123/sales_invoices/6e19de4ec22fdcc2186b99e13ea6b243f9b384b6b6c9f6848981e0d3d927471c/all",
          "notes": [],
          "custom_fields": []
        },
        "date": "2020-07-03",
        "state": "open",
        "due_date": null,
        "reference": "Invoice 29",
        "entry_number": 129,
        "origin": null,
        "source": null,
        "source_url": null,
        "currency": "EUR",
        "paid_at": null,
        "created_at": "2020-07-03T09:58:37.495Z",
        "updated_at": "2020-07-03T09:58:37.502Z",
        "version": 1593770317,
        "details": [
          {
            "id": "293129730975073751",
            "administration_id": 123,
            "tax_rate_id": "293129730942567893",
            "ledger_account_id": "293129730926839252",
            "project_id": null,
            "product_id": null,
            "amount": "1 x",
            "amount_decimal": "1.0",
            "description": "Invoice detail description",
            "price": "100.0",
            "period": null,
            "row_order": 0,
            "total_price_excl_tax_with_discount": "100.0",
            "total_price_excl_tax_with_discount_base": "100.0",
            "tax_report_reference": [],
            "created_at": "2020-07-03T09:58:37.499Z",
            "updated_at": "2020-07-03T09:58:37.499Z"
          }
        ],
        "payments": [],
        "total_paid": "0.0",
        "total_unpaid": "0.0",
        "total_unpaid_base": "0.0",
        "prices_are_incl_tax": false,
        "total_price_excl_tax": "0.0",
        "total_price_excl_tax_base": "0.0",
        "total_price_incl_tax": "0.0",
        "total_price_incl_tax_base": "0.0",
        "notes": [],
        "attachments": [],
        "events": [],
        "tax_totals": [
          {
            "tax_rate_id": "293129730942567893",
            "taxable_amount": "100.0",
            "taxable_amount_base": "100.0",
            "tax_amount": "21.0",
            "tax_amount_base": "21.0"
          }
        ]
      }

  See [Moneybird's API Documentation](https://developer.moneybird.com/api/external_invoices) for more info.

  """
  use Moneybirx.Client

  alias __MODULE__

  alias Moneybirx.{
    Contact,
    ExternalInvoiceDetails,
    ExternalInvoicePayment
  }

  defstruct [
    :id,
    :administration_id,
    :contact_id,
    :contact,
    :date,
    :state,
    :due_date,
    :reference,
    :entry_number,
    :origin,
    :source,
    :source_url,
    :currency,
    :paid_at,
    :created_at,
    :updated_at,
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
    :notes,
    :attachments,
    :events,
    :tax_totals,
  ]

  @doc """
  ## Lists all External Invoices in the Administration.

  ## Parameters

  * `page`, `Integer` – The page number.
  * `per_page`, `Integer`	– Amount of external_invoices per page (max 100).
  * `filter`, `String`	– Search terms. See below for a list of fields being filtered.

  ## Examples

      Moneybirx.ExternalInvoice.all()

  ## Filter Query

  Moneybird allows filtering on the following attributes and formats:

  * `state`	`String` –	all	all, draft, open, scheduled, pending_payment, late, reminded, paid or uncollectible
  * `period`	`String` –	this_year	This can either be the description of a period (this_month, prev_month, next_month, this_quarter, prev_quarter, next_quarter, this_year, prev_year, next_year) or a custom period (201301..201302, 20130101..20130131)
  * `contact_id`	`Integer` –	 	Select invoices belonging to a certain contact

      Moneybirx.ExternalInvoice.all(%{filter: "period:this_month"})

  """
  def all(opts \\ %{}) do
    queryString =
      opts
      |> Map.keys()
      |> Enum.reduce("?", fn opt, qs ->
        value = String.replace(opts[opt], ":", "%3A")
        qs <> "#{opt}=#{value}&"
      end)

    with {:ok, res} <- get("/external_invoices" <> queryString) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Find a ExternalInvoice by it's `id`.

  ## Examples

      Moneybirx.ExternalInvoice.find("264861201281844836")

  """
  def find(id) do
    with {:ok, res} <- get("/external_invoices/" <> id) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Create a ExternalInvoice.

  ## Examples

      Moneybirx.ExternalInvoice.create(%{"valid" => "params"})

  """
  def create(params) do
    with {:ok, res} <- post("/external_invoices", %{sales_invoice: params}) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def process_details_body(invoices) when is_list(invoices) do
    invoices
    |> Enum.map(&process_details_body/1)
  end

  def process_details_body(invoice) do
    details =
      invoice.details
      |> as_struct(ExternalInvoiceDetails)

    %ExternalInvoice{invoice | details: details}
  end

  def process_payments_body(invoices) when is_list(invoices) do
    invoices
    |> Enum.map(&process_payments_body/1)
  end

  def process_payments_body(invoice) do
    payments =
      invoice.payments
      |> as_struct(ExternalInvoicePayment)

    %ExternalInvoice{invoice | payments: payments}
  end

  def process_contact_body(invoices) when is_list(invoices) do
    invoices
    |> Enum.map(&process_contact_body/1)
  end

  def process_contact_body(invoice) do
    contact =
      invoice.contact
      |> as_struct(Contact)

    %ExternalInvoice{invoice | contact: contact}
  end
end

defmodule Moneybirx.ExternalInvoiceDetails do
  defstruct [
    :id,
    :administration_id,
    :tax_rate_id,
    :ledger_account_id,
    :project_id,
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

defmodule Moneybirx.ExternalInvoicePayment do
  defstruct [
    :id,
    :administration_id,
    :invoice_type,
    :invoice_id,
    :financial_account_id,
    :user_id,
    :payment_transaction_id,
    :transaction_identifier,
    :price,
    :price_base,
    :payment_date,
    :credit_invoice_id,
    :financial_mutation_id,
    :created_at,
    :updated_at,
  ]
end
