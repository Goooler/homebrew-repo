# GitHub Copilot Custom Instructions for Goooler's Homebrew Repo

This is a Homebrew tap repository for macOS casks and formulas. When reviewing code or providing suggestions, follow the
comprehensive guidelines in [CONTRIBUTING.md](../CONTRIBUTING.md).

## Key Requirements

- **Every new cask or formula MUST update README.md** with the package in alphabetical order
- **All entries must maintain strict alphabetical ordering** (package names and reference links)
- **All contributions must pass Homebrew style and audit checks** (`brew style --fix` and `brew audit --strict`)
- **Reference files**: `Casks/any-portal.rb` (universal binary), `Casks/clash-mac.rb` (architecture-specific),
  `Formula/string-res-exporter.rb` (formula example)

See [CONTRIBUTING.md](../CONTRIBUTING.md) for detailed requirements, templates, testing procedures, and common mistakes
to avoid.
