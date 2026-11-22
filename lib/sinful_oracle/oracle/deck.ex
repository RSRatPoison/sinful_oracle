
defmodule SinfulOracle.Oracle.Deck do
  @moduledoc "The gothic, queer-inclusive starter deck for Sinful Oracle."

  alias SinfulOracle.Oracle.Card

  @cards [
    # TEMPTATION
    %Card{
      id: :the_velvet_key,
      name: "The Velvet Key",
      category: :temptation,
      meaning: "An invitation is not an obligation. Curiosity can open doors; your boundaries decide which ones stay open.",
      prompt: "Write a scene where two adult strangers exchange a daring invitation, then negotiate what would make the evening feel exciting and safe.",
      reversed_meaning: "Pause before accepting an invitation that asks you to abandon your own comfort."
    },
    %Card{
      id: :the_crimson_hour,
      name: "The Crimson Hour",
      category: :temptation,
      meaning: "An opportunity is approaching, but its timing matters as much as its promise.",
      prompt: "Write about an adult protagonist deciding whether to accept an unexpected invitation before midnight.",
      reversed_meaning: "Not every opportunity deserves an immediate answer."
    },
    %Card{
      id: :the_satin_flame,
      name: "The Satin Flame",
      category: :temptation,
      meaning: "Desire can be powerful without becoming a command. You remain the keeper of your own choices.",
      prompt: "Create a scene where two adults acknowledge a mutual attraction and decide how far they want to take it.",
      reversed_meaning: "Intensity is not proof that something is right for you."
    },
    %Card{
      id: :the_open_door,
      name: "The Open Door",
      category: :temptation,
      meaning: "A new possibility appears when you stop assuming every threshold leads somewhere familiar.",
      prompt: "Describe an adult character discovering an unexpected opportunity and considering its possibilities.",
      reversed_meaning: "You are allowed to close a door, even after opening it."
    },

    # IDENTITY
    %Card{
      id: :the_blooming_mirror,
      name: "The Blooming Mirror",
      category: :identity,
      meaning: "You are allowed to become more yourself, loudly, softly, or in ways nobody else understands.",
      prompt: "Describe an adult protagonist choosing an outfit, name, or expression that makes them feel unmistakably at home in themselves.",
      reversed_meaning: "Do not let someone else's gaze become the measure of your worth."
    },
    %Card{
      id: :the_chosen_name,
      name: "The Chosen Name",
      category: :identity,
      meaning: "The words you choose for yourself can become an anchor in a changing world.",
      prompt: "Write a scene where an adult character introduces themselves by a name that feels true to them.",
      reversed_meaning: "You do not owe anyone an explanation for who you are."
    },
    %Card{
      id: :the_many_masks,
      name: "The Many Masks",
      category: :identity,
      meaning: "You contain multitudes. Different expressions of yourself do not make any of them false.",
      prompt: "Describe an adult protagonist exploring different styles of self-expression and discovering what each reveals.",
      reversed_meaning: "You may put down any role that no longer feels like yours."
    },
    %Card{
      id: :the_unwritten_self,
      name: "The Unwritten Self",
      category: :identity,
      meaning: "Your story is still yours to write. You are not limited by the version others remember.",
      prompt: "Create a turning point where an adult character chooses a future that reflects who they are becoming.",
      reversed_meaning: "You do not have to reinvent yourself to deserve acceptance."
    },

    # ROMANCE
    %Card{
      id: :the_midnight_oath,
      name: "The Midnight Oath",
      category: :romance,
      meaning: "Trust is built in the small promises people keep when nobody is watching.",
      prompt: "Create a charged romantic moment between consenting adults. Let honesty and mutual anticipation carry the tension.",
      reversed_meaning: "A promise without respect is only decoration."
    },
    %Card{
      id: :the_last_dance,
      name: "The Last Dance",
      category: :romance,
      meaning: "Some moments become precious because you choose to be fully present for them.",
      prompt: "Write a scene where two adults share a dance and discover something neither expected to say aloud.",
      reversed_meaning: "Nostalgia should not persuade you to return to something that hurt you."
    },
    %Card{
      id: :the_written_letter,
      name: "The Written Letter",
      category: :romance,
      meaning: "Honest words can reach places that charm alone cannot.",
      prompt: "Describe an adult character writing a letter they are uncertain whether they should send.",
      reversed_meaning: "A message left unsent may be an act of self-respect."
    },
    %Card{
      id: :the_shared_silence,
      name: "The Shared Silence",
      category: :romance,
      meaning: "Closeness does not always need an audience or an explanation.",
      prompt: "Write a quiet scene between adults whose comfort with one another says more than conversation could.",
      reversed_meaning: "Silence should feel safe, not like something you are forced to endure."
    },

    # CHAOS
    %Card{
      id: :the_wild_candle,
      name: "The Wild Candle",
      category: :chaos,
      meaning: "A little disorder can be delightful when everyone has room to laugh and opt out.",
      prompt: "Invent a mischievous midnight dare for a group of adult friends. Make it playful, consensual, and gloriously inconvenient.",
      reversed_meaning: "Chaos is only fun when everyone can leave the game."
    },
    %Card{
      id: :the_broken_compass,
      name: "The Broken Compass",
      category: :chaos,
      meaning: "Losing your usual direction may reveal a path you would never have chosen deliberately.",
      prompt: "Send an adult protagonist on an unexpected detour that becomes the beginning of a strange adventure.",
      reversed_meaning: "Being lost is not always romantic. Stop and find your bearings when you need to."
    },
    %Card{
      id: :the_dancing_shadow,
      name: "The Dancing Shadow",
      category: :chaos,
      meaning: "Not everything needs to be controlled. Sometimes the unexpected deserves a little room.",
      prompt: "Write a scene where an adult character's carefully planned evening becomes delightfully unpredictable.",
      reversed_meaning: "Do not mistake constant disruption for freedom."
    },
    %Card{
      id: :the_lucky_accident,
      name: "The Lucky Accident",
      category: :chaos,
      meaning: "A mistake can become an opening when you meet it with curiosity instead of shame.",
      prompt: "Create an amusing accident that brings a group of adult strangers together.",
      reversed_meaning: "You can learn from a mistake without pretending it was meant to happen."
    },

    # SHADOW
    %Card{
      id: :the_black_rose,
      name: "The Black Rose",
      category: :shadow,
      meaning: "Desire and vulnerability can share a room. Neither needs to disguise itself as the other.",
      prompt: "Write a gothic confession between adult characters who are honest about their fears, desires, and limits.",
      reversed_meaning: "Mystery should never be used to conceal a breach of trust."
    },
    %Card{
      id: :the_hollow_crown,
      name: "The Hollow Crown",
      category: :shadow,
      meaning: "A role that once protected you may now be keeping you from being known.",
      prompt: "Describe an adult character questioning an identity or reputation they have spent years maintaining.",
      reversed_meaning: "You do not need to destroy yourself to escape an old expectation."
    },
    %Card{
      id: :the_silent_bell,
      name: "The Silent Bell",
      category: :shadow,
      meaning: "An unspoken truth can still shape every room it enters.",
      prompt: "Write a tense but compassionate conversation where two adults finally address something they have avoided.",
      reversed_meaning: "You are allowed to speak before silence becomes resentment."
    },
    %Card{
      id: :the_thorned_path,
      name: "The Thorned Path",
      category: :shadow,
      meaning: "Growth can be uncomfortable. Difficulty alone does not mean you are moving in the wrong direction.",
      prompt: "Create a gothic journey in which an adult protagonist confronts a fear they have long avoided.",
      reversed_meaning: "Suffering is not a requirement for becoming stronger."
    },

    # FORBIDDEN
    %Card{
      id: :the_silver_tongue,
      name: "The Silver Tongue",
      category: :forbidden,
      meaning: "Words can tease, reveal, and transform. The most compelling secret is one freely shared.",
      prompt: "Write a flirtatious exchange between consenting adults where wit, restraint, and clear mutual interest create the spark.",
      reversed_meaning: "Silence is not consent; ask rather than assume."
    },
    %Card{
      id: :the_hidden_script,
      name: "The Hidden Script",
      category: :forbidden,
      meaning: "There is a difference between a secret that protects you and one that controls you.",
      prompt: "Write a mystery involving adults who must decide which truths they are ready to reveal.",
      reversed_meaning: "A secret should not become a weapon against someone."
    },
    %Card{
      id: :the_locked_library,
      name: "The Locked Library",
      category: :forbidden,
      meaning: "Knowledge often waits behind the questions you have been afraid to ask.",
      prompt: "Describe an adult protagonist discovering a hidden collection of letters that changes their understanding of the past.",
      reversed_meaning: "Curiosity does not grant permission to violate another person's privacy."
    },
    %Card{
      id: :the_unspoken_rule,
      name: "The Unspoken Rule",
      category: :forbidden,
      meaning: "Rules deserve examination. Some protect people; others merely preserve expectations.",
      prompt: "Create a story where consenting adults question an old tradition and decide together what should replace it.",
      reversed_meaning: "Breaking a rule is not automatically an act of courage."
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
