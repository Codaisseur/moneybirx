defmodule MoneyBirx.AdministrationTest do
  use ExUnit.Case
  # doctest MoneyBirx

  describe "all" do
    test "returns all the administrations \o/" do
      assert MoneyBirx.Administration.all() == {:ok,
      [
        %MoneyBirx.Administration{
          country: "NL",
          currency: "EUR",
          id: 123,
          language: "nl",
          name: "Parkietje B.V.",
          time_zone: "Europe/Amsterdam"
        }
      ]}
    end
  end

  describe "default" do
    test "returns the first administration \o/" do
      assert MoneyBirx.Administration.default() == {:ok,
      %MoneyBirx.Administration{
        country: "NL",
        currency: "EUR",
        id: 123,
        language: "nl",
        name: "Parkietje B.V.",
        time_zone: "Europe/Amsterdam"
      }}
    end
  end
end
