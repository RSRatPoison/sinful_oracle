defmodule SinfulOracle.Oracle.Reading do
  @moduledoc "Draws cards and creates a reading from the local deck."

  alias SinfulOracle.Oracle.Deck

  @intensities [:teasing, :sultry, :wicked]

  def intensities, do: @intensities

  def draw(category \\ :all, count \\ 1) when count in 1..3 do
    cards =
      category
      |> Deck.by_category()
      |> Enum.shuffle()
      |> Enum.take(count)

    Enum.map(cards, fn card ->
      %{card: card, reversed?: Enum.random([true, false])}
    end)
  end

  def intensity_label(:teasing), do: "Teasing"
  def intensity_label(:sultry), do: "Sultry"
  def intensity_label(:wicked), do: "Wicked"
  def intensity_label(_), do: "Teasing"

  def interpretation(%{card: card, reversed?: true}), do: card.reversed_meaning || card.meaning
  def interpretation(%{card: card}), do: card.meaning
end
