
defmodule SinfulOracleWeb.OracleLive do
  use Phoenix.LiveView

  alias SinfulOracle.Oracle.{Deck, Reading}

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:category, :all)
     |> assign(:intensity, :sultry)
     |> assign(:reading, [])
     |> assign(:drawn?, false)
     |> assign(:categories, Deck.categories())}
  end

  @impl true
  def handle_event("category", %{"category" => category}, socket) do
    selected =
      Enum.find_value(Deck.categories(), socket.assigns.category, fn {_label, value} ->
        if Atom.to_string(value) == category, do: value
      end)

    {:noreply, assign(socket, :category, selected)}
  end

  def handle_event("intensity", %{"intensity" => intensity}, socket) do
    selected =
      Enum.find(Reading.intensities(), socket.assigns.intensity, fn value ->
        Atom.to_string(value) == intensity
      end)

    {:noreply, assign(socket, :intensity, selected)}
  end

  def handle_event("draw", _params, socket) do
    reading = Reading.draw(socket.assigns.category, 3)

    {:noreply,
     socket
     |> assign(:reading, reading)
     |> assign(:drawn?, true)}
  end

  def handle_event("reset", _params, socket) do
    {:noreply,
     socket
     |> assign(:reading, [])
     |> assign(:drawn?, false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <main class="page-shell">
      <header class="topbar">
        <a class="wordmark" href="/">SIN<em>FUL</em> ORACLE</a>
        <span class="age-mark">18+ · FICTIONAL ADULT CONTENT</span>
      </header>

      <section class="hero">
        <p class="eyebrow">✦ THE DECK IS WAITING ✦</p>
        <h1>Confess your <span>desires.</span><br />Tempt your fate.</h1>
        <p class="intro">
          A queer-inclusive, gothic oracle for curious minds and wicked imaginations.
          The cards offer fiction, not prophecy. Your boundaries are sacred.
        </p>
      </section>

      <section class="oracle-panel">
        <div class="panel-heading">
          <span class="eyebrow">YOUR PRIVATE READING</span>
          <span class="ornament">☽ ✦ ☾</span>
        </div>

        <form phx-change="category" class="control-group">
          <label for="category">Choose your omen</label>
          <select id="category" name="category">
            <option
              :for={{label, value} <- @categories}
              value={value}
              selected={value == @category}
            >
              {label}
            </option>
          </select>
        </form>

        <form phx-change="intensity" class="control-group">
          <label for="intensity">Set the temperature</label>
          <select id="intensity" name="intensity">
            <option value="teasing" selected={@intensity == :teasing}>
              Teasing · playful sparks
            </option>
            <option value="sultry" selected={@intensity == :sultry}>
              Sultry · slow-burn tension
            </option>
            <option value="wicked" selected={@intensity == :wicked}>
              Wicked · adult themes
            </option>
          </select>
        </form>

        <div class="actions">
          <button class="draw-button" phx-click="draw">
            Draw your three cards <span>↗</span>
          </button>
          <button :if={@drawn?} class="reset-button" phx-click="reset">
            Clear reading
          </button>
        </div>

        <section :if={@drawn?} class="reading-result" aria-live="polite">
          <p class="eyebrow">✦ THE ORACLE HAS SPOKEN ✦</p>

          <p class="spread-intro">
            Three cards. Three moments. One story waiting to unfold.
          </p>

          <div class="spread-grid">
            <article
              :for={entry <- @reading}
              class="oracle-card"
              data-position={entry.position}
            >
              <p class="card-position">
                {Reading.position_label(entry.position)}
              </p>

              <div class="card-symbol">✧</div>

              <p class="card-category">
                {entry.card.category |> Atom.to_string() |> String.upcase()}
              </p>

              <h2>{entry.card.name}</h2>

              <p class="card-meaning">
                {Reading.interpretation(entry, @intensity)}
              </p>

              <div class="card-divider">✦</div>

              <p class="prompt-label">YOUR FICTIONAL PROMPT</p>

              <p class="card-prompt">{Reading.prompt(entry, @intensity)}</p>

              <p class="reversed" :if={entry.reversed?}>
                REVERSED · Read the shadow, too.
              </p>
            </article>
          </div>

          <div class="intensity-guidance">
            <p class="intensity-note">
              Reading intensity: {Reading.intensity_label(@intensity)}
            </p>
            <p>{Reading.intensity_guidance(@intensity)}</p>
          </div>

          <button class="draw-button secondary" phx-click="draw">
            Draw again ↻
          </button>
        </section>
      </section>

      <footer>
        <p>Made for every shade of becoming. <span>♡</span></p>
        <small>
          All characters and scenarios are fictional adults. Consent is not optional.
        </small>
      </footer>
    </main>
    """
  end
end
