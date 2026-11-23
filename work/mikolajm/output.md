# Słuchacz lasu — koncepcja wygenerowana przez workflow wieloagentowy

> Model: Claude Opus 5.5 (claude-opus-5-5) · Data: 2026-11-23 · Narzędzie: Claude Code · Podagenci research: 5 · Recenzenci: 4 · Pętle poprawek: 2

## Założenia

1. Rynek startowy to Polska: Lasy Państwowe (LP), parki narodowe, farmy wiatrowe, koła łowieckie. Eksport od 4. roku.
2. Główną techniką jest Voice AI: wykrywanie, klasyfikacja i lokalizacja źródeł dźwięku. Techniki pomocnicze to statystyka populacyjna i mapy (GIS). Działają wyłącznie na wynikach warstwy audio.
3. Kwoty w PLN netto. Wszystkie koszty i ceny bez źródła to szacunki zespołu.
4. Zespół 5 osób; pierwsze 18 miesięcy finansują granty.
5. Przy rozbieżnych danych przyjmujemy wartość gorszą dla nas.
6. System wspiera decyzje i nie zastępuje kamer przeciwpożarowych.

## 1. Problem

Lasy zajmują ponad 9,2 mln ha, czyli 29,6% kraju. LP zarządzają 7,1 mln ha (77%) przez 17 regionalnych dyrekcji (RDLP) i ok. 430 nadleśnictw [fakt, 1][fakt, 2]. Monitoring jest drogi w trzech obszarach:

- **Ochrona przeciwpożarowa.** LP mają 724 wieże i punkty obserwacyjne [fakt, 4]. Utrzymanie systemu kosztowało 158 mln zł w 2024 r. [fakt, 5], czyli ok. 22 zł/ha/rok [szacunek: 158 mln zł / 7,1 mln ha]. W 2024 r. wybuchło 3537 pożarów lasów, które objęły 885 ha (wszystkich pożarów było 5857) [fakt, 3].
- **Monitoring przyrody.** Państwowy Monitoring Środowiska ma na lata 2019–2028 budżet 898 mln zł [fakt, 8], a mimo to według NIK w latach 2019–2023 nie monitorowano 62 gatunków ptaków i 58 innych gatunków zwierząt [fakt, 7].
- **Szkodnictwo leśne.** Straty w latach 2011–2023 wyniosły ok. 90 mln zł, z czego 39% to kradzież drewna [fakt, 6]. Sama kradzież to więc ok. 2,7 mln zł rocznie [szacunek: 90 mln × 0,39 / 13 lat]. **Walka z kradzieżą nie uzasadnia zakupu systemu.**

Mikrofon słyszy kukułkę z ok. 470 m [fakt, 9], a wycie watahy wilków nawet z 3,2 km (w 9% przypadków) [fakt, 10] – daleko poza zasięgiem kamery.

**Nieoczywiste, ale realistyczne:** zamiast „AI przeciw złodziejom drewna” (mały problem) celujemy w budżet monitoringu przyrody z luką udokumentowaną przez NIK; ochrona lasu to dodatek.

## 2. Rozwiązanie i architektura

**Sprzęt.** Węzeł to obudowa szczelna wg normy IP67 (pył, krótkie zanurzenie) z dwoma miniaturowymi mikrofonami krzemowymi (MEMS), procesorem ESP32-S3, radiem LoRa, odbiornikiem GPS do synchronizacji czasu i kartą SD. Wisi zamaskowany na 3–4 m na drzewach nieprzeznaczonych do wycinki (np. nasiennych, na skrajach linii oddziałowych). Akcelerometr powiadamia leśniczego o próbie zdjęcia. Koszt części to ok. 500 zł, z montażem ok. 650 zł [szacunek: wycena komponentów]. Komercyjne rejestratory nie przesyłają danych zdalnie [fakt, 27].

**Zasilanie.** Panel słoneczny pod koronami drzew daje zimą za mało energii [fakt, 25]. Dlatego zasilają go odporne na mróz pierwotne ogniwa litowe (ok. 200 Wh) [szacunek: 3–4 ogniwa typu D]. Węzeł nie nagrywa ciągle. Mikrofon z wbudowanym wykrywaniem aktywności dźwiękowej budzi procesor tylko na zdarzenie, a GPS synchronizuje zegar raz na dobę, w kampaniach z lokalizacją – przy każdym nagraniu (wymaga dokładności rzędu milisekund). Średni pobór 10–15 mW daje 1,5–2 roku pracy [szacunek: bilans energii, do pomiaru w MVP]. Dla porównania AudioMoth (30 s nagrania co 5 min) działa ok. 115 dni [fakt, 40].

**Dwa tryby pracy tego samego węzła.**
- **Tryb „kampania”** (raporty przyrodnicze). Węzeł nagrywa według harmonogramu (świt, zmierzch, noc) na kartę SD. Po sezonie karty są zbierane i analizowane w chmurze; łączność zbędna.
- **Tryb „straż”** (alerty). Mały model na węźle klasyfikuje zdarzenia. Wysyła tylko etykietę i czas (kilkadziesiąt bajtów) przez LoRaWAN – radio dalekiego zasięgu o małej przepustowości, w paśmie 868 MHz bez licencji (limit 1% czasu nadawania [fakt, 35]). W gęstym lesie łącze sięga ok. 860 m, w rzadszym ok. 2 km [fakt, 26]. Klip z piłą zostaje na karcie jako dowód.

**Łączność.** Bramki LoRa montujemy na wieżach przeciwpożarowych LP, gdzie zwykle jest zasilanie dla kamer [szacunek: do potwierdzenia w RDLP]. Wariant zapasowy to dach leśniczówki albo maszt. Dalej dane idą siecią komórkową.

**Gęstość sieci straży.** RFCx podaje ok. 1 km zasięgu dla piły [fakt, 17]. W eksperymencie na Ukrainie ucho człowieka słyszało piłę z 300–500 m, a w widmie dźwięku ślad zanikał przy 750 m [fakt, 16]. Do planowania przyjmujemy 300 m [szacunek ostrożny]. Daje to **50 węzłów na 1000 ha** (siatka sześciokątna, rozstaw ok. 500 m).

**Modele (kaskada).**
1. **Na węźle:** mały klasyfikator w arytmetyce 8-bitowej. Klasyfikator ptaków na AudioMoth zużywa 77 mJ na 3-sekundowy fragment [fakt, 24]. Fragmenty z mową ludzką są usuwane przed zapisem (sekcja 7).
2. **W chmurze (tryb „kampania”):** Perch 2.0 (Google), model bazowy dla ok. 15 tys. gatunków. Na jego reprezentacjach liczbowych (embeddingach) douczamy nowe klasy z kilkunastu przykładów (autorzy testowali 16 na klasę) [fakt, 20]. Do dźwięków maszyn służy model ogólny wytrenowany na AudioSet (zbiór 2 mln opisanych klipów z YouTube) [szacunek: wybór modelu w MVP].
3. **Fuzja alarmu o pile:** piłę muszą usłyszeć co najmniej dwa węzły. Wynik porównujemy z otwartymi zleceniami dla firm leśnych i zgodami na samodzielny wyrób drewna z systemu informatycznego LP. Alarm powstaje tylko poza wydzieleniami z otwartym zleceniem albo w nocy i w weekend. Strzałów nie zgłaszamy, bo w lesie to niemal zawsze legalne polowanie.
4. **Człowiek w pętli:** decyzja leśniczego (potwierdź/odrzuć) staje się etykietą do douczania modelu (aktywne uczenie).

**Populacje i terytoria.**
- **Występowanie.** Modele występowania (occupancy) szacują, jaką część obszaru zajmuje gatunek, z poprawką na to, że nie zawsze się odzywa. Błędy klasyfikatora kalibrujemy na ok. 100 ręcznie sprawdzonych detekcjach na gatunek [fakt, 14]. Progi ufności ustalamy osobno dla każdego gatunku [fakt, 22].
- **Liczebność i terytoria gatunków głośnych.** Dotyczy wilka, jelenia, sów i dzięciołów. Akustyczny SECR (przestrzenny model „złap–wypuść–złap ponownie”) traktuje mikrofon jak pułapkę, a głos jak „złapanie” i szacuje zagęszczenie [fakt, 13]. TDOA (różnica czasu dotarcia dźwięku do kilku zsynchronizowanych mikrofonów) wyznacza położenie źródła. Wilki lokalizowano z błędem ok. 20 m z odległości do 7 km [fakt, 12]. Detekcja ryku jelenia z lokalizacją byków osiągnęła 96,5% skuteczności [fakt, 11]. Pozycje z sezonu tworzą mapę terytoriów i rozróżniają byki, czego nie daje liczenie „jeden ryk = jeden byk”. W kampaniach stawiamy w tym celu gęstsze grupy po 4 węzły.
- **Ograniczenia.** Indeksy akustyczne (jedna liczba „gwaru przyrody”) słabo korelują z bioróżnorodnością (r = 0,32) [fakt, 15]; są tylko pomocnicze. Usługa jest sezonowa: ptaki IV–VI, jeleń IX–X, wilk VII–X [szacunek: okresy aktywności głosowej]. Sarna i dzik (ciche) zostają przy liczeniach tradycyjnych.

**Nieoczywiste, ale realistyczne:** (a) jeden węzeł, dwa tryby, dwa budżety; (b) alarm o pile filtrowany danymi o legalnych pracach, nie samym dźwiękiem; (c) liczenie osobników metodą SECR – „fotopułapka bez kamery” – zamiast liczenia nagrań.

## 3. Plan realizacji

| Etap | Cel | Czas | Koszt | Kryterium przejścia |
|---|---|---|---|---|
| 0. MVP | Prototyp węzła i modeli; 10 węzłów w lesie doświadczalnym uczelni, kontrolowane cięcia piłą | mies. 0–6 | ok. 250 tys. zł [szacunek: 3 osoby × 6 mies. + sprzęt]; grant NCBR/PARP | Czułość dla piły ≥ 90% do 300 m; ≤ 1 fałszywy alarm tygodniowo na całą sieć testową; zmierzony pobór ≤ 15 mW |
| 1. Pilotaż | Tryb „straż” na 1000 ha w nadleśnictwie (50 węzłów) oraz jedna kampania w parku narodowym lub na farmie wiatrowej; porównanie z liczeniem tradycyjnym | mies. 6–18 | ok. 900 tys. zł [szacunek: zespół 600 tys., sprzęt 70 tys., eksperci 150 tys., prawnik i ocena skutków dla ochrony danych (DPIA) 50 tys.]; wkład klienta < 170 tys. zł, bez przetargu [fakt, 28], z rozeznaniem rynku | KPI z sekcji 6 spełnione przez sezon lęgowy i zimę; zgoda RDLP na bramki i integrację; ≥ 3 listy intencyjne |
| 2. Wejście na rynek | 15 kampanii rocznie i ok. 7 tys. ha w trybie „straż” | mies. 18–36 | ok. 3 mln zł [szacunek: zespół 6 osób 1,8 mln, 300 węzłów 0,2 mln, teren i walidacja 0,6 mln, sprzedaż 0,4 mln]; program LIFE (60%, wyjątkowo 75% [fakt, 30]) z partnerem publicznym; wkład własny ok. 1,2 mln zł z rundy zalążkowej (pierwsza inwestycja aniołów biznesu lub funduszu) [szacunek] | Przychód ≥ 1 mln zł/rok [szacunek: 15 × 50 tys. + 7 tys. ha × 35 zł]; ≥ 80% klientów pilotażu przedłuża umowę |
| 3. Skalowanie | ok. 60 kampanii rocznie (w tym ok. 20 za granicą: Czechy, Słowacja, kraje bałtyckie), standard w wybranych RDLP | mies. 36–60 | ok. 5 mln zł z rundy inwestycyjnej lub programu FEnIKS (fundusze UE na infrastrukturę i środowisko; precedens: projekt przeciwpożarowy LP [fakt, 5]) [szacunek: 8 osób × 2 lata 4 mln + 1000 węzłów 0,7 mln + sprzedaż zagraniczna] | Próg rentowności całej firmy (sekcja 4) |

**Nieoczywiste, ale realistyczne:** pilotaż nie sprawdza, czy „AI słyszy ptaki”, tylko czy wynik zgadza się z liczeniem tradycyjnym w tym samym miejscu i czasie.

## 4. Model biznesowy

**Produkt główny: „Raport przyrodniczy”.** Sezonowa kampania (40 węzłów na ok. 1000 ha, w tym 2 grupy po 4 węzły do lokalizacji) kończy się raportem o występowaniu i liczebności gatunków. Cena: ok. 50 tys. zł [szacunek]. Koszt: ok. 20 tys. zł [szacunek: sprzęt amortyzowany na 6 kampanii 4,3 tys., teren 6 tys., walidacja ekspercka i raport 8 tys., obliczenia i baterie 1,7 tys.]. Płatnicy:
- Generalna i regionalne dyrekcje ochrony środowiska (GDOŚ/RDOŚ) oraz Główny Inspektorat Ochrony Środowiska (GIOŚ). GIOŚ zleca monitoring w umowach ogólnokrajowych wartych miliony złotych [fakt, 7]; wchodzimy jako podwykonawca, z niższą stawką.
- Parki narodowe i nadleśnictwa, dla 1016 obszarów Natura 2000 [fakt, 41].
- Farmy wiatrowe: usługa roczna (3 kampanie: lęgi, wędrówki, zima; ok. 120 tys. zł). Wytyczne zalecają 3 lata monitoringu w pierwszych 5 latach pracy farmy [fakt, 29]. Nietoperze wymagają mikrofonu ultradźwiękowego (etap 2).
- Koła łowieckie i ośrodki hodowli zwierzyny: tańszy pakiet „rykowisko” (10 węzłów) do planów łowieckich [szacunek: segment do potwierdzenia].

**Produkt dodatkowy: „Straż akustyczna”.** Abonament HaaS (sprzęt, serwis i alerty w jednej opłacie, bez zakupu urządzeń) za 35 zł/ha/rok. Pokrywa koszt pełny 29 zł/ha (sekcja 5). Tylko strefy najwyższego ryzyka, decyzja na poziomie RDLP. Wartość to nie interwencja na gorąco, lecz lokalizacja pnia i dowód rano oraz wykrywanie pojazdów w strefach zamkniętych w okresie zagrożenia pożarowego. Dane należą do LP; raport z nich sprzedajemy tylko LP lub za jego zgodą.

**Rynek i rentowność.** Polski rynek dostępny to ok. 10 mln zł rocznie [szacunek: ok. 150 kampanii po 50 tys. zł (10% obszarów Natura 2000, parki, nowe farmy) + 1% powierzchni LP w trybie „straż” × 35 zł]. Koszty stałe to ok. 1,2 mln zł/rok przy 5 osobach i ok. 2 mln przy 8 osobach w etapie 3, a marża z kampanii ok. 30 tys. zł. Próg rentowności to ok. 40, a potem ok. 65 kampanii rocznie [szacunek]. To ponad 25% rynku krajowego, dlatego kampanie zagraniczne zaczynamy już w etapie 2.

**Finansowanie startu:** NCBR/PARP (MVP), LIFE – podprogram „Przyroda i różnorodność biologiczna” [fakt, 30], NFOŚiGW, Horyzont Europa (z uczelnią).

**Nieoczywiste, ale realistyczne:** klient płaci za dane, nie za sprzęt, a ten sam sprzęt obsługuje budżet przyrody i bezpieczeństwa.

## 5. Koszty

Tryb „straż”, 1000 ha (50 węzłów, 2 bramki):

| Pozycja | CAPEX (nakład jednorazowy) | OPEX (koszt roczny) |
|---|---|---|
| Węzły z montażem (50 × 650 zł) | 32 500 zł | — |
| Bramki (2 × 5 000 zł) | 10 000 zł | — |
| Wdrożenie i kalibracja | 5 000 zł | — |
| Wymiana baterii (co ok. 2 lata, 250 zł z robocizną) | — | 6 000 zł |
| Wymiana uszkodzonych i skradzionych (20%/rok) | — | 6 500 zł |
| Łącze i chmura | — | 2 000 zł |
| Przenoszenie węzłów przed zrębem, wsparcie | — | 5 000 zł |
| **Razem** | **47 500 zł (ok. 48 zł/ha, 950 zł/węzeł)** | **19 500 zł (ok. 20 zł/ha)** |

Wszystkie pozycje to [szacunek: wycena komponentów i roboczogodzin]. Z amortyzacją przez 5 lat koszt pełny to ok. 29 zł/ha/rok – więcej niż obecny budżet przeciwpożarowy na hektar, stąd „straż” tylko w wybranych strefach. Serwis w oknach IV–V i VIII–IX, poza polowaniami zbiorowymi.

**Nieoczywiste, ale realistyczne:** koszt to głównie serwis, nie elektronika – stąd węzeł pod rzadkie wizyty.

## 6. KPI

| Obszar | Wskaźnik | Cel w pilotażu | Jak mierzymy |
|---|---|---|---|
| Wycinka | Czułość (odsetek wykrytych zdarzeń) dla piły do 300 m | ≥ 90% | Kontrolowane cięcia |
| Wycinka | Precyzja alarmów po fuzji i filtrze zleceń, osobno zimą (szczyt prac) | ≥ 80% | Weryfikacja każdego alarmu przez leśniczego |
| Fałszywe alarmy | Liczba na 1000 ha na tydzień | ≤ 1 | Rejestr alarmów |
| Czas | Od zdarzenia do powiadomienia: w sezonie pożarowym do punktu alarmowo-dyspozycyjnego (PAD), poza nim do leśniczego | ≤ 5 min | Znaczniki czasu |
| Populacje | Zgodność zagęszczenia z liczeniem tradycyjnym (ptaki lęgowe, ryczące byki) | różnica ≤ 20% lub pokrywające się przedziały ufności | Równoległe liczenie ekspertów |
| Niezawodność | Dostępność węzłów (dni pracy w sieci / dni ogółem) | ≥ 95% | Telemetria |
| Prywatność | Fragmenty mowy zapisane na urządzeniu lub w chmurze | 0 | Audyt losowej próbki |

**Nie obiecujemy szybszego wykrycia pożaru** niż kamery: trzask ognia rejestrowano tylko z bliska, w laboratorium [fakt, 31].

**Nieoczywiste, ale realistyczne:** prywatność („zero zapisanej mowy”) to mierzalny KPI, a wyniki populacyjne porównujemy z metodą, której klient ufa.

## 7. Ryzyka i ograniczenia

| Ryzyko | Wpływ | Sposób ograniczenia |
|---|---|---|
| Nagranie rozmów. Głos jest daną osobową, jeśli osobę da się zidentyfikować (art. 4 RODO); modele wykrywają zrozumiałą mowę do ok. 10 m [fakt, 23] | Wysoki: kary RODO, zarzut podsłuchu (art. 267 k.k.) | Detektor mowy na węźle usuwa ramki z mową przed zapisem; tablice informacyjne (art. 13 RODO); DPIA przed pilotażem, bo wykaz Prezesa UODO obejmuje systematyczne monitorowanie na dużą skalę miejsc dostępnych publicznie [fakt, 32] |
| Klasyfikacja w AI Act [fakt, 33] | Średni | Wykrywamy zdarzenia, nie identyfikujemy osób, więc to nie system wysokiego ryzyka [szacunek: interpretacja – brak biometrii, poza załącznikiem III]; zakaz identyfikacji mówców w polityce produktu |
| Zgody na montaż; o dostępie do wież decyduje RDLP | Średni: opóźnienia | Umowa z nadleśniczym i RDLP; w parkach i rezerwatach zgoda dyrektora lub RDOŚ; serwis w strefach zakazu wstępu (art. 26 ustawy o lasach [fakt, 34]) po uzgodnieniu; montaż poza okresem lęgowym; wariant bramki na leśniczówce |
| Ujawnienie lokalizacji gatunków chronionych (kłusownictwo) | Wysoki | Dokładne dane tylko dla uprawnionych, publicznie siatka 10 km [szacunek: praktyka atlasów]; prawo pozwala odmówić informacji zagrażającej środowisku [fakt, 36] |
| Fałszywe alarmy (legalne prace, myśliwi, ciężarówki) | Wysoki: leśnicy przestaną reagować | Fuzja z dwóch węzłów, filtr zleceń, brak alarmów o strzałach, progi per obiekt, aktywne uczenie |
| Przeoczona wycinka lub pożar | Wysoki: odpowiedzialność kontraktowa (art. 471 k.c.) | Umowa: wsparcie decyzji, metryki czułości i precyzji, limit odpowiedzialności do rocznej opłaty |
| Mróz, wilgoć, dzięcioły, kradzież, harwester | Średni | Obudowa z siatką, ogniwa pierwotne, kamuflaż, oznakowanie „własność LP”, montaż na drzewach pozostawianych, budżet 20% wymian |
| Licencje: wiele nagrań Xeno-canto ma licencję niekomercyjną [fakt, 37], wagi BirdNET też (CC BY-NC-SA 4.0) [fakt, 21]; licencja wag Perch 2.0 [szacunek: do potwierdzenia] | Wysoki dla modelu biznesowego | Wyłącznie dane z licencją komercyjną i własny zbiór z polskich lasów; w razie potrzeby własny model uczony na tych danych |
| Mały rynek krajowy (próg rentowności > 25% rynku), długie zakupy publiczne | Wysoki | Pilotaże poniżej progu przetargowego, klienci komercyjni, kampanie zagraniczne od etapu 2, zespół nie rośnie przed przychodami |

**Nieoczywiste, ale realistyczne:** liczba wykryć mowy (bez treści) staje się wskaźnikiem presji turystycznej [fakt, 23] – ryzyko zamienia się w funkcję.

## 8. Konkurencja i wyróżnik

| Rozwiązanie | Co robi | Ograniczenie wobec nas |
|---|---|---|
| Rainforest Connection (z Huawei) | Akustyczne alerty o wycince w tropikach; projekt badawczy w Białowieskim PN (2023) wykrył 5 z 9 gatunków dzięciołów [fakt, 19] | Brak usługi zintegrowanej z LP; 96% skuteczności dla piły to deklaracja producenta [fakt, 18] |
| Dryad Silvanet | Czujniki gazów do wczesnego wykrywania pożaru, ok. 1 czujnik/ha [fakt, 38] | Tylko pożar; sieć ok. 20 razy gęstsza [szacunek: 1/ha vs 0,05/ha]; brak danych przyrodniczych |
| OroraTech | Satelitarne wykrywanie pożarów [fakt, 39] | Nie widzi zwierząt ani ludzi pod koronami |
| Kamery dymu na wieżach LP | Wizyjne wykrywanie dymu | Nie widzą pod okapem; partner (wspólne wieże) |
| Rejestratory (AudioMoth, Wildlife Acoustics) | Nagrywanie do późniejszej analizy | Brak alertów i gotowego raportu |

**Wyróżnik:** według naszego researchu nikt w Polsce nie oferuje z jednej sieci akustycznej raportu populacyjnego i alarmów zintegrowanych z procedurami LP.

**Nieoczywiste, ale realistyczne:** konkurenci zaczynali od wycinki albo pożaru; my od danych przyrodniczych, za które sektor publiczny już płaci.

## Źródła

1. Lasy Państwowe, Raport o stanie lasów w Polsce 2024. https://www3.bdl.lasy.gov.pl/portal/Media/Default/Publikacje/raport_o_stanie_lasow_2024.pdf
2. NIK, P/24/078 (dane za 2023 r.). https://www.nik.gov.pl/kontrole/wyniki-kontroli-nik/pobierz,lop~p_24_078_202407171259461721213986~01,typ,kk.pdf
3. IBL, Wpływ pożarów na lasy – 2024. https://www.ibles.pl/wp-content/uploads/2025/09/WPLYW-POZAROW-NA-LASY-2024-rok-1.pdf
4. Ministerstwo Klimatu i Środowiska, projekt przeciwpożarowy LP. https://www.gov.pl/web/klimat/poznaj-nasze-projekty---kompleksowy-projekt-adaptacji-lasow-i-lesnictwa-do-zmian-klimatu--zapobieganie-przeciwdzialanie-oraz-ograniczanie-skutkow-zagrozen-zwiazanych-z-pozarami-lasow
5. Spidersweb, 2025, za LP (koszt systemu, projekt z FEnIKS). https://spidersweb.pl/2025/04/jest-nowy-pomysl-na-walke-z-pozarami-w-lasach-wydamy-na-niego-miliony.html
6. Acta Sci. Pol. Silvarum Colendarum 27(3), 2025. https://www.forestry.actapol.net/pub/27_3_2025.pdf
7. NIK, P/23/040 (monitoring przyrody). https://www.nik.gov.pl/kontrole/wyniki-kontroli-nik/pobierz,ksi~p_23_040_202307110710411689052241~id1~01,typ,kj.pdf
8. GIOŚ, finansowanie PMŚ. https://www.gov.pl/web/gios/finansowanie
9. Winiarska i in. 2024, zasięg detekcji ptaków, Puszcza Zielonka. https://pmc.ncbi.nlm.nih.gov/articles/PMC10776575/
10. USGS, detekcja wycia wilków (AudioMoth). https://pubs.usgs.gov/publication/70214963
11. Avots i in. 2022, Remote Sensing 14(10):2464. https://doi.org/10.3390/rs14102464
12. Kershenbaum i in. 2019, lokalizacja wilków. https://www.repository.cam.ac.uk/bitstream/1810/289798/4/1.5092973.pdf
13. Dawson & Efford 2009, akustyczny SECR. https://pubs.usgs.gov/publication/70035444
14. Cole i in. 2022, rejestratory i modele występowania. https://birdpop.org/docs/pubs/Cole%20et%20al%202022%20ARU.pdf
15. Pan i in. 2024, metaanaliza indeksów akustycznych. https://doaj.org/article/e700e62911944ed7b2744cfcdca463c6
16. NECU, eksperyment akustyczny w lesie. https://necu.org.ua/sounds-of-the-forest-results-of-an-acoustic-experiment/
17. Kopernik, Rainforest Connection. https://impacttrackertech.kopernik.info/products/rainforestConnection
18. Huawei, Safeguarding rainforests with AI. https://www.huawei.com/br/huaweitech/publication/winwin/34/safeguarding-rainforests-with-ai
19. Rainforest Connection, projekt Polska. https://rfcx.org/projects/poland
20. Perch 2.0, arXiv:2508.04665. https://arxiv.org/html/2508.04665v1
21. BirdNET-Analyzer, repozytorium i licencja. https://github.com/birdnet-team/BirdNET-Analyzer
22. Funosas i in. 2024, progi BirdNET. https://www.biorxiv.org/content/10.1101/2023.12.06.570351.full.pdf
23. Cretois i in. 2022, mowa w nagraniach ekoakustycznych. https://www.biorxiv.org/content/10.1101/2022.02.08.479660.full.pdf
24. WrenNet, arXiv:2509.20103. https://arxiv.org/pdf/2509.20103
25. Zasilanie fotowoltaiczne pod okapem, Sensors 25(23):7373. https://www.mdpi.com/1424-8220/25/23/7373
26. Wydajność LoRa w lesie, Future Internet 13(5):115. https://mdpi.com/1999-5903/13/5/115
27. Wildlife Acoustics, Song Meter Mini 2. https://wildlifeacoustics.com/products/song-meter-mini-2-aa
28. Prawo.pl, próg Pzp 170 tys. zł. https://www.prawo.pl/biznes/pzp-170000-zl-prog-przetargi,535939.html
29. OTOP 2024, monitoring ptaków na farmach wiatrowych. https://otop.org.pl/wp-content/uploads/2024/09/Monitoring-ptakow-na-ladowych-farmach-wiatrowych_FINAL.pdf
30. Rozporządzenie (UE) 2021/783 ustanawiające program LIFE. https://eur-lex.europa.eu/eli/reg/2021/783/oj
31. Fire Technology 2021, akustyka trzasku ognia. https://link.springer.com/doi/10.1007/s10694-021-01194-y
32. Komunikat Prezesa UODO, M.P. 2019 poz. 666. https://eli.gov.pl/api/acts/MP/2019/666/text/O/M20190666.pdf
33. Rozporządzenie (UE) 2024/1689 (AI Act). https://eur-lex.europa.eu/eli/reg/2024/1689/oj
34. Ustawa o lasach, art. 26. https://www.lexlege.pl/ustawa-o-lasach/art-26/
35. NIT, LoRa pod lupą. https://www.gov.pl/web/national-institute-of-telecommunications/lora-under-the-microscope
36. Prawo.pl, odmowa informacji o gatunku chronionym. https://www.prawo.pl/biznes/czy-rdos-moze-nie-udzielic-informacji-o-gatunku-chronionym,329946.html
37. Xeno-canto, warunki korzystania. https://xeno-canto.org/about/terms
38. Dryad Networks, FAQ. https://www.dryad.net/faq
39. OroraTech, 2024. https://ororatech.com/2024/10/15
40. Mongabay 2018, AudioMoth. https://news.mongabay.com/2018/01/audiomoth-device-aims-to-deliver-low-cost-power-efficient-monitoring-of-remote-landscapes
41. Odpowiedź na interpelację z02766 (obszary Natura 2000). https://api.sejm.gov.pl/sejm/term10/interpellations/attachment/ATTDMRHRC/z02766-o1.pdf

## Aneks: Dziennik weryfikacji

Plan workflow: faza 0 (założenia i kryteria akceptacji) → 5 równoległych podagentów research (bioakustyk, inżynier IoT, specjalista ML audio, analityk rynku, prawnik) → synteza → 4 niezależnych recenzentów, którzy widzieli tylko szkic i kryteria → 2 pętle poprawek. W pętli 2 ponownie uruchomiono recenzentów (a) i (d). Uwagi krytyczne (b) i (c) były zmianami w treści, które wprowadzono bezpośrednio. Sprzeczności rozstrzygnięte w syntezie: zasięg piły 300 m zamiast 1 km (wariant ostrożny), koszt węzła ok. 650 zł zamiast 2–4 tys. zł (własny projekt bez panelu słonecznego), pożar wykrywany pośrednio (zachowania ludzi), nie przez trzask ognia.

| Recenzent | Najważniejsze uwagi | Co zmieniono / dlaczego odrzucono |
|---|---|---|
| (a) Sceptyczny inwestor | P1: cena poniżej kosztu pełnego; przychód etapu 2 niespójny; koszt krańcowy raportu i własność danych; audio nie przejdzie przez LoRa; brak wielkości rynku. P2: koszty stałe przy 12 osobach; wkład własny do LIFE; całoroczny monitoring farm | Raport przyrodniczy jako produkt główny (kampanie z kartami SD), „straż” za 35 zł/ha wobec kosztu 29 zł/ha, rynek ok. 10 mln zł i próg rentowności, dane należą do LP, zespół 8 osób w etapie 3, runda zalążkowa jako wkład własny, roczna usługa dla farm. Odrzucono porównanie z kosztem liczenia tradycyjnego: brak wiarygodnego źródła |
| (b) Praktyk-leśnik | Większość pił pracuje legalnie (plan miesięczny, nie godzinowy); strzały to polowania; nikt nie odbiera alarmów w nocy; drzewa trafią pod harwester; o wieżach decyduje RDLP | Filtr oparty na otwartych zleceniach i zgodach na samowyrób oraz porze dnia; usunięto alarmy o strzałach; wartość nocnego alarmu to dowód rano; montaż na drzewach pozostawianych; zgoda RDLP w kryterium pilotażu; 20% wymian, okna serwisowe |
| (c) Fact-checker | Perch: 16 przykładów, nie 4–32; zasięg 300–500 m z NECU dotyczy ucha człowieka; błędnie użyte zalecenie rozstawu; pożary lasu: 885 ha, nie 1358 ha; kontrakty GIOŚ, nie RDOŚ; LIFE: zła strona źródłowa; farmy: wytyczne, nie przepis; licencja BirdNET to CC BY-NC-SA | Wszystkie poprawione. Źródło LIFE zmieniono na rozporządzenie 2021/783. Zasilanie wież oznaczono jako szacunek. Licencja wag Perch nadal niepotwierdzona, przeniesiona do ryzyk |
| (d) Oceniający wg kryteriów | P1: sprzeczność audio–chmura; rozbieżność KPI fałszywych alarmów (50×); AI Act oznaczony jako fakt; etap 3 bez kosztu; niewyjaśnione skróty. P2: synchronizacja GPS dla TDOA; ryzyko udziału w rynku | Dwa tryby węzła; ujednolicone KPI; AI Act oznaczony jako interpretacja; koszty etapów z rozbiciem; skróty objaśnione; synchronizacja GPS przy nagraniach z lokalizacją; plan B w ryzykach. Odrzucono usunięcie nagłówka i aneksu: wymaga ich format zadania |

Oceny recenzenta (d): przed poprawkami oryginalność 8/10, wykonalność 6/10, jakość opisu 7/10; po pętli 2 oryginalność 8/10, wykonalność 7/10, jakość opisu 8/10.
