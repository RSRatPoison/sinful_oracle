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

  test "category filters the deck" do
    assert Enum.all?(Reading.draw(:identity, 1), &(&1.card.category == :identity))
  end

  test "reading intensity has a human label" do
    assert Reading.intensity_label(:wicked) == "Wicked"
  end
end
