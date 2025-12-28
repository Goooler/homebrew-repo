#!/bin/bash
# Run brew typecheck to verify types are declared correctly using Sorbet.
# Individual files/directories cannot be checked.
# brew typecheck is fast enough to just be run globally every time.

set -e

echo "Running brew typecheck..."
brew typecheck
