defmodule Moneybirx.ContactTest do
  use Moneybirx.ResponseCase
  alias Moneybirx.Contact

  doctest Contact

  describe "all" do
    test "returns all the contacts matching given query in the administration" do
      assert Contact.all(%{query: "name"}) ==
               {:ok, fixture("queried_contacts", Contact)}
    end
  end

  describe "find" do
    test "returns the Contact with the given `id`" do
      assert Contact.find("264861044858423000") ==
               {:ok, fixture("one_contact", Contact)}
    end

    test "raises NotFoundError with a non-existing id" do
      assert_raise Moneybirx.NotFoundError, fn ->
        Contact.find("nope")
      end
    end
  end

  describe "create" do
    test "returns the newly created contact" do
      assert Contact.create(%{"valid" => "params"}) ==
               {:ok, fixture("new_contact", Contact)}
    end
  end
end
