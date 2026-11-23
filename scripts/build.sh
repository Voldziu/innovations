#!/usr/bin/env bash
# Składa dokument z docs/src/*.md i work/<osoba>/ i generuje docs/final_doc.pdf.
# Wymaga: pandoc >= 3.1.2 i typst  (macOS: brew install pandoc typst)
#
# Użycie: ./scripts/build.sh
set -euo pipefail
source "$(dirname "$0")/osoby.sh"

BUILD="$ROOT/build"
WYNIK="$ROOT/docs/final_doc.pdf"
rm -rf "$BUILD" && mkdir -p "$BUILD"

# --- Sekcja 4: prompt i odpowiedź każdej osoby, w kolejności z osoby.yml ---
sekcja4="$BUILD/04b_wygenerowane.md"
: > "$sekcja4"
n=0
while read -r f; do
  n=$((n + 1))
  prompt="$ROOT/work/$f/prompt.txt"
  output="$ROOT/work/$f/output.md"
  {
    printf '\n## 4.%d. %s\n\n' "$n" "$(imie_nazwisko "$f")"
    printf '### Prompt\n\n'
    if [[ -s "$prompt" ]]; then
      # Dosłownie, jako blok kodu: tagi typu <rola> nie zostaną potraktowane jak HTML.
      printf '~~~~~~~~~~ {.text}\n'; cat "$prompt"; printf '\n~~~~~~~~~~\n\n'
    else
      printf '**[BRAK — prompt nie został jeszcze oddany]**\n\n'
    fi
    printf '### Wygenerowana odpowiedź\n\n'
    if [[ -s "$output" ]]; then
      # Bez indeksów dolnych/górnych (~ i ^ w adresach URL zostają zwykłymi znakami);
      # listy działają też bez pustej linii przed nimi, jak w GitHub Markdown.
      # Nagłówki z odpowiedzi modelu schodzą o 3 poziomy (# -> ####),
      # żeby nie mieszały się ze strukturą dokumentu.
      pandoc -f markdown-subscript-superscript+lists_without_preceding_blankline -t markdown --wrap=preserve --shift-heading-level-by=3 "$output"
      printf '\n'
    else
      printf '**[BRAK — odpowiedź nie została jeszcze oddana]**\n\n'
    fi
  } >> "$sekcja4"
done < <(lista_folderow)

# --- Złożenie całości: 01..04, wygenerowana sekcja 4, potem reszta ---
zrodla=()
for plik in "$ROOT"/docs/src/*.md; do
  zrodla+=("$plik")
  [[ "$(basename "$plik")" == 04_* ]] && zrodla+=("$sekcja4")
done

pandoc "${zrodla[@]}" -o "$BUILD/dokument.md" -t markdown --standalone
pandoc "$BUILD/dokument.md" -o "$WYNIK" --pdf-engine=typst
echo "Gotowe: ${WYNIK#$ROOT/}"
