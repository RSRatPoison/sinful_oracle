defmodule SinfulOracle.Characters.CharacterTest do
  use ExUnit.Case, async: true

  alias SinfulOracle.Characters.Character

  test "accepts adult fictional characters" do
    assert {:ok, %Character{age: 25}} =
      Character.new(%{name: "Moth", age: 25, gender_identity: "nonbinary", pronouns: "they/them"})
  end

  test "rejects characters under 18" do
    assert {:error, :characters_must_be_adults} =
      Character.new(%{name: "Moth", age: 17, gender_identity: "nonbinary", pronouns: "they/them"})
  end
end
