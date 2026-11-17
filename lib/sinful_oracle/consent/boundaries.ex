defmodule SinfulOracle.Consent.Boundaries do
  @moduledoc """
  Lightweight preference model for fictional prompt generation.

  This is not a substitute for real-world consent. It filters optional
  prompt themes before content is presented.
  """

  @enforce_keys [:allow_kink, :allow_power_dynamics]
  defstruct allow_kink: false, allow_power_dynamics: false

  @type t :: %__MODULE__{
          allow_kink: boolean(),
          allow_power_dynamics: boolean()
        }

  def new(attrs \\ %{}) do
    %__MODULE__{
      allow_kink: Map.get(attrs, :allow_kink, false),
      allow_power_dynamics: Map.get(attrs, :allow_power_dynamics, false)
    }
  end

  def validate(%__MODULE__{} = preferences), do: {:ok, preferences}
end
