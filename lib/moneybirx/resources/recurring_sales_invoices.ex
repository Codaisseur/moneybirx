require Logger

defmodule Moneybirx.RecurringSalesInvoice do
  @moduledoc """
  # Moneybird Recurring Sales Invoices

  ## Attributes

  Recurring Sales Invoices are quite large data structures so we omitted full documentation examples. Here is a full Recurring Sales Invoice in JSON format.

      {
        "id": "264861180704589127",
        "administration_id": 123,
        "contact_id": "264861180589245764",
        "contact": {
          "id": "264861180589245764",
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
          "created_at": "2019-08-26T09:22:07.054Z",
          "updated_at": "2019-08-26T09:22:07.054Z",
          "version": 1566811327,
          "recurring_sales_invoices_url": "http://moneybird.dev/123/recurring_sales_invoices/64de78412c5ca333b2e20435ce9c6383510fcfa7297f22b6ab508e7a181cdde1/all",
          "notes": [],
          "custom_fields": []
        },
        "workflow_id": "264861010714690884",
        "start_date": "2019-08-27",
        "invoice_date": "2019-08-27",
        "last_date": "2019-08-27",
        "active": true,
        "payment_conditions": "We verzoeken u vriendelijk het bovenstaande bedrag van {document.total_price} voor {document.due_date} te voldoen op onze bankrekening onder vermelding van de omschrijving {document.payment_reference}. Voor vragen kunt u contact opnemen per e-mail.",
        "reference": "Project X",
        "language": "nl",
        "currency": "EUR",
        "discount": "0.0",
        "first_due_interval": 14,
        "auto_send": false,
        "sending_scheduled_at": null,
        "sending_scheduled_user_id": null,
        "frequency_type": "month",
        "frequency": 1,
        "created_at": "2019-08-26T09:22:07.164Z",
        "updated_at": "2019-08-26T09:22:07.176Z",
        "version": 1566811327,
        "prices_are_incl_tax": false,
        "total_price_excl_tax": "2.91",
        "total_price_excl_tax_base": "2.91",
        "total_price_incl_tax": "3.52",
        "total_price_incl_tax_base": "3.52",
        "details": [
          {
            "id": "264861180708783432",
            "administration_id": 123,
            "tax_rate_id": "264861010337203517",
            "ledger_account_id": "264861010182014250",
            "product_id": null,
            "amount": "5 stuks",
            "amount_decimal": "5.0",
            "description": "Appels",
            "price": "0.45",
            "period": null,
            "row_order": 1,
            "total_price_excl_tax_with_discount": "2.25",
            "total_price_excl_tax_with_discount_base": "2.25",
            "tax_report_reference": ["NL/1a"],
            "created_at": "2019-08-26T09:22:07.169Z",
            "updated_at": "2019-08-26T09:22:07.169Z"
          },
          {
            "id": "264861180711929161",
            "administration_id": 123,
            "tax_rate_id": "264861010337203517",
            "ledger_account_id": "264861010182014250",
            "product_id": null,
            "amount": "2 stuks",
            "amount_decimal": "2.0",
            "description": "Peren",
            "price": "0.33",
            "period": null,
            "row_order": 2,
            "total_price_excl_tax_with_discount": "0.66",
            "total_price_excl_tax_with_discount_base": "0.66",
            "tax_report_reference": ["NL/1a"],
            "created_at": "2019-08-26T09:22:07.173Z",
            "updated_at": "2019-08-26T09:22:07.173Z"
          }
        ],
        "custom_fields": [],
        "notes": [],
        "attachments": [],
        "events": [
          {
            "administration_id": 123,
            "user_id": 15668111646740,
            "action": "recurring_sales_invoice_created",
            "link_entity_id": null,
            "link_entity_type": null,
            "data": {},
            "created_at": "2019-08-26T09:22:07.180Z",
            "updated_at": "2019-08-26T09:22:07.180Z"
          }
        ]
      }


  See [Moneybird's API Documentation](https://developer.moneybird.com/api/recurring_sales_invoices) for more info.

  """
  use Moneybirx.Client

  alias __MODULE__

  alias Moneybirx.{
    Contact,
    SalesInvoiceDetails,
    Event
  }

  defstruct [
    :id,
    :administration_id,
    :contact_id,
    :contact,
    :workflow_id,
    :start_date,
    :invoice_date,
    :last_date,
    :active,
    :payment_conditions,
    :reference,
    :language,
    :currency,
    :discount,
    :first_due_interval,
    :auto_send,
    :sending_scheduled_at,
    :sending_scheduled_user_id,
    :frequency_type,
    :frequency,
    :created_at,
    :updated_at,
    :version,
    :prices_are_incl_tax,
    :total_price_excl_tax,
    :total_price_excl_tax_base,
    :total_price_incl_tax,
    :total_price_incl_tax_base,
    :details,
    :custom_fields,
    :notes,
    :attachments,
    :events,
  ]

  @doc """
  ## Lists all Recurring Sales Invoices in the Administration.

  ## Parameters

  * `page`, `Integer` – The page number.
  * `per_page`, `Integer`	– Amount of recurring_sales_invoices per page (max 100).
  * `filter`, `String`	– Search terms. See below for a list of fields being filtered.

  ## Examples

      Moneybirx.RecurringSalesInvoice.all()

  ## Filter Query

  Moneybird allows filtering on the following attributes and formats:

  * `state`	`String` –	"active" or "inactive", default: "active"
  * `frequency`	`String` –	all, day, week, month, quarter or year, default: "all"
  * `auto_send` `Boolean` – null, true or false, default: null
  * `contact_id`	`Integer` –	 	Select invoices belonging to a certain contact
  * `workflow_id`	`Integer` –	 	Select invoices that use a certain workflow

      Moneybirx.RecurringSalesInvoice.all(%{filter: "frequency:month"})

  """
  def all(opts \\ %{}) do
    queryString =
      opts
      |> Map.keys()
      |> Enum.reduce("?", fn opt, qs ->
        value = String.replace(opts[opt], ":", "%3A")
        qs <> "#{opt}=#{value}&"
      end)

    with {:ok, res} <- get("/recurring_sales_invoices" <> queryString) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Find a RecurringSalesInvoice by it's `id`.

  ## Examples

      Moneybirx.RecurringSalesInvoice.find("264861201281844836")

  """
  def find(id) do
    with {:ok, res} <- get("/recurring_sales_invoices/" <> id) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Create a RecurringSalesInvoice.

  ## Examples

      Moneybirx.RecurringSalesInvoice.create(%{"valid" => "params"})

  """
  def create(params) do
    with {:ok, res} <- post("/recurring_sales_invoices", %{recurring_sales_invoice: params}) do
      {:ok, res.body}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> as_struct(RecurringSalesInvoice)
    |> process_contact_body()
    |> process_details_body()
    |> process_events_body()
  end

  def process_details_body(invoices) when is_list(invoices) do
    invoices
    |> Enum.map(&process_details_body/1)
  end

  def process_details_body(invoice) do
    details =
      invoice.details
      |> as_struct(SalesInvoiceDetails)

    %RecurringSalesInvoice{invoice | details: details}
  end

  def process_contact_body(invoices) when is_list(invoices) do
    invoices
    |> Enum.map(&process_contact_body/1)
  end

  def process_contact_body(invoice) do
    contact =
      invoice.contact
      |> as_struct(Contact)

    %RecurringSalesInvoice{invoice | contact: contact}
  end

  def process_events_body(invoices) when is_list(invoices) do
    invoices
    |> Enum.map(&process_events_body/1)
  end

  def process_events_body(invoice) do
    events =
      invoice.events
      |> as_struct(Event)

    %RecurringSalesInvoice{invoice | events: events}
  end
end
