defmodule Moneybirx.RecurringSalesInvoiceTest do
  use Moneybirx.ResponseCase
  alias Moneybirx.RecurringSalesInvoice

  doctest RecurringSalesInvoice

  describe "all" do
    test "returns all the Sales Invoices in the Administration" do
      assert RecurringSalesInvoice.all(%{filter: "frequency:month"}) ==
               {:ok, fixture("filtered_recurring_sales_invoices", RecurringSalesInvoice)}
    end
  end

  describe "find" do
    test "returns the RecurringSalesInvoice with the given `id`" do
      assert RecurringSalesInvoice.find("264861180704589127") ==
               {:ok, fixture("one_recurring_sales_invoice", RecurringSalesInvoice)}
    end

    test "raises NotFoundError with a non-existing id" do
      assert_raise Moneybirx.NotFoundError, fn ->
        RecurringSalesInvoice.find("nope")
      end
    end
  end

  describe "create" do
    test "returns the newly created recurring_sales_invoice" do
      assert RecurringSalesInvoice.create(%{"valid" => "params"}) ==
               {:ok, fixture("new_recurring_sales_invoice", RecurringSalesInvoice)}
    end
  end
end
