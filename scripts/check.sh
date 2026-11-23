#!/usr/bin/env bash
# Sprawdza, czy prompt.txt i output.md danej osoby spełniają wymagania.
#
# Użycie:
#   ./scripts/check.sh <folder> [<folder>...]   np. ./scripts/check.sh jedrek
#   ./scripts/check.sh --zmienione <gałąź>       foldery zmienione względem gałęzi (używa CI)
set -euo pipefail
source "$(dirname "$0")/osoby.sh"

if [[ "${1:-}" == "--zmienione" ]]; then
  baza="${2:?Podaj gałąź bazową, np. origin/main}"
  foldery=()
  while read -r f; do foldery+=("$f"); done < <(git -C "$ROOT" diff --name-only "$baza"...HEAD -- work/ \
    | sed -nE 's#^work/([^/]+)/.+#\1#p' | sort -u)
  if [[ ${#foldery[@]} -eq 0 ]]; then
    echo "Brak zmian w work/<osoba>/ — nie ma czego sprawdzać."
    exit 0
  fi
else
  [[ $# -gt 0 ]] || { echo "Użycie: $0 <folder> [<folder>...]"; exit 2; }
  foldery=("$@")
fi

bledy=0
blad() { echo "  ✗ $1"; bledy=$((bledy + 1)); }

for f in "${foldery[@]}"; do
  echo "Sprawdzam work/$f"
  if [[ -z "$(imie_nazwisko "$f")" ]]; then
    blad "folderu '$f' nie ma w work/osoby.yml — użyj swojego folderu z listy"
    continue
  fi
  prompt="$ROOT/work/$f/prompt.txt"
  output="$ROOT/work/$f/output.md"

  [[ -s "$prompt" ]] && grep -q '[^[:space:]]' "$prompt" \
    || blad "work/$f/prompt.txt jest pusty albo go nie ma — wklej swój prompt"

  if [[ -s "$output" ]] && grep -q '[^[:space:]]' "$output"; then
    head -n 10 "$output" | grep -qE 'Model:.*[0-9]{4}-[0-9]{2}-[0-9]{2}' \
      || blad "work/$f/output.md: w pierwszych 10 liniach brakuje linii z modelem i datą, np.
      > Model: Claude Opus 5.5 · Data: 2026-11-24"
  else
    blad "work/$f/output.md jest pusty albo go nie ma — wklej pełną odpowiedź modelu"
  fi
done

if [[ $bledy -gt 0 ]]; then
  echo "Znaleziono błędów: $bledy. Popraw je i wypchnij zmiany jeszcze raz."
  exit 1
fi
echo "Wszystko w porządku ✓"
