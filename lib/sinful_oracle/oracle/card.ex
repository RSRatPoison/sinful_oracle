defmodule SinfulOracle.Oracle.Card do
  @moduledoc """
  A tarot-inspired oracle card. Cards are fictional prompts, not predictions.
  """

  @enforce_keys [:id, :name, :category, :meaning, :prompt]
  defstruct [:id, :name, :category, :meaning, :prompt, :reversed_meaning]

  @type t :: %__MODULE__{
          id: atom(),
          name: String.t(),
          category: atom(),
          meaning: String.t(),
          prompt: String.t(),
          reversed_meaning: String.t() | nil
        }
end
