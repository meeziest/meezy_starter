#!/bin/bash
# Clean the main Flutter project
flutter clean

# Clean each package
for dir in core/*; do
  if [ -f "$dir/pubspec.yaml" ]; then
    pushd $dir || exit
    flutter clean
    popd || exit
  fi
done

for dir in features/*; do
  if [ -f "$dir/pubspec.yaml" ]; then
    pushd $dir || exit
    flutter clean
    popd || exit
  fi
done