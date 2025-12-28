#!/bin/bash
# Run brew style --fix --changed to lint code formatting using RuboCop.
# Individual files can be checked/fixed by passing them as arguments
# e.g., brew style --fix Library/Homebrew/cmd/reinstall.rb

set -eu

if [ $# -eq 0 ]; then
    echo "Running brew style --fix --changed..."
    brew style --fix --changed
else
    echo "Running brew style --fix on specified files: $@"
    brew style --fix "$@"
fi
