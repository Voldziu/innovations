# 3. Najlepsze pomysły (zwycięzcy)

Do grupy zwycięzców trafiły dwa pomysły. Do dalszego rozwijania wybraliśmy Słuchacza lasu.

## 3.1. Słuchacz lasu — zwycięzca końcowy

### Opis

Sieć mikrofonów rozstawionych w lesie nasłuchuje otoczenia i rozpoznaje odgłosy zwierząt. Na tej podstawie można szacować liczebność populacji i wyznaczać przybliżone granice ich terytoriów. Dźwięk w lesie niesie się dalej, niż sięga wzrok — kamera nie wykryje zwierzęcia zasłoniętego przez drzewa, a mikrofon je usłyszy. System wykrywa także anomalie, takie jak odgłosy nielegalnej wycinki (piły, ciężki sprzęt) czy dźwięki pożaru.

### Rozwiązywany problem

Monitorowanie kondycji i ogólnego dobrostanu lasu jest kosztowne i wymaga dużych nakładów pracy w terenie. Słuchacz lasu pozwala prowadzić je w sposób ciągły, zdalny i tańszy niż obserwacja wizualna.

### Plan realizacji

1. Rozmawiamy z leśnikami i pracownikami parku narodowego, żeby dowiedzieć się, jak dziś liczą zwierzęta i wykrywają nielegalną wycinkę oraz pożary i ile ich to kosztuje.

2. Zbieramy nagrania z lasu z publicznych baz odgłosów zwierząt i z własnych nagrań, a potem oznaczamy na nich głosy zwierząt, piły i odgłosy ognia.

3. Trenujemy model rozpoznający dźwięki, zaczynając od kilku popularnych gatunków i odgłosu piły łańcuchowej.

4. Budujemy prototyp czujnika: mikrofon, mały komputer, bateria z panelem słonecznym i wodoodporna obudowa.

5. Testujemy kilka czujników na małym kawałku lasu i sprawdzamy, jak daleko słyszą mikrofony i ile jest fałszywych alarmów.

6. Robimy aplikację z mapą, na której widać wykryte zwierzęta, a leśniczy dostaje powiadomienie o wycince lub pożarze.

7. Przeprowadzamy pilotaż w wybranym nadleśnictwie lub parku narodowym przez jeden sezon i porównujemy wyniki z tradycyjnym liczeniem zwierząt.

8. Staramy się o finansowanie wdrożenia przez Lasy Państwowe, które i tak wydają pieniądze na monitoring lasu i ochronę przeciwpożarową, a dodatkowo o granty na ochronę środowiska.

9. Załatwiamy zgody na montaż czujników i rozwiązujemy problem nagrywania ludzi (RODO), np. przez automatyczne usuwanie fragmentów z mową.

10. Rozszerzamy system na kolejne nadleśnictwa i sprzedajemy go jako abonament obejmujący czujniki, serwis i aplikację.

## 3.2. Odstraszacz szkodników

### Opis

System wizyjny (computer vision) wykrywa szkodniki wokół domu lub uprawy, a następnie system generuje odpowiednio dobrany dźwięk odstraszający dany gatunek. To bardziej ekologiczna alternatywa dla trutek i ogrodzeń.

### Rozwiązywany problem

Niszczenie roślinności przez szkodniki, szczególnie na ogródkach działkowych i w ogrodach domów jednorodzinnych.

### Plan realizacji

1. Robimy ankietę wśród działkowców i właścicieli ogrodów, żeby sprawdzić, jakie zwierzęta najczęściej niszczą im rośliny (np. sarny, dziki, zające, kuny, ptaki).

2. Sprawdzamy, jakie dźwięki skutecznie odstraszają poszczególne gatunki (np. odgłosy drapieżników, sygnały alarmowe), a przy tym nie robią im krzywdy.

3. Zbieramy zdjęcia i nagrania wideo szkodników z gotowych zbiorów danych i z kamer w ogrodach znajomych.

4. Trenujemy model computer vision rozpoznający gatunek zwierzęcia w dzień i w nocy (kamera z podczerwienią).

5. Przygotowujemy bibliotekę dźwięków dobranych do każdego gatunku i zmieniamy je losowo, żeby zwierzęta się do nich nie przyzwyczaiły.

6. Budujemy prototyp: kamera, głośnik, mały komputer i zasilanie z panelu słonecznego.

7. Testujemy urządzenie przez sezon na kilku działkach i porównujemy szkody z okresem bez urządzenia.

8. Robimy aplikację na telefon z powiadomieniami, statystykami i trybem cichym, żeby nie przeszkadzać sąsiadom w nocy.

9. Sprzedajemy urządzenie przez internet i w sklepach ogrodniczych, z opcjonalnym abonamentem na aktualizacje dźwięków i modelu.

10. Jeśli sprawdzi się w ogrodach, rozszerzamy ofertę na gospodarstwa rolne i sady.

