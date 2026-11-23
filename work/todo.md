# Co masz zrobić — instrukcja dla grupy

Każdy z nas przygotowuje własny prompt dla modelu AI i zapisuje jego odpowiedź. Dokument końcowy (`docs/final_doc.pdf`) składa się sam po zmergowaniu PR-a — nie edytuj go ręcznie.

## Twój folder

| Osoba | Folder i nazwa brancha |
|---|---|
| Mikołaj Olesiński | `mikolajo` |
| Dominik Czech | `dominik` |
| Jędrzej Kocięcki | `jedrek` |
| Wiktoria Mróz | `wiktoria` |
| Aleksandra Hendrysiak | `ola` |
| Bartosz Procki | `bartosz` |

W instrukcji poniżej zamień `<folder>` na swój folder z tabeli.

## Kroki

1. Zaakceptuj zaproszenie do repozytorium `Voldziu/innovations`, które przyszło na maila z GitHuba.

2. Pobierz repozytorium i utwórz swój branch:

   ```bash
   git clone https://github.com/Voldziu/innovations.git
   cd innovations
   git checkout -b <folder>
   ```

3. Wklej swój prompt do `work/<folder>/prompt.txt`.

4. Wklej odpowiedź modelu do `work/<folder>/output.md`. Na samej górze pliku dodaj linię z nazwą modelu i datą, np.:

   ```
   > Model: GPT-5 · Data: 2026-11-24
   ```

5. (Opcjonalnie) sprawdź, czy wszystko jest w porządku:

   ```bash
   ./scripts/check.sh <folder>
   ```

6. Zacommituj, wypchnij i otwórz Pull Request do `main`:

   ```bash
   git add work/<folder>
   git commit -m "Prompt i odpowiedź — <folder>"
   git push -u origin <folder>
   ```

   Potem na GitHubie kliknij **Compare & pull request**.

Po otwarciu PR-a automat sprawdzi Twoje pliki. Jeśli coś jest nie tak, PR dostanie czerwony krzyżyk, a w szczegółach będzie po polsku napisane, co poprawić. Podgląd PDF-a z Twoją częścią znajdziesz w zakładce **Checks** → **Dokument** → **Artifacts**.

## Wymagania

- Zmieniasz tylko pliki w swoim folderze `work/<folder>/`.
- `output.md` zawiera **pełną** odpowiedź modelu, bez skracania.
- W pierwszych 10 liniach `output.md` jest linia z `Model:` i datą w formacie `RRRR-MM-DD`.
- Prompt ma rolę (kim ma być model), kontekst (problem, Voice AI, ekologia, nasz pomysł), zadanie i oczekiwany format odpowiedzi.
- Nie kopiuj promptu z `work/mikolajm/` — wymyśl własne podejście, żeby było co porównywać.
