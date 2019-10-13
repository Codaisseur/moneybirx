defmodule Moneybirx.ContactTest do
  use ExUnit.Case
  # doctest Moneybirx

  describe "all" do
    test "returns all the administrations \o/" do
      assert Moneybirx.Contact.all() == {:ok,
        [
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
end