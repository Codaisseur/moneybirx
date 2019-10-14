defmodule Moneybirx.ContactTest do
  use ExUnit.Case
  doctest Moneybirx.Contact

  describe "all" do
    test "returns all the contacts in the administration" do
      assert Moneybirx.Contact.all(%{query: "appleseed"}) == {:ok,
        [
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

            # TODO: load related data
            # notes: [],
            # custom_fields: [],
            # events: [
            #   %{
            #     administration_id: 123,
            #     user_id: 15668111646740,
            #     action: "contact_created",
            #     link_entity_id: nil,
            #     link_entity_type: nil,
            #     data: %{},
            #     created_at: "2019-08-26T09:19:57.688Z",
            #     updated_at: "2019-08-26T09:19:57.688Z"
            #   }
            # ]
          }
        ]
      }
    end
  end

  describe "find" do
    test "returns the Contact with the given `id`" do
      assert Moneybirx.Contact.find("264861044858423000") == {:ok,
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
        }}
    end

    test "raises NotFoundError with a non-existing id" do
      assert_raise Moneybirx.NotFoundError, fn ->
        Moneybirx.Contact.find("12334")
      end
    end
  end
end
