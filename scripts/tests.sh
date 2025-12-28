#!/bin/bash
# Run brew tests --online --changed to ensure that RSpec unit tests are passing.
# Individual test files can be passed with --only
# e.g., to test Library/Homebrew/cmd/reinstall.rb with Library/Homebrew/test/cmd/reinstall_spec.rb
# run brew tests --only=cmd/reinstall

set -eu

if [ $# -eq 0 ]; then
    echo "Running brew tests --online --changed..."
    brew tests --online --changed
else
    echo "Running brew tests with custom arguments: $@"
    brew tests "$@"
fi
