#!/bin/bash
# Get workspace dependencies
fvm flutter pub get

# For each package in 'core/' that uses build_runner, run code generation
for dir in core/*; do
    if [ -f "$dir/pubspec.yaml" ]; then
        if grep -q build_runner "$dir/pubspec.yaml"; then
            pushd $dir || exit
            fvm dart run build_runner build --delete-conflicting-outputs
            popd || exit
        fi
    fi
done

for dir in features/*; do
    if [ -f "$dir/pubspec.yaml" ]; then
        if grep -q build_runner "$dir/pubspec.yaml"; then
            pushd $dir || exit
            fvm dart run build_runner build --delete-conflicting-outputs
            popd || exit
        fi
    fi
done