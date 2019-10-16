defmodule Moneybirx.SalesInvoiceTest do
  use Moneybirx.ResponseCase
  alias Moneybirx.SalesInvoice

  doctest SalesInvoice

  describe "all" do
    test "returns all the Sales Invoices in the Administration" do
      assert SalesInvoice.all(%{filter: "period:this_month"}) ==
               {:ok, fixture("filtered_sales_invoices", SalesInvoice)}
    end
  end

  describe "find" do
    test "returns the SalesInvoice with the given `id`" do
      assert SalesInvoice.find("264861201281844836") ==
               {:ok, fixture("one_sales_invoice", SalesInvoice)}
    end

    test "raises NotFoundError with a non-existing id" do
      assert_raise Moneybirx.NotFoundError, fn ->
        SalesInvoice.find("nope")
      end
    end
  end

  describe "create" do
    test "returns the newly created sales_invoice" do
      assert SalesInvoice.create(%{"valid" => "params"}) ==
               {:ok, fixture("new_sales_invoice", SalesInvoice)}
    end
  end

  describe "send_invoice" do
    test "returns the sent invoice" do
      assert SalesInvoice.send_invoice("264861210015434486") ==
        {:ok, fixture("sent_sales_invoice", SalesInvoice)}
    end
  end
end
