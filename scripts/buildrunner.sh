#!/bin/bash

set -e

cd "$(dirname "$0")/.."

echo "🏗️ Running build_runner in root..."
flutter pub get

if grep -q "build_runner" pubspec.yaml; then
  flutter pub run build_runner build --delete-conflicting-outputs
else
  echo "⚠️ Root project does not use build_runner, skipping."
fi

echo ""
echo "🔍 Scanning all packages..."

find packages -type f -name "pubspec.yaml" | while read pubspec; do
  dir=$(dirname "$pubspec")

  if grep -q "build_runner" "$pubspec"; then
    echo "📦 Running build_runner in $dir"
    (
      cd "$dir"
      flutter pub get
      flutter pub run build_runner build --delete-conflicting-outputs
    )
  else
    echo "🚫 Skipping $dir (no build_runner)"
  fi
done

echo ""
echo "✅ All build_runner jobs done."
