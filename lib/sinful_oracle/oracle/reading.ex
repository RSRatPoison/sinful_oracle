
defmodule SinfulOracle.Oracle.Reading do
  @moduledoc """
  Draws cards and creates an intensity-aware three-position reading.
  """

  alias SinfulOracle.Oracle.Deck

  @intensities [:teasing, :sultry, :wicked]
  @positions [:past, :present, :temptation]

  @intensity_prompts %{
    temptation: %{
      teasing: "Write a playful scene where two adult strangers trade a clever invitation. Let wit and curiosity build the spark, while both decide what feels comfortable.",
      sultry: "Set a slow, atmospheric scene between two adults drawn to each other. Use lingering glances, honest conversation, and the anticipation of a mutually wanted next step.",
      wicked: "Write a daring scene between consenting adults exploring a negotiated power dynamic. Show them discussing boundaries, choosing a safeword, and making room for either person to pause."
    },
    identity: %{
      teasing: "Describe an adult protagonist trying a new name, outfit, or form of self-expression. Give the moment a little mischief and a lot of joy.",
      sultry: "Write an intimate moment in which an adult protagonist feels seen and affirmed. Focus on trust, self-recognition, and the warmth of being understood.",
      wicked: "Create a bold transformation scene for an adult character celebrating their identity on their own terms. Let chosen names and pronouns be respected, without making assumptions about their body."
    },
    romance: %{
      teasing: "Write a flirtatious exchange between two adults. Let a small promise, a clever joke, or an unexpected compliment change the mood.",
      sultry: "Create a romantic scene between consenting adults where anticipation grows through meaningful gestures, emotional honesty, and mutual attraction.",
      wicked: "Write a high-stakes romantic confession between adults who are clear about what they want. Make the tension bold, but keep trust and freely given consent at its centre."
    },
    chaos: %{
      teasing: "Invent a ridiculous midnight dare for a group of adult friends. Make it funny, harmless, and easy for anyone to decline.",
      sultry: "Set a spontaneous late-night adventure among adults who trust one another. Let the excitement come from shared secrets, playful risks, and unexpected chemistry.",
      wicked: "Create an elaborate adult party game with daring challenges. Every participant agrees to the rules beforehand, can pass without pressure, and has a clear way to stop."
    },
    shadow: %{
      teasing: "Write a gothic conversation between adults who gently tease each other about a secret. Let the humour reveal a little vulnerability.",
      sultry: "Describe two adults sharing a private confession in a candlelit setting. Explore longing, uncertainty, and the relief of being accepted.",
      wicked: "Write a dark, emotionally intense confession between adults. Explore a difficult desire honestly, while making boundaries and mutual respect unmistakable."
    },
    forbidden: %{
      teasing: "Create a scene where two adults exchange a secret they have freely chosen to share. Let the thrill come from clever words and playful suspense.",
      sultry: "Write a private conversation between adults who are drawn together by a shared secret. Build tension through trust, restraint, and mutual curiosity.",
      wicked: "Explore a daring secret shared by consenting adults. Let them negotiate what stays private, what may be revealed, and what each person is comfortable exploring."
    }
  }

  @intensity_lenses %{
    temptation: %{
      teasing: "At this level, curiosity is a game: enjoy the possibility without promising more than you mean.",
      sultry: "At this level, notice the pull between desire and patience. You can choose the pace.",
      wicked: "At this level, boldness works best when every boundary is spoken and respected."
    },
    identity: %{
      teasing: "At this level, give yourself permission to experiment and enjoy the discovery.",
      sultry: "At this level, consider what it means to feel recognised, affirmed, and at home in yourself.",
      wicked: "At this level, claim your self-expression boldly while allowing no one else to define it for you."
    },
    romance: %{
      teasing: "At this level, small gestures and playful words may say more than grand declarations.",
      sultry: "At this level, emotional honesty can deepen attraction more than any performance.",
      wicked: "At this level, intensity is meaningful only when trust is strong enough to hold it."
    },
    chaos: %{
      teasing: "At this level, welcome harmless surprises and leave room for laughter.",
      sultry: "At this level, spontaneity can bring people closer when everyone feels secure.",
      wicked: "At this level, take creative risks without making anyone's comfort the price of admission."
    },
    shadow: %{
      teasing: "At this level, approach difficult feelings with curiosity rather than judgement.",
      sultry: "At this level, vulnerability can become a source of connection when it is freely offered.",
      wicked: "At this level, face the darker corners honestly without confusing intensity with harm."
    },
    forbidden: %{
      teasing: "At this level, enjoy the mystery while remembering that privacy belongs to the people involved.",
      sultry: "At this level, trust turns a secret into something shared rather than something used.",
      wicked: "At this level, challenge expectations by choice, never by violating someone's boundaries."
    }
  }

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

  def prompt(%{card: card}, intensity) do
    card_prompts = Map.get(@intensity_prompts, card.category, %{})
    Map.get(card_prompts, intensity, card.prompt)
  end

  def interpretation(%{card: card, reversed?: true}) do
    card.reversed_meaning || card.meaning
  end

  def interpretation(%{card: card}), do: card.meaning

  def interpretation(entry, intensity) do
    base_meaning = interpretation(entry)
    card_lenses = Map.get(@intensity_lenses, entry.card.category, %{})
    lens = Map.get(card_lenses, intensity)

    if lens do
      base_meaning <> " " <> lens
    else
      base_meaning
    end
  end
end
