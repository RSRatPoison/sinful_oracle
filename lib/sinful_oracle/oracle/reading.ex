
defmodule SinfulOracle.Oracle.Reading do
  @moduledoc """
  Draws cards and creates a three-position reading from the local deck.
  """

  alias SinfulOracle.Oracle.Deck

  @intensities [:teasing, :sultry, :wicked]
  @positions [:past, :present, :temptation]

  def intensities, do: @intensities

  def positions, do: @positions

  def position_label(:past), do: "Past"
  def position_label(:present), do: "Present"
  def position_label(:temptation), do: "Temptation"
  def position_label(_), do: "Your card"

  def draw(category \\ :all, count \\ 1) when count in 1..3 do
    all_cards = Deck.all()
    category_cards = Deck.by_category(category)

    pool =
      cond do
        category == :all ->
          Enum.shuffle(all_cards)

        category_cards == [] ->
          Enum.shuffle(all_cards)

        true ->
          focused_card = Enum.random(category_cards)

          [focused_card |
            Enum.reject(Enum.shuffle(all_cards), &(&1.id == focused_card.id))]
      end

    pool
    |> Enum.take(count)
    |> Enum.with_index()
    |> Enum.map(fn {card, index} ->
      %{
        card: card,
        position: Enum.at(@positions, index),
        reversed?: Enum.random([true, false])
      }
    end)
  end

  def intensity_label(:teasing), do: "Teasing"
  def intensity_label(:sultry), do: "Sultry"
  def intensity_label(:wicked), do: "Wicked"
  def intensity_label(_), do: "Teasing"

  def intensity_guidance(:teasing) do
    "Keep things playful. Let flirtation, wit, and anticipation do the work."
  end

  def intensity_guidance(:sultry) do
    "Slow the moment down. Focus on atmosphere, chemistry, and emotional tension."
  end

  def intensity_guidance(:wicked) do
    "Explore bolder adult themes while keeping every character an adult and every interaction consensual."
  end

  def intensity_guidance(_), do: intensity_guidance(:teasing)

  def interpretation(%{card: card, reversed?: true}) do
    card.reversed_meaning || card.meaning
  end

  def interpretation(%{card: card}), do: card.meaning
end
