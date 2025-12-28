# Homebrew Development Scripts

This directory contains scripts for running Homebrew development commands on this tap repository.

## Available Scripts

### typecheck.sh

Run `brew typecheck` to verify types are declared correctly using Sorbet.

```bash
./scripts/typecheck.sh
```

**Note:** Individual files/directories cannot be checked with typecheck. `brew typecheck` is fast enough to just be run globally every time.

### style.sh

Run `brew style --fix --changed` to lint code formatting using RuboCop.

```bash
# Check and fix changed files
./scripts/style.sh

# Check and fix specific files
./scripts/style.sh Formula/string-res-exporter.rb
./scripts/style.sh Casks/clash-mac.rb
```

Individual files can be checked/fixed by passing them as arguments.

### tests.sh

Run `brew tests --online --changed` to ensure that RSpec unit tests are passing.

```bash
# Run tests on changed files
./scripts/tests.sh

# Run specific tests with --only flag
./scripts/tests.sh --only=cmd/reinstall
```

**Note:** Some online tests may be flaky and can be ignored if they pass on a rerun.

## Using with brew-mcp-server

All of these scripts can be run through the `brew-mcp-server` for automated testing and validation.
