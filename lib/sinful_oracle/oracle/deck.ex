defmodule SinfulOracle.Oracle.Deck do
  @moduledoc "The starter deck for Sinful Oracle."

  alias SinfulOracle.Oracle.Card

  @cards [
    %Card{
      id: :the_velvet_key,
      name: "The Velvet Key",
      category: :temptation,
      meaning: "An invitation is not an obligation. Curiosity can open doors; your boundaries decide which ones stay open.",
      prompt: "Write a scene where two adult strangers exchange a daring invitation, then negotiate what would make the evening feel exciting and safe.",
      reversed_meaning: "Pause before accepting an invitation that asks you to abandon your own comfort."
    },
    %Card{
      id: :the_blooming_mirror,
      name: "The Blooming Mirror",
      category: :identity,
      meaning: "You are allowed to become more yourself, loudly, softly, or in ways nobody else understands.",
      prompt: "Describe an adult protagonist choosing an outfit, name, or expression that makes them feel unmistakably at home in themselves.",
      reversed_meaning: "Do not let someone else's gaze become the measure of your worth."
    },
    %Card{
      id: :the_midnight_oath,
      name: "The Midnight Oath",
      category: :romance,
      meaning: "Trust is built in the small promises people keep when nobody is watching.",
      prompt: "Create a charged romantic moment between consenting adults. Let honesty and mutual anticipation carry the tension.",
      reversed_meaning: "A promise without respect is only decoration."
    },
    %Card{
      id: :the_wild_candle,
      name: "The Wild Candle",
      category: :chaos,
      meaning: "A little disorder can be delightful when everyone has room to laugh and opt out.",
      prompt: "Invent a mischievous midnight dare for a group of adult friends. Make it playful, consensual, and gloriously inconvenient.",
      reversed_meaning: "Chaos is only fun when everyone can leave the game."
    },
    %Card{
      id: :the_black_rose,
      name: "The Black Rose",
      category: :shadow,
      meaning: "Desire and vulnerability can share a room. Neither needs to disguise itself as the other.",
      prompt: "Write a gothic confession between adult characters who are honest about their fears, desires, and limits.",
      reversed_meaning: "Mystery should never be used to conceal a breach of trust."
    },
    %Card{
      id: :the_silver_tongue,
      name: "The Silver Tongue",
      category: :forbidden,
      meaning: "Words can tease, reveal, and transform. The most compelling secret is one freely shared.",
      prompt: "Write a flirtatious exchange between consenting adults where wit, restraint, and clear mutual interest create the spark.",
      reversed_meaning: "Silence is not consent; ask rather than assume."
    }
  ]

  def all, do: @cards

  def categories do
    [
      {"All", :all},
      {"Temptation", :temptation},
      {"Romance", :romance},
      {"Forbidden", :forbidden},
      {"Chaos", :chaos},
      {"Identity", :identity},
      {"Shadow", :shadow}
    ]
  end

  def by_category(:all), do: all()
  def by_category(category), do: Enum.filter(all(), &(&1.category == category))
end
