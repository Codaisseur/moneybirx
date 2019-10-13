defmodule Moneybirx.AdministrationTest do
  use ExUnit.Case
  doctest Moneybirx.Administration

  describe "all" do
    test "returns all the administrations \o/" do
      assert Moneybirx.Administration.all() == {:ok,
      [
        %Moneybirx.Administration{
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
      assert Moneybirx.Administration.default() == {:ok,
      %Moneybirx.Administration{
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
