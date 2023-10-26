#!/bin/sh

flutter pub run build_runner build --delete-conflicting-outputs

cd packages/hikki_localization && flutter pub run easy_localization:generate -S assets/l10n -f keys -O lib/l10n -o locale_keys.g.dart