# Sinful Oracle

**Confess your desires. Tempt your fate.**

> [!NOTE]
> **Artwork status:** Any AI-generated images currently shown in this repository are temporary placeholders only. They are not intended to represent the project's final visual identity or artwork.

## Looking for artists 🖤

![AI-generated temporary placeholder banner — seeking human artist contributions](priv/static/images/sinful-oracle-banner-placeholder.png)

We would love to collaborate with human artists to create original artwork for **Sinful Oracle**.

We're especially interested in artists who enjoy gothic, occult, dark-romantic, queer, and tarot-inspired visual styles. Potential contributions include:

- A distinctive project logo and repository banner
- Original tarot card illustrations and card backs
- Website illustrations, ornaments, and visual details

**Human-made artwork is the goal for the finished project.** All AI-generated images currently in the repository are placeholders and will be replaced as original artwork becomes available.

If you're interested, please open an issue or start a discussion before creating work, so we can agree on the brief, attribution, licensing, and how the artwork will be used. Contributions should be original work, or work you have the rights to share under an agreed license. Artists will always be credited.


Sinful Oracle is a gothic, queer-inclusive, adult-themed fictional oracle built with Elixir, Phoenix, and LiveView.

## Principles

- Every sexual character is an adult (18+).
- Trans-inclusive: gender identity, pronouns, and body descriptions are independent.
- Consent and boundaries are treated as essential.
- Kink and power dynamics are opt-in.
- The cards are creative prompts, not predictions or advice.

## Requirements

- Elixir 1.15+
- Erlang/OTP 26+
- Hex package manager

## Run locally

```bash
mix local.hex --force
mix deps.get
mix compile
mix phx.server
```

Open <http://localhost:4000>.

## Run tests

```bash
mix test
```

## Current implementation

- Phoenix LiveView landing and reading interface
- Local tarot-inspired starter deck
- Category filtering and randomized card draws
- Upright/reversed interpretations
- Fictional adult character model with age validation
- Basic consent preference model
- ExUnit tests for the core modules

## Roadmap

1. Persist readings and favorites with Ecto/PostgreSQL.
2. Add multi-card spreads (Past / Present / Temptation).
3. Build a richer character creator and pronoun presets.
4. Add user-defined boundaries and content warnings to prompt filtering.
5. Add a curated, versioned prompt library with intensity tiers.
6. Add accounts, private reading history, and export.
7. Add accessibility, security, and deployment documentation.

## Content note

This project is intended for adults. It should not be used to generate sexual content involving minors, coercion, or non-consensual scenarios. Fictional prompts should preserve adult status and clear consent.

## License

MIT — see `LICENSE`.
