
defmodule SinfulOracle.Oracle.ReadingTest do
  use ExUnit.Case, async: true

  alias SinfulOracle.Oracle.{Deck, Reading}

  test "the deck contains cards" do
    assert length(Deck.all()) >= 6
  end

  test "draw returns the requested number of cards" do
    assert length(Reading.draw(:all, 1)) == 1
    assert length(Reading.draw(:all, 3)) == 3
  end

  test "three-card readings use the correct positions" do
    reading = Reading.draw(:all, 3)

    assert Enum.map(reading, & &1.position) ==
             [:past, :present, :temptation]
  end

  test "a reading never draws the same card twice" do
    reading = Reading.draw(:all, 3)
    card_ids = Enum.map(reading, & &1.card.id)

    assert length(Enum.uniq(card_ids)) == 3
  end

  test "the selected category influences the first card" do
    reading = Reading.draw(:identity, 3)

    assert hd(reading).card.category == :identity
  end

  test "an unknown category falls back to the full deck" do
    reading = Reading.draw(:unknown_category, 3)

    assert length(reading) == 3
  end

  test "reading intensity has a human label" do
    assert Reading.intensity_label(:teasing) == "Teasing"
    assert Reading.intensity_label(:sultry) == "Sultry"
    assert Reading.intensity_label(:wicked) == "Wicked"
  end

  test "each intensity has its own general guidance" do
    assert Reading.intensity_guidance(:teasing) !=
             Reading.intensity_guidance(:sultry)

    assert Reading.intensity_guidance(:sultry) !=
             Reading.intensity_guidance(:wicked)
  end

  test "intensity changes the fictional prompt for every card" do
    Enum.each(Deck.all(), fn card ->
      entry = %{card: card}

      prompts =
        Enum.map(Reading.intensities(), fn intensity ->
          Reading.prompt(entry, intensity)
        end)

      assert length(Enum.uniq(prompts)) == 3
    end)
  end

  test "intensity changes the interpretation for every card" do
    Enum.each(Deck.all(), fn card ->
      entry = %{card: card, reversed?: false}

      interpretations =
        Enum.map(Reading.intensities(), fn intensity ->
          Reading.interpretation(entry, intensity)
        end)

      assert length(Enum.uniq(interpretations)) == 3
    end)
  end

  test "reversed cards use their reversed meaning" do
    card = hd(Deck.all())
    entry = %{card: card, reversed?: true}

    assert Reading.interpretation(entry) == card.reversed_meaning
  end

  test "intensity variations preserve reversed meanings" do
    card = hd(Deck.all())
    entry = %{card: card, reversed?: true}

    result = Reading.interpretation(entry, :wicked)

    assert String.starts_with?(result, card.reversed_meaning)
  end

  test "upright cards use their regular meaning" do
    card = hd(Deck.all())
    entry = %{card: card, reversed?: false}

    assert Reading.interpretation(entry) == card.meaning
  end

  test "the expanded deck contains exactly 24 cards" do
    assert length(Deck.all()) == 24
  end

  test "every category contains four cards" do
    for {_label, category} <- Deck.categories(), category != :all do
      assert length(Deck.by_category(category)) == 4
    end
  end

  test "every card has a unique identifier" do
    ids = Enum.map(Deck.all(), & &1.id)

    assert length(Enum.uniq(ids)) == length(ids)
  end
end
