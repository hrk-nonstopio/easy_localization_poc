#!/usr/bin/env bash

set -e -o pipefail

dart run easy_localization:generate

# source_gen not used
# Reference: https://pub.dev/packages/source_gen#ignore_for_file
if ! grep constant_identifier_names lib/generated/codegen_loader.g.dart &> /dev/null; then
  sed -i \
    '/ignore_for_file/ s/$/, constant_identifier_names/' \
    lib/generated/codegen_loader.g.dart
fi

dart run easy_localization:generate \
  -f keys \
  -o locale_keys.g.dart

dart format \
  lib/generated/
