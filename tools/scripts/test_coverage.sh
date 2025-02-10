#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Find directories with a pubspec.yaml and test folder
find_test_dirs() {
  find . -type f -name "pubspec.yaml" -exec dirname {} \; | while read -r dir; do
    if [ -d "$dir/test" ]; then
      echo "$dir"
    fi
  done
}

test_dirs=$(find_test_dirs)
if [ -n "$test_dirs" ]; then
  flutter test $test_dirs --no-pub --coverage
else
  echo "No directories with pubspec.yaml and a test/ folder found."
fi
