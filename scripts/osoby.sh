# Wspólne funkcje dla check.sh i build.sh (dołączane przez `source`).
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OSOBY_YML="$ROOT/work/osoby.yml"

# Wypisuje foldery z osoby.yml w kolejności z pliku.
lista_folderow() {
  sed -nE 's/^([a-z0-9_-]+):[[:space:]]*(.+)$/\1/p' "$OSOBY_YML"
}

# Imię i nazwisko dla folderu (pusto, jeśli folderu nie ma w osoby.yml).
imie_nazwisko() {
  sed -nE "s/^$1:[[:space:]]*(.+)\$/\1/p" "$OSOBY_YML"
}
