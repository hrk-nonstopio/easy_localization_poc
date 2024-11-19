#!/usr/bin/env bash

set -e -o pipefail

tool/generate-localization.sh

dart format --output none --set-exit-if-changed .

flutter analyze

git diff --stat --exit-code
