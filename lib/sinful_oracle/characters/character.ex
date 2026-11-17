defmodule SinfulOracle.Characters.Character do
  @moduledoc """
  A fictional adult character. Identity, pronouns, and body description
  are deliberately independent fields.
  """

  @enforce_keys [:name, :age, :gender_identity, :pronouns]
  defstruct [:name, :age, :gender_identity, :pronouns, :description, :anatomy]

  def new(attrs) do
    character = %__MODULE__{
      name: Map.fetch!(attrs, :name),
      age: Map.fetch!(attrs, :age),
      gender_identity: Map.fetch!(attrs, :gender_identity),
      pronouns: Map.fetch!(attrs, :pronouns),
      description: Map.get(attrs, :description),
      anatomy: Map.get(attrs, :anatomy)
    }

    validate(character)
  end

  def validate(%__MODULE__{age: age} = character) when is_integer(age) and age >= 18,
    do: {:ok, character}

  def validate(_character), do: {:error, :characters_must_be_adults}
end
