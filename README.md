# Sinful Oracle

**Confess your desires. Tempt your fate.**

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
