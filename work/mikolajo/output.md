> Model: Claude Opus 5.5 (claude-opus-5-5) · Data: 2026-11-23

# Słuchacz lasu: strażnik lasu, który słyszy. Opis i ocena produktu

## 1. Podsumowanie

Słuchacz lasu to sieć małych węzłów akustycznych na drzewach, które same rozpoznają pilarkę, strzał, silnik i głosy ptaków, a do centrali wysyłają tylko informację: co, gdzie i kiedy. Codziennie korzysta z niego leśniczy, a płaci nadleśnictwo albo park narodowy, częściowo z funduszy zewnętrznych. Voice AI jest rdzeniem w dwóch warstwach: rozpoznawanie dźwięków zastępuje oczy tam, gdzie las zasłania widok, a mowa służy leśnikowi za interfejs („co działo się w nocy w sektorze 12?”). Głównym ograniczeniem są fałszywe alarmy po przeniesieniu modelu do nowego lasu: precyzja detektora strzałów spadła z 0,85 do 0,57 na nowym stanowisku [F] (S7). Rekomendujemy wersję „Dyżurny leśnictwa”, czyli alerty o pilarkach i strzałach z obsługą głosem, budowaną od taniego testu wiarygodności wykrywania, a dopiero potem z łącznością w czasie rzeczywistym i modułem przyrodniczym.

## 2. Problem i użytkownicy

Lasy Państwowe (LP) prowadzą 429 nadleśnictw w 17 regionalnych dyrekcjach (RDLP) [F] (S12). Nadleśnictwo to jednostka zarządzająca lasem na danym terenie i dzieli się na leśnictwa, którymi kieruje leśniczy. Na jedno nadleśnictwo przypada średnio ok. 16,5 tys. ha [S] (7,1 mln ha w zarządzie LP / 429 [F] (S12)). Ochrona przeciwpożarowa opiera się na dostrzegalniach i patrolach: w 2022 r. LP miały 711 dostrzegalni i 330 samochodów patrolowych [F] (S12). Wieże, kamery i systemy lokalizacji pożarów rozbudowują projekty unijne: ok. 90 mln zł (S14) oraz ponad 160 mln zł kosztu, w tym blisko 93 mln zł dotacji (S15) [F].

| Użytkownik | Ból | Kto płaci | Jak dziś sobie radzi |
|---|---|---|---|
| Leśniczy (w terenie) | Nie widzi, co dzieje się nocą i w gęstym drzewostanie; o wycince dowiaduje się po fakcie [H] | Nadleśnictwo | Obchody pieszo [H], samochody patrolowe [F] (S12) |
| Nadleśniczy | Ograniczony budżet i ludzie, odpowiedzialność za szkody i pożary, raportowanie do RDLP [H] | Nadleśnictwo, fundusze UE i krajowe (np. nabór LIFE w NFOŚiGW [F] (S21)) | Dostrzegalnie, kamery, patrole [F] (S12, S14) |
| Park narodowy / ekolog | Ręczne liczenia gatunków są drogie i rzadkie [H]; raportowanie dla obszarów Natura 2000 | Park, granty LIFE [F] (S21) | Liczenia terenowe, fotopułapki [H] |
| Inspektor ochrony danych (nie płaci, ale może zablokować) | Ryzyko nagrywania mowy turystów i pracowników | — | Wytyczne EDPB odradzają zbędne nagrywanie dźwięku [F] (S16) |

**Założenia.** (1) Rynek startowy to polskie nadleśnictwa i parki narodowe. (2) Pilotaż ma się zmieścić poniżej progu ustawy Prawo zamówień publicznych (Pzp), który od 2026 r. wynosi 170 000 zł netto [F] (S13). Poniżej tej kwoty zamawiający stosuje własny regulamin [F] (S13). (3) Ceny sprzętu nie zostały znalezione w źródłach, więc wszystkie kwoty jednostkowe to szacunki [S]. (4) System wspiera ludzi i nie zastępuje dostrzegalni ani kamer. (5) Przy sprzecznych danych przyjmujemy wartość mniej korzystną dla produktu.

## 3. Jak działa Słuchacz lasu

**Urządzenie.** Węzeł to mikrokontroler klasy Cortex-M4F z mikrofonem, radiem LoRa i panelem słonecznym. Taki układ uruchamiał już sieć neuronową rozpoznającą pilarkę: 47,6 kB pamięci programu, 54,1 kB RAM, 232 ms na analizę fragmentu dźwięku [F] (S4). Ciągły nasłuch pobierał ok. 29,5 mA [F] (S4), czyli ok. 109 mW (29,5 mA × 3,7 V) i ok. 2,6 Wh na dobę [S]. Akumulator 1800 mAh wystarczył na ok. 61 h [F] (S4), więc panel albo duża bateria są konieczne. Ile energii da panel pod koroną polskiego lasu zimą, trzeba zmierzyć [H].

**Łączność.** LoRa to radio małej mocy i dużego zasięgu, ale w lesie dębowym jego zasięg spadł poniżej 1 km, wobec ponad 8 km w otwartym terenie [F] (S4). Inny pomiar dał ok. 4 km w linii wzroku i ok. 1 km w mieście [F] (S6). Węzły stoją więc w siatce co ok. 1 km, a bramka (odbiornik LoRa podłączony do internetu) stoi wysoko, np. na dostrzegalni [H]. Przy siatce 1 km na jeden węzeł przypada komórka ok. 100 ha [S] (1 km × 1 km); to wynika z zasięgu radia, a nie słyszalności pilarki, którą trzeba zmierzyć [H]. Pokrycie średniego nadleśnictwa wymagałoby ok. 165 węzłów (16 500 ha / 100 ha) [S], dlatego produkt celuje w wybrane miejsca, nie w cały las.

**Przepływ zdarzenia krok po kroku:**
1. Mikrofon nasłuchuje stale, a węzeł co chwilę klasyfikuje krótki fragment dźwięku.
2. Detektor mowy działa jako filtr prywatności. Jeśli wykryje mowę ludzką, fragment jest od razu kasowany.
3. Po rozpoznaniu pilarki lub strzału powyżej progu pewności węzeł wysyła przez LoRa etykietę, czas, pozycję i pewność. Surowego dźwięku nie wysyła.
4. Serwer w Europejskim Obszarze Gospodarczym nanosi zdarzenie na mapę oddziałów leśnych (oddział to stały, numerowany fragment lasu na mapie nadleśnictwa).
5. Leśniczy dostaje powiadomienie na telefon, które system czyta też głosem, i ocenia je jako „prawdziwe” albo „fałszywe”. Te oceny służą do strojenia progu w danym lesie.
6. Rano leśniczy pyta głosem o podsumowanie nocy, a nadleśnictwo dostaje tygodniowe zestawienie.

**Zagadnienia, o które nie pytano.** Lokalizacja źródła wymaga synchronizacji zegarów, które dryfują o 1–10 s na dobę, a GPS bywa zawodny pod okapem [F] (S5). Bez niej pozycja to tylko „w pobliżu węzła X”. Liczy się też serwis (kradzież, wilgoć, baterie), więc roboczogodziny leśniczego są miernikiem pilotażu [H].

## 4. Co słyszy: klasy zdarzeń i zwierząt

| Klasa | Po czym rozpoznać | Wartość | Trudność | Priorytet |
|---|---|---|---|---|
| Pilarka | Głośny, stały dźwięk silnika dwusuwowego o charakterystycznym widmie; ok. 85% trafności, ale tylko na nagraniach z bazy, nie w lesie [F] (S4) | Wysoka | Niska–średnia | 1 |
| Strzał | Krótki impuls; czułość (recall) 0,95 i precyzja 0,85 w walidacji, 0,57 precyzji na nowym stanowisku [F] (S7) | Wysoka | Średnia | 1 |
| Pojazd | Silnik w miejscu bez drogi; RFCx wykrywa silniki, ale nie publikuje skuteczności [F] (S11) | Średnia | Średnia | 2 (tylko dziennik) |
| Ptaki (gatunki) | BirdNET przy progu pewności 0,80: precyzja 0,90, czułość 0,78; przy progu domyślnym 93 „gatunki” zamiast 23 [F] (S2) | Wysoka dla parków | Średnia | 2 |
| Pożar | Trzask palącego się materiału; 90% trafności w małym zbiorze testowym, autorzy uznają zbiór za niereprezentatywny [F] (S8); unijny projekt EU-FIRE nie podaje wyników [F] (S18) | Wysoka | Wysoka | 3 |
| Wilk (wycie) | Lokalizacja wycia z dokładnością 167 ± 308 m po odfiltrowaniu błędnych oszacowań; tylko 17% wyć słyszały ≥4 rejestratory [F] (S9) | Wysoka dla ekologów | Wysoka | 3 |
| Ludzie w strefie zakazu | Kroki, głosy | Średnia | Ryzyko prawne | Poza 1. etapem |
| Wiatrołom, wysypisko | Brak danych o skuteczności; wysypisko nie ma własnego dźwięku [H] | Niska–średnia | Wysoka | Poza 1. etapem |

**Zwierzęta: gatunki, liczebność i terytoria.** Rozpoznawanie gatunków ptaków działa na poziomie zbliżonym do ekspertów, ale tylko po dostrojeniu progu i z weryfikacją części nagrań przez człowieka [F] (S2). Ogólniejsze modele, takie jak Perch 2.0, obejmują wiele grup zwierząt [F] (S1). Liczebności nie da się policzyć wprost z liczby wykryć: pominięcie fałszywych wykryć zawyżało oszacowanie gęstości o 17% [F] (S10). Przy precyzji 0,25, jak w BirdNET z progiem domyślnym (S2), surowa liczba wykryć byłaby zawyżona ok. czterokrotnie [S] (1 / 0,25; przykład ilustracyjny). Dlatego produkt podaje wskaźniki obecności i aktywności gatunków, a nie liczbę osobników. Terytoria da się wyznaczać lokalizacją różnicy czasu dotarcia dźwięku (TDOA) do co najmniej 4 mikrofonów. Typowa dokładność wynosi ok. 5 m w gęstych układach z medianą rozstawu ok. 31 m [F] (S5). To zadanie badawcze, nie funkcja pierwszej wersji.

## 5. Rola Voice AI jako rdzenia

Bez przetwarzania dźwięku produkt przestaje istnieć, bo nie ma żadnego innego czujnika. Słuch daje to, czego nie dają alternatywy: działa w nocy, we mgle i za drzewami. RFCx deklaruje dla swojego urządzenia zasięg słuchu 50–1500 m, zależnie od źródła dźwięku [F] (S11); zasięg naszego węzła trzeba zmierzyć [H].

Mowa jest drugą warstwą: leśniczy pracuje w terenie, w rękawicach, często w samochodzie [H]. Głos pozwala mu:
- zapytać „co działo się w nocy w sektorze 12?” i usłyszeć podsumowanie;
- odsłuchać alert z poziomem pewności;
- jednym zdaniem oznaczyć alert jako prawdziwy lub fałszywy, co zbiera dane do strojenia progu;
- podyktować notatkę z interwencji.

Rozpoznawanie mowy działa wyłącznie na telefonie leśnika, uruchamiane przyciskiem (push-to-talk), i nigdy na mikrofonach w lesie. Mikrofony leśne mowę tylko wykrywają, po to, żeby ją skasować. Ta sama technika służy więc i do ochrony prywatności, i do obsługi systemu [H]. Czy polski model mowy działający bez internetu sprawdzi się w terenie, trzeba przetestować [H]. Awaryjnie zostają przyciski w aplikacji.

## 6. Wyróżniki: nieoczywiste, ale realistyczne

1. **Jeden czujnik, dwa budżety.** Ten sam węzeł obsługuje ochronę lasu (pilarka, strzał) i monitoring przyrody (gatunki). Nadleśnictwo i park płacą więc za jedną infrastrukturę z dwóch powodów [H]. RFCx Guardian opisuje swoją ofertę jako wykrywanie zagrożeń [F] (S11); łączenie obu zadań w jednym dyżurze dla polskiego leśnictwa nie zostało przez nas znalezione [H].
2. **Prywatność wbudowana w Voice AI.** Detektor mowy kasuje fragmenty z ludźmi, zanim cokolwiek opuści urządzenie. RFCx wysyła dźwięk do analizy w chmurze [F] (S3), co w Unii Europejskiej byłoby trudniejsze do obrony [H].
3. **Lokalna nauka z oznaczeń.** Każde „fałszywy/prawdziwy” leśnika poprawia próg w tym konkretnym lesie. Odpowiada to na problem spadku precyzji po przeniesieniu modelu [F] (S7). Z czasem sieć węzłów buduje polski zbiór nagrań leśnych, którego dziś brakuje [H]. Na tym polega efekt sieciowy danych.
4. **Dyżur bez kamer.** Węzeł odpowiada w czasie rzeczywistym, bez obrazu twarzy i bez wysyłki dźwięku, więc jest mniej inwazyjny niż fotopułapka [H].

## 7. Ograniczenia i zagrożenia

| Obszar | Ograniczenie | Prawdop. | Wpływ | Sposób ograniczenia |
|---|---|---|---|---|
| Technika | Fałszywe alarmy w nowym lesie (0,85 → 0,57 precyzji [F] (S7)); pilarkę testowano tylko na nagraniach z bazy [F] (S4) | Wysokie | Wysoki | Etap 0 z kalibracją progu na lokalnych nagraniach; brama: precyzja ≥0,8 |
| Technika | Wiatr pogarsza lokalizację [F] (S5); wiatr i deszcz mogą maskować dźwięki i dawać fałszywe wykrycia [H] | Wysokie | Średni | Klasa „wiatr/deszcz” jako filtr, osłony mikrofonów [H] |
| Technika | Zasięg LoRa w lesie <1 km [F] (S4) | Średnie | Wysoki | Pomiar w pilotażu, kryterium ≥95% dostarczonych komunikatów; bramka na dostrzegalni [H] |
| Technika | Energia: 61 h na akumulatorze bez panelu [F] (S4) | Średnie | Wysoki | Panel, nasłuch z wybudzaniem, pomiar zimą [H] |
| Prawo | Przypadkowe nagranie mowy; EDPB jako przykład zbędnej funkcji podaje nagrywanie dźwięku [F] (S16) | Wysokie | Wysoki | Brak zapisu i wysyłki mowy, ocena skutków dla ochrony danych (DPIA), tablice informacyjne [H] |
| Prawo | Natura 2000: działania o znaczącym negatywnym wpływie wymagają oceny oddziaływania [F] (S20); zgoda nadleśniczego na urządzenia bywa sporna [F] (S19) | Niskie | Średni | Montaż bez wycinki i kabli; nadleśnictwo jako zamawiający i właściciel sprzętu [H] |
| Konkurencja | RFCx Guardian już wykrywa pilarki, silniki i strzały z alertem w aplikacji [F] (S11) | Średnie | Wysoki | Wyróżniki 1, 3, 4; brak potwierdzonej oferty RFCx w Polsce [H] |
| Substytuty | Kamery dymu i wieże finansowane z UE [F] (S14, S15); czujniki gazowe Silvanet w ok. 100 miejscach (dane producenta) [F] (S17) | Wysokie | Średni | Nie konkurować w pożarach; pożar najwyżej jako moduł uzupełniający |
| Substytuty | Tanie rejestratory z detekcją na urządzeniu (AudioMoth: precyzja strzałów 0,92, czułość 0,64 na zbiorze testowym, w terenie trafność ok. 0,57 [F] (S22)) | Wysokie | Średni | Wykorzystać je w etapie 0; płatna wartość to dyżur, mapa i głos |
| Finansowanie | Ceny węzłów nieznane; LIFE wymaga kwalifikacji projektu przez KE [F] (S21) | Średnie | Wysoki | Wycena ofertowa przed pilotażem [H] |
| Adopcja | Leśniczy porzuci system przy >1 fałszywym alarmie tygodniowo albo po jednej przegapionej wycince [H] | Średnie | Wysoki | Jawne mierniki, tryb „tylko dziennik” do czasu osiągnięcia progu |

## 8. Wersje produktu i rekomendacja

Trzej projektanci bronili trzech wersji:
- **Wersja 1, „Strażnik zdarzeń”:** alarmy o pilarkach i strzałach.
- **Wersja 2, „Spis przyrody”:** wskaźniki gatunków dla parków i obszarów Natura 2000.
- **Wersja 3, „Dyżurny leśnictwa”:** alarmy z wersji 1, mapa i głos jako interfejs, a ptaki jako drugi moduł.

**Macierz ważona (1–5; ryzyko: wyżej = mniejsze):**

| Kryterium (waga) | Wersja 1 | Wersja 2 | Wersja 3 |
|---|---|---|---|
| Wartość dla użytkownika w terenie (25%) | 4 | 3 | 4 |
| Wykonalność techniczna dziś (25%) | 3 | 4 | 3 |
| Centralność Voice AI (20%) | 4 | 4 | 5 |
| Nieoczywistość przy realności (15%) | 2 | 2 | 3 |
| Ryzyko prawne i adopcyjne (15%) | 3 | 4 | 3 |
| **Wynik ważony** | **3,30** | **3,45** | **3,65** |

Wersja 3 dostaje 5 za centralność, bo jako jedyna używa obu warstw Voice AI z definicji zadania: dźwięku i mowy. Wersja 2 ma najwyższą wykonalność, bo BirdNET po dostrojeniu działa blisko poziomu ekspertów [F] (S2).

**Test wrażliwości [S]:**
- Równe wagi (po 20%): 3,20 / 3,40 / 3,60. Wygrywa wersja 3.
- Wykonalność 40%, pozostałe wagi proporcjonalnie (20/16/12/12): 3,24 / 3,56 / 3,52. Wygrywa wersja 2, z minimalną przewagą.
- Bez centralności Voice AI: 3,13 / 3,31 / 3,31. Remis wersji 2 i 3.
- Wniosek: wersja 3 wygrywa, gdy liczy się kryterium przedmiotu (Voice AI), a wersja 2, gdy dominuje wykonalność. Rekomendacja łączy oba wyniki: docelowo wersja 3, ale kolejność budowy wyznacza wykonalność.

**Zarzuty adwokata diabła i odpowiedzi:**

| Zarzut | Decyzja |
|---|---|
| Tańszy substytut: rejestrator AudioMoth wykrywa strzały na urządzeniu (precyzja 0,92, czułość 0,64 [F] (S22)) | Przyjęty częściowo: etap 0 korzysta z tanich rejestratorów; płatna wartość wersji 3 to dyżur w czasie rzeczywistym, mapa i głos |
| Zasięg LoRa na granicy przy siatce 1 km [F] (S4) | Przyjęty: pomiar w etapie 0, próg ≥95% dostarczonych komunikatów |
| Oznaczenia leśnika to za mało danych, by stroić próg [H] | Przyjęty: próg kalibrowany na nagraniach z etapu 0; oznaczenia tylko doszlifowują |
| Model ptaków nie zmieści się na mikrokontrolerze [H] | Przyjęty: ptaki jako moduł 2, krótkie fragmenty bez mowy trafiają na kartę i są analizowane zbiorczo (BirdNET lub Perch) |
| Zawyżone oceny centralności i nieoczywistości wersji 3 | Częściowo: nieoczywistość obniżona do 3; centralność 5 zostaje (uzasadnienie wyżej) |
| Przewaga wersji 3 jest krucha | Przyjęty: pokazany test wrażliwości; kolejność budowy oparta na wykonalności |
| Budżet i polska mowa offline niesprawdzone [H] | Przyjęty: wycena ofertowa przed etapem 1; przyciski jako tryb awaryjny |

**Rekomendacja i pierwszy pilotaż:**
- **Etap 0, tani test (ok. 3 miesiące) [H].** 10–20 rejestratorów z detekcją na urządzeniu w jednym leśnictwie (tyle, ile węzłów planujemy w etapie 1), bez LoRa i alertów. Wyniki porównujemy z dziennikiem leśniczego i odsłuchem eksperta. Mierzymy precyzję i czułość dla pilarek i strzałów, fałszywe wykrycia na tydzień, energię zimą i zasięg LoRa.
- **Etap 1, dyżur [H].** Węzły z LoRa w miejscach częstych kradzieży drewna, alerty, mapa, głos. 12 miesięcy, poniżej 170 000 zł netto [F] (S13), czyli ok. 8 500 zł na węzeł przy 20 węzłach, łącznie z serwisem [S] (170 000 / 20). Bramy: precyzja alertów ≥0,8 w miesiącach 1–3, najwyżej 1 fałszywy alarm tygodniowo na leśnictwo [H].
- **Etap 2, spis przyrody [H].** Moduł ptaków z weryfikacją ekspercką, wskaźniki obecności bez liczebności, finansowanie z LIFE [F] (S21).
- **Etap 3, warunkowo [H].** Lokalizacja TDOA do badań terytoriów; pożar jako sygnał uzupełniający kamery.

## 9. Źródła

- S1. van Merriënboer i in., „Perch 2.0: The Bittern Lesson for Bioacoustics”, arXiv, 2025. https://arxiv.org/abs/2508.04665
- S2. Fairbairn i in., „BirdNET can be as good as experts for acoustic bird monitoring in a European city”, PubMed Central, 2025. https://pmc.ncbi.nlm.nih.gov/articles/PMC12425287/
- S3. „The fight against illegal deforestation with TensorFlow”, Google (The Keyword), 2018. https://blog.google/technology/ai/fight-against-illegal-deforestation-tensorflow/
- S4. Andreadis, Giambene, Zambon, „Monitoring Illegal Tree Cutting through Ultra-Low-Power Smart IoT Devices”, Sensors 21(22):7593, 2021. https://pmc.ncbi.nlm.nih.gov/articles/PMC8624687
- S5. Rhinehart i in., „Acoustic localization of terrestrial wildlife: Current practices and future opportunities”, Ecology and Evolution, 2020. https://pmc.ncbi.nlm.nih.gov/articles/PMC7381569/
- S6. Callebaut i in., „LoRa Physical Layer Evaluation for Point-to-Point Links and Coverage Measurements in Diverse Environments”, EuCNC 2019 (arXiv 1909.08300). https://arxiv.org/abs/1909.08300
- S7. Katsis i in., „Automated detection of gunshots in tropical forests using convolutional neural networks”, Ecological Indicators, 2022. https://ora.ox.ac.uk/objects/uuid:aaffec7c-53b9-4c68-8296-3947ed4d82c2
- S8. Huang, Downey, Bakos, „Audio-Based Wildfire Detection on Embedded Systems”, Electronics (MDPI) 11(9):1417, 2022. https://www.cse.sc.edu/~jbakos/assets/papers/electronics22_paper.pdf
- S9. Papin i in., „Acoustic localization at large scales: a promising method for grey wolf monitoring”, Frontiers in Zoology, 2018. https://pmc.ncbi.nlm.nih.gov/articles/PMC5897954/
- S10. Wang, Ye, Borchers, „Towards Automated Animal Density Estimation with Acoustic Spatial Capture-Recapture”, arXiv 2308.12859 (Biometrics), 2023. https://arxiv.org/abs/2308.12859
- S11. „Real-Time Threat Detection (Guardian)”, Rainforest Connection, b.d. https://rfcx.org/guardian
- S12. „Lasy Państwowe w liczbach”, Lasy Państwowe, 2024 (dane z 2022). https://lasy.gov.pl/pl/informacje/publikacje/do-poczytania/lasy-panstwowe-w-liczbach-1/lasy-w-liczbach_pl_online.pdf
- S13. „Próg 170 000 zł w Pzp”, prawo.pl, 2025/2026. https://www.prawo.pl/biznes/pzp-170000-zl-prog-przetargi,535939.html
- S14. „Kompleksowy projekt adaptacji lasów i leśnictwa do zmian klimatu – zapobieganie, przeciwdziałanie oraz ograniczanie skutków zagrożeń związanych z pożarami lasów”, Ministerstwo Klimatu, 2024. https://www.gov.pl/web/klimat/poznaj-nasze-projekty---kompleksowy-projekt-adaptacji-lasow-i-lesnictwa-do-zmian-klimatu--zapobieganie-przeciwdzialanie-oraz-ograniczanie-skutkow-zagrozen-zwiazanych-z-pozarami-lasow
- S15. „Blisko 93 mln zł z funduszy europejskich na ochronę lasów przed pożarami”, NFOŚiGW, 2025. https://www.gov.pl/web/nfosigw/blisko-93-mln-zl-z-funduszy-europejskich-na-ochrone-lasow-przed-pozarami
- S16. „Guidelines 3/2019 on processing of personal data through video devices” (v2.0), EDPB, 2020. https://www.edpb.europa.eu/system/files/documents/files/file1/edpb_guidelines_201903_video_devices_en_0.pdf
- S17. „Silvanet”, ITU Early Warnings for All, b.d. https://www.itu.int/ew4all/solution/silvanet/
- S18. „EU-FIRE” (projekt 035299), CORDIS, 2006–2009. https://cordis.europa.eu/project/id/035299
- S19. „Fotopułapki w lesie”, prawo.pl, b.d. https://www.prawo.pl/prawo/fotopulapki-w-lesie-nie-mozna-zabronic,520794.html
- S20. Art. 33 ustawy o ochronie przyrody, ArsLege, b.d. https://arslege.pl/zakaz-dzialan-o-negatywnym-oddzialywaniu-na-obszar-natura-2000-lub-majacych-znaczenie-dla-wspolnoty/k452/a38443
- S21. „Nabór LIFE 2026 – podstawowy/uzupełniający – dotacja”, NFOŚiGW, 2026. https://www.gov.pl/web/nfosigw/nabor-life-2026-podstawowyuzupelniajacy---dotacja
- S22. Prince i in., „Deploying Acoustic Detection Algorithms on Low-Cost, Open-Source Acoustic Sensors for Environmental Monitoring”, Sensors (MDPI), 2019. https://pmc.ncbi.nlm.nih.gov/articles/PMC6387379

## 10. Kontrola jakości

**Co sprawdzono.** Niezależny podagent-weryfikator otworzył źródła i sprawdził 17 twierdzeń [F] z 13 źródeł: S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S21, S22. Przeliczył też wszystkie szacunki [S], macierz ważoną i warianty testu wrażliwości (bez błędów) oraz zgodność z formatem. Zgodne ze źródłem były między innymi wszystkie liczby z S4, S7, S12 i S13 oraz precyzja i czułość z S2 i S22.

**Wykryte sprzeczności i rozstrzygnięcia.**

| Sprzeczność | Rozstrzygnięcie |
|---|---|
| 711 dostrzegalni w 2022 r. (S12) wobec 724 wież „w systemie” (S14) | Podajemy 711 z danymi rocznymi LP; różnica wynika najpewniej z innego roku i nowych wież, a dla wniosków nie ma znaczenia |
| 7,1 mln ha w zarządzie LP wobec 7,235 mln ha powierzchni lasów państwowych (oba w S12) | Do wyliczeń bierzemy 7,1 mln ha, bo to obszar faktycznie zarządzany przez nadleśnictwa |
| Leśniczy chce 10-sekundowego fragmentu nagrania przy alercie, inspektor ochrony danych nie dopuszcza wysyłki dźwięku | Węzeł wysyła tylko etykietę; fragment powstaje wyłącznie dla klas bez mowy i jest kasowany, gdy wykryto mowę |
| Projektanci zakładali duże modele ptaków na węźle, a mikrokontroler ma 256 kB RAM (S4) | Ptaki przeniesione do modułu 2 z analizą zbiorczą |
| Wypowiedź adwokata diabła: 6,48 mA i ok. 398 dni na 26 Ah dla AudioMoth (S22) nie zgadza się z prostym rachunkiem 26 000 / 6,48 ≈ 4 012 h ≈ 167 dni | Twierdzenie o czasie pracy pominięte; zostały tylko sprawdzone liczby precyzji i czułości |

**Co poprawiono po weryfikacji (1 pętla).**
- Podsumowanie skrócone do 6 zdań (było 10).
- Usunięte twierdzenie o panelach RFCx „w półcieniu”, którego nie ma w S3.
- Usunięty „zasięg 2,7–3,6 km” dla wilków: S9 podaje odległości rozstawienia rejestratorów, nie zasięg słyszalności.
- Zasięg 50–1500 m przypisany urządzeniu RFCx, nie naszemu węzłowi.
- Twierdzenie o S10 zastąpione wynikiem z abstraktu (zawyżenie gęstości o 17%), a przykład z precyzją 0,25 oznaczony jako ilustracja.
- Usunięte „automatyczne wykrywanie dymu”, którego nie podają S14 i S15.
- Przy S22 dopisana trafność w terenie ok. 0,57.
- Uzupełnione znaczniki ([H] dla obchodów pieszych, [H] dla wpływu deszczu) oraz tytuły, autorzy i lata S2, S3, S4, S6 i S10.

**Co zostaje otwarte.**
- Źródeł S1, S18, S19 i S20 weryfikator nie sprawdził.
- Ceny węzłów, energia z panelu pod okapem zimą i działanie polskiego modelu mowy bez internetu to hipotezy do pomiaru w etapie 0.
- Ocena RODO opiera się na wytycznych EDPB dotyczących wideo; odrębnych wytycznych dla samego dźwięku nie znaleziono, więc potrzebna jest opinia prawnika i DPIA.
- Liczba słów sekcji 1–8 to ok. 2 280 przy liczeniu wyrazów zawierających litery lub cyfry; `wc -w` daje więcej, bo liczy też kreski i separatory tabel.

**Przebieg faz pracy.**
- Faza 1: trzech podagentów zwiadu (Technika, Zdarzenia i zwierzęta, Ograniczenia) równolegle szukało i otwierało źródła. Twierdzenia znane tylko z wyników wyszukiwarki oznaczyli jako niepotwierdzone i nie weszły one do raportu jako [F]. Podagenci zostali uruchomieni, gdy sesja działała na Claude Sonnet 5.5; dalsze fazy prowadził Claude Opus 5.5.
- Faza 2: czterech symulowanych użytkowników (leśniczy, nadleśniczy, ekolog parku, inspektor ochrony danych), opierając się tylko na notatkach z fazy 1, wskazało progi zaufania (np. najwyżej 1 fałszywy alarm tygodniowo) i warunki prawne.
- Faza 3: trzech projektantów broniło wersji 1–3, każdy z wstępną oceną 1–5.
- Faza 4: macierz ważona, test wrażliwości i 7 zarzutów adwokata diabła. Przyjęte zarzuty zmieniły rekomendację: dodały etap 0 i przeniosły ptaki do modułu 2, a ocena nieoczywistości wersji 3 spadła z 4 na 3.
- Faza 5: synteza, weryfikacja i jedna pętla poprawek. Nie zostały uwagi krytyczne, więc druga pętla nie była potrzebna.
