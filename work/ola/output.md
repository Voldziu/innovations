# Słuchacz Lasu — dokument produktowo-biznesowy (Voice AI do monitoringu polskich lasów)

**Model:** Claude Sonnet (5.5)
**Autor:** Product Manager / współzałożyciel · **Data:** 23 listopada 2026 · **Zakres geograficzny:** wyłącznie Polska

## Jak czytać ten dokument (legenda oznaczeń)

| Znacznik | Znaczenie |
|---|---|
| **[FAKT]** | Informacja z podanego źródła (link obok). Źródła streszczam własnymi słowami. |
| **[ZAŁOŻENIE]** | Przyjęte przeze mnie, nieudowodnione w źródłach. Wymaga weryfikacji. |
| **[SZACUNEK WŁASNY]** | Moje wyliczenie. Podaję, z czego wynika. |
| **[DO WERYFIKACJI]** | Nie znalazłem wiarygodnego źródła w tym przeglądzie. Nie traktować jako faktu. |

Terminologia: „Voice AI” w tym projekcie oznacza **AI do analizy dźwięku środowiskowego** (bioakustyka i detekcja zdarzeń akustycznych), a nie rozpoznawanie mowy. Mowa ludzka jest dla nas **ryzykiem prawnym**, nie funkcją (rozdz. 3.5).

---

## 0. Streszczenie dla zarządu (1 minuta)

- **Co budujemy:** system akustycznego monitoringu przyrody i presji człowieka w lesie. Rejestratory z AI wykrywają gatunki (priorytet: sowy leśne i ptaki), a z tego samego strumienia dźwięku także zdarzenia: piła spalinowa, pojazd, strzał. Wynik to **dane i raporty zgodne z potrzebami monitoringu przyrody**, a alerty to funkcja eksperymentalna.
- **Dlaczego nie „alarm przeciw złodziejom drewna” jako rdzeń:** udokumentowane straty z kradzieży drewna w całych Lasach Państwowych to rząd **1,4 mln zł rocznie** (dane z 2019 r.), a piły spalinowe w lesie pracują legalnie codziennie. Wartość i precyzja takiego alertu są niskie. Patrz rozdz. 2 i 7.
- **Kto zapłaci:** w pierwszej kolejności parki narodowe i nadleśnictwa/RDLP, które mają obowiązki monitoringu przyrody. Pierwszy cel: **park narodowy lub nadleśnictwo z istniejącym doświadczeniem w nagraniach**, np. Białowieski Park Narodowy (tam wdrożono już system akustyczny w 2023 r., rozdz. 6).
- **Technologia:** gotowe, otwarte modele (**Perch 2.0, licencja Apache-2.0**) + własne „głowy” klasyfikatorów trenowane na krótkich, własnych nagraniach z polskich lasów. **Bez trenowania modeli od zera.** BirdNET tylko do badań: jego **modele mają licencję niekomercyjną**.
- **Budżet MVP:** ok. **0,8 mln zł** (wariant lean z niskimi pensjami założycieli) do ok. **1,35 mln zł** (koszty rynkowe) **[SZACUNEK WŁASNY]**, czas ok. **14 miesięcy** do końca pilotażu.
- **Krytyczna ocena rentowności:** rynek polski jest nisza. Z moich obliczeń (rozdz. 6.4) próg rentowności wymaga rzędu **200–600 węzłów** w subskrypcji. To realne, ale bez ekspansji zagranicznej jest to firma usługowo-technologiczna, nie „jednorożec”.
- **Decyzja:** GO na **fazę walidacji (ok. 60–80 tys. zł gotówki, 2 miesiące)**. Dalsze fazy warunkowo, po spełnieniu kryteriów w rozdz. 7.

---

## 1. Problemy i możliwości

### 1.1. Cztery problemy, które da się monitorować akustycznie

| # | Problem | Co słychać | Ocena wykonalności akustycznej |
|---|---|---|---|
| 1 | **Utrata bioróżnorodności i zmiany aktywności zwierząt** | Głosy ptaków (w tym sów), płazów, części ssaków. Nietoperze wymagają mikrofonu ultradźwiękowego. | **Wysoka** dla ptaków i sów. Średnia dla ssaków i płazów (niższa dojrzałość modeli). |
| 2 | **Nielegalna działalność człowieka** (kradzież drewna, kłusownictwo) | Piła spalinowa, pojazdy, strzały | **Średnia**: wykrycie dźwięku jest możliwe, **ale odróżnienie legalnego od nielegalnego jest trudne** (rozdz. 3.4). |
| 3 | **Presja człowieka i hałas** (wjazdy pojazdów, rekreacja, hałas w lasach podmiejskich) | Silniki, głosy, muzyka, drony | **Średnia/wysoka** dla zliczania zdarzeń. Słaba pewność popytu (rozdz. 6). |
| 4 | **Zagrożenia środowiskowe** (pożary, burze, szkodniki) | Trzask ognia, huk, wiatr, aktywność owadów | **Niska**: akustyczne wykrywanie pożaru nie jest dojrzałą technologią. Są lepsze metody (gazowe czujniki, kamery). |

### 1.2. Fakty o skali problemów (Polska)

- **Struktura własności:** Lasy Państwowe (LP) składają się z 17 regionalnych dyrekcji i 431 nadleśnictw, a zarządzają prawie 80% lasów w kraju ([Sejm, komisja OSZ, raport o stanie lasów za 2024](https://api.sejm.gov.pl/sejm/term10/committees/OSZ/sittings/105/html)). **[FAKT]**
- **Szkodnictwo leśne:** w 2019 r. odnotowano m.in. 2260 kradzieży drewna, a straty z kradzieży drewna wyniosły 1 363 951 zł (łączne straty ze szkodnictwa 3 126 987 zł). W 2020 r. było 2194 kradzieży drewna i 153 przypadki kłusownictwa, a łączne szkody 3 722 400 zł ([Rola kryminalistyki w zwalczaniu szkodnictwa leśnego, PPGOS](https://journals.us.edu.pl/index.php/ppgos/article/download/13933/11549)). **[FAKT]**
  → **Wniosek PM [SZACUNEK WŁASNY z danych powyżej]:** udokumentowana szkoda z kradzieży drewna jest mała względem skali LP. Jest to argument przeciw budowaniu całego biznesu na „antykradzieżowym” alercie. Dane są starsze (2019–2020), więc **[DO WERYFIKACJI]** w nowszych raportach LP.
- **Pożary:** analiza IBL obejmuje 16 369 pożarów na terenach LP w latach 2016–2023 ([IBL, Leśne Prace Badawcze 2025](https://www.ibles.pl/wp-content/uploads/2025/11/10.48538-lpb-2025-0015.pdf)). Pożary mają już rozwinięty system ochrony (kamery, patrole, lotnictwo). **[FAKT]** Konkurencyjny czujnik gazowy (Dryad Silvanet) jest zaprojektowany do wykrywania pożaru w ciągu 30–60 minut ([Semtech](https://blog.semtech.com/fighting-wildfires-and-combating-climate-change-with-lorawan)). **[FAKT]**
- **Polityka „wyłączeń z pozyskania”:** wiceminister klimatu mówi, że obecnie z bieżącego pozyskania wyłączone jest ok. 7–8% lasów LP, a cel to 11% do końca kadencji i 14% do 2030 r. ([Rzeczpospolita](https://www.rp.pl/gospodarka/art44348121-wiceminister-klimatu-mikolaj-dorozala-jesli-wygra-kontrreformacja-odejde)). **[FAKT]**
  → **[ZAŁOŻENIE]:** rosnąca powierzchnia wyłączona z użytkowania zwiększa zapotrzebowanie na **nieinwazyjne** dowody stanu przyrody. To hipoteza do zbadania w wywiadach.
- **Lasy społeczne:** Ministerstwo Klimatu i Środowiska prowadzi drugi etap pilotażu wyznaczania „lasów społecznych” wokół dziewięciu największych aglomeracji ([IOŚ-PIB, 13.05.2026](https://ios.edu.pl/wp-content/uploads/2026/05/ruszyl-drugi-etap-pilotazu-wyznaczania-lasow-spolecznych-wokol-najwiekszych-aglomeracji-w-polsce-2.pdf)). **[FAKT]** To potencjalny kontekst dla pomiaru presji rekreacyjnej i hałasu. **[ZAŁOŻENIE]**

### 1.3. Jakie dźwięki można analizować i jak użyjemy AI

| Klasa dźwięków | Przykłady | Podejście AI | Dojrzałość |
|---|---|---|---|
| Ptaki | śpiew, głosy kontaktowe, sowy | gotowy model + głowa klasyfikatora lokalnych gatunków | wysoka |
| Sowy leśne (priorytet) | puszczyk uralski, uszatka, włochatka, sóweczka, puchacz, puszczyk | jw., okna nocne | wysoka dla bardzo głośnych śpiewów, **[DO WERYFIKACJI]** w naszych warunkach |
| Płazy, ssaki | kumak, głosy ssaków | gotowy model (Perch 2.0 obejmuje też płazy, ssaki) + weryfikacja | średnia |
| Nietoperze | echolokacja (ultradźwięk) | wymaga innego sprzętu, **poza v1** | zob. rozdz. 4 |
| Dźwięki antropogeniczne | piła spalinowa, silnik, strzał | własny mały klasyfikator, ewentualnie model ogólnego audio | średnia |
| Mowa ludzka | głosy ludzi | **tylko detekcja i usuwanie** (VAD), bez zapisu treści | patrz 3.5 |

**Uzasadnienie priorytetu sów:** GIOŚ prowadzi Monitoring Lęgowych Sów Leśnych obejmujący 6 gatunków sów ([GIOŚ, Międzynarodowy Dzień Ptaków](https://www.gov.pl/web/gios/miedzynarodowy-dzien-ptakow)). Metodyka opiera się na punktach z **nocną stymulacją głosową** (odtwarzanie głosu i nasłuch), a sezon głosowy niektórych gatunków zaczyna się jeszcze zimą ([Ojcowski Park Narodowy, monitoring sów](https://opn.gov.pl/pliki-do-pobrania/otworz/bf85092c-f2a4-4d01-ac68-22bb7fe97a5b.pdf)). **[FAKT]**
→ **[ZAŁOŻENIE]:** to praca nocna, w trudnych warunkach i sezonowa, więc automatyzacja ma jasną wartość dla zamawiającego. Trzeba zweryfikować, czy GIOŚ lub parki **uznają** dane z rejestratorów za równoważne.

### 1.4. Korzyści i potencjalni kupujący

| Korzyść | Kto skorzysta | Status |
|---|---|---|
| Ciągłe dane o obecności gatunków przy mniejszej liczbie wyjść w teren | parki narodowe, nadleśnictwa, RDOŚ, firmy przyrodnicze | **[ZAŁOŻENIE]** |
| Obiektywny zapis zmian po wyłączeniu obszaru z pozyskania | LP, ministerstwo | **[ZAŁOŻENIE]** |
| Dane o presji człowieka (liczba zdarzeń, godziny) | parki, samorządy (lasy podmiejskie) | **[ZAŁOŻENIE]** |
| Informacja o zdarzeniach (piła, strzał) w obszarze chronionym | straż parku, Straż Leśna | wymaga kontekstu operacyjnego (rozdz. 3.4) |

---

## 2. Projekt produktu: trzy koncepcje i konkurencja

### 2.1. Koncepcja A — „Strażnik”: alerty o zagrożeniach w czasie zbliżonym do rzeczywistego

- **Funkcje:** wykrycie piły, pojazdu, strzału; alert do aplikacji dla straży/leśniczego; mapa zdarzeń.
- **Technologia:** węzeł z AI na brzegu (edge), łączność komórkowa lub LoRaWAN, chmura do alertów. Podobna idea istnieje: system Rainforest Connection wykrywa w czasie rzeczywistym m.in. piły, kłusownictwo i pożary ([RFCx Guardian](https://rfcx.org/guardian)).
- **Sprzęt:** zasilany słonecznie węzeł ze stałą transmisją. Koszt węzła wysoki (zasilanie, łączność, montaż).
- **Klienci:** nadleśnictwa, parki, Straż Leśna.
- **Zalety:** jasna narracja „ochrony”, atrakcyjna w marketingu.
- **Ograniczenia (krytyczne):**
  1. Skala szkód z kradzieży drewna jest mała (rozdz. 1.2).
  2. **Piły leśne i strzały są legalne.** RFCx sam wskazuje w projekcie w Kolumbii trudność odróżniania piły od kosy spalinowej, potrzebę dostępu do koron drzew oraz brak dokładnej lokalizacji utrudniającej weryfikację ([RFCx Kolumbia](https://rfcx.org/projects/colombia)). **[FAKT]** W literaturze lista „fałszywych przyjaciół” piły obejmuje też kosę spalinową, kosiarkę, motocykl crossowy i skuter śnieżny ([Anđelić i in., IEEE](https://tfsa.ucg.ac.me/pap/tfsa-001454.pdf)). **[FAKT]**
  3. Konkurencja globalna i darmowe/sponsorowane wdrożenia (np. Huawei).
  4. Wymagana wysoka precyzja, bo każdy fałszywy alarm to koszt wyjazdu patrolu.

### 2.2. Koncepcja B — „Ekolog”: monitoring bioróżnorodności jako usługa (PAM + AI + raporty)

- **Funkcje:** zaplanowane okna nagrań, automatyczna detekcja gatunków, wykaz obecności i aktywności w czasie, raport sezonowy, eksport danych. Opcjonalnie wykrywanie zdarzeń antropogenicznych jako dodatkowa warstwa.
- **Technologia:** rejestratory (offline lub z łącznością), model Perch 2.0 z własnymi głowami klasyfikatorów, panel weryfikacji eksperckiej.
- **Sprzęt:** tani rejestrator klasy AudioMoth (**[FAKT]** koszt wytworzenia ok. 43 USD wg [Hill i in., 2018, Oksford ORA](https://ora.ox.ac.uk/objects/uuid:17e01cea-25ff-484d-b8ec-85a8ccc14cd3/files/mc8e85d7bbbe142538b2ba14224d1b870); cena sprzedaży ok. 80 GBP z VAT wg [zestawienia kosztów](https://sites.google.com/view/dun-coillich/home/biodiversity/monitoring-equipment), **źródło pośrednie**) oraz kilka węzłów „na żywo”.
- **Klienci:** parki narodowe, nadleśnictwa/RDLP, RDOŚ, firmy przyrodnicze (inwentaryzacje), uczelnie.
- **Zalety:** istnieje formalna potrzeba (monitoring przyrody prowadzi GIOŚ; trwa przetarg GIOŚ na monitoring zwierząt kręgowych na lata 2026–2028, obejmujący 23 gatunki i ok. 8711 raportów — [ogłoszenie TED 537008-2026](https://ted.europa.eu/en/notice/537008-2026/pdf)). **[FAKT]** Mniejsze ryzyko fałszywych alarmów (dane można weryfikować po fakcie).
- **Ograniczenia:** cykl sprzedaży z jednostkami publicznymi, sezonowość, konkurencja z samodzielnym użyciem darmowych narzędzi (np. BirdNET) przez zespoły naukowe, mniejsza „wow” niż alerty.

### 2.3. Koncepcja C — „Cisza i hałas”: indeks krajobrazu dźwiękowego i presji rekreacyjnej

- **Funkcje:** wskaźniki hałasu i liczby zdarzeń (pojazdy, mowa wykrywana tylko jako „obecność”), dashboardy dla lasów podmiejskich.
- **Technologia:** podobna jak w B, ale z naciskiem na pomiar poziomu dźwięku i klasyfikację grubych kategorii.
- **Klienci:** samorządy, LP (lasy społeczne), parki krajobrazowe.
- **Zalety:** niski wymóg dokładności gatunkowej.
- **Ograniczenia:** brak wskazanego w tym przeglądzie ustawowego obowiązku i budżetu na taki pomiar, więc **[DO WERYFIKACJI]** czy ktokolwiek zapłaci. Wysokie ryzyko prywatności (mowa).

### 2.4. Konkurencja (świat i Polska)

| Podmiot | Kraj | Oferta | Co z tego wynika dla nas |
|---|---|---|---|
| **Rainforest Connection (RFCx)** | USA | Guardian (stały monitoring w czasie rzeczywistym, obecnie model G3 z trzema mikrofonami, zasięg 50–1500 m zależnie od źródła dźwięku, zasilanie solarne — [rfcx.org](https://rfcx.org/guardian)), AudioMoth Edge, platforma Arbimon ([przegląd](https://panorama.solutions/sites/default/files/rainforest_connection_overview.pdf)) | **Najbliższy konkurent technologiczny.** Już działał w Polsce. |
| **Projekt w Białowieskim PN** (RFCx + Huawei TECH4ALL) | USA/Chiny/PL | W 2023 r.: 70 rejestratorów AudioMoth Edge + 3 Guardian, okres od 27.03 do 9.06.2023 ([RFCx Polska](https://rfcx.org/projects/poland)). Rejestratory mają pozostać na stałe ([AntyWeb](https://antyweb.pl/huawei-tech4all)). | Dowód zainteresowania parku, ale też **darmowy, sponsorowany konkurent**. Szansa: analiza ich istniejących nagrań. |
| **AudioMoth / Open Acoustic Devices** | UK | tani rejestrator open-source, nagrywa do 384 kHz ([opis produktu](https://oist.jp/node/40994)) | Zarówno **konkurent** (DIY), jak **komponent** naszego rozwiązania. |
| **BirdNET / Perch (open-source)** | USA/Niemcy/Google | modele i narzędzia do analizy nagrań | Obniżają barierę wejścia **także dla konkurencji**. Nasze przewagi: integracja, lokalne gatunki, weryfikacja, raporty, wsparcie. |
| **Dryad Silvanet** | Niemcy | czujniki gazowe wykrywania pożarów, jedna sztuka na ok. 1 ha ([ST](https://blog.st.com/?p=43695)); 400 czujników u CalFire ([tech.eu](https://tech.eu/2023/08/11/ultra-early-detection-system/)); cena przedsprzedaży 299 USD za czujnik wg [ABI Research](https://hs.abiresearch.com/market-research/insight/7782559-the-smart-way-to-prevent-wildfires-an-iot-) | Pokazuje, że **pożary mają lepszą technologię niż akustyka**. |
| **Zespoły akademickie w Polsce** (np. UAM, doktorat o PAM — [Winiarska](https://bip.amu.edu.pl/__data/assets/pdf_file/0021/554034/Winiarska-Dominika_rozprawa-doktorska.pdf)) | PL | kompetencje w pasywnym monitoringu akustycznym | **Partnerzy i zarazem konkurenci** w usługach analizy. |
| **Polski komercyjny dostawca „Voice AI dla lasów”** | PL | **nie znaleziono** w tym przeglądzie | **[DO WERYFIKACJI]** (KRS, targi, przetargi). Brak wyniku to nie dowód braku konkurencji. |

> Uwaga: nie przeprowadziłem tu przeglądu cen producentów rejestratorów klasy profesjonalnej (np. Wildlife Acoustics). Brak źródeł, więc nie podaję liczb.

### 2.5. Wybór: Koncepcja B jako rdzeń + ograniczona warstwa zdarzeń z A

**Co dokładnie:** „Słuchacz Lasu Monitor” = Koncepcja B (monitoring bioróżnorodności jako usługa) z modułem „zdarzenia” (piła, pojazd, strzał) raportowanym **zbiorczo i po weryfikacji**. Alerty „na żywo” testujemy tylko na kilku węzłach w pilotażu jako eksperyment mierzony precyzją.

**Dlaczego nie A:** niska wartość szkód, trudność odróżnienia legalnego od nielegalnego (piły i polowania są legalne), droższy sprzęt i łączność, silny konkurent.
**Dlaczego nie C:** brak potwierdzonego płatnika i najwyższe ryzyko prywatności.
**Dlaczego B:** ma najbliższy związek z istniejącymi obowiązkami monitoringu (GIOŚ, Natura 2000), mniej wymagań dotyczących czasu reakcji, a dane z tego samego strumienia zasilają warstwę zdarzeń.

---

## 3. Technologia Voice AI

### 3.1. Rekomendowany stos (gotowe, dostępne narzędzia)

| Warstwa | Narzędzie | Licencja / uwagi | Źródło |
|---|---|---|---|
| Model bazowy (embeddingi + klasyfikacja) | **Perch 2.0** (Google DeepMind) | Apache-2.0; ok. 14 795 klas, w tym ok. 10 tys. ptaków; oparty na EfficientNet-B3; wyniki SOTA na BirdSet i BEANS | [arXiv 2508.04665](https://arxiv.org/pdf/2508.04665v2), [karta modelu (HF, Apache-2.0)](https://huggingface.co/Arm/perch-v2-int8-litert) |
| Narzędzia do pracy z modelem | **OpenSoundscape** + **bioacoustics-model-zoo** | open source; model zoo ma Perch 2 w wersjach TensorFlow, TFLite i ONNX; można trenować własną „głowę” na zamrożonych embeddingach | [PyPI model zoo](https://pypi.org/project/bioacoustics-model-zoo/0.13.1/), [GitHub OpenSoundscape](https://github.com/kitzeslab/opensoundscape) |
| Szybkie budowanie nowych klas | **Agile modeling** (wyszukiwanie wektorowe + aktywne uczenie z oceną eksperta) | metoda opisana przez zespół Perch | [Google DeepMind](https://deepmind.google/discover/blog/how-ai-is-helping-advance-the-science-of-bioacoustics-to-save-endangered-species/) |
| Edge (opcjonalnie) | Perch 2 w wersji int8/LiteRT | karta modelu mówi o działaniu w czasie rzeczywistym na Raspberry Pi 5 (pakiet przygotowany przez społeczność/Arm; **do własnego zmierzenia**) | [HF](https://huggingface.co/Arm/perch-v2-int8-litert) |
| Ochrona prywatności | **VAD** (wykrywanie głosu) i usuwanie fragmentów z mową | w testach z odtwarzaniem wykrywały mowę do ok. 10 m, gdzie mowa była zrozumiała | [Cambridge repository, MEE](https://www.repository.cam.ac.uk/handle/1810/342220) |

**BirdNET — ostrzeżenie licencyjne:** kod jest na licencji MIT, ale **modele** na CC BY-NC-SA 4.0 (niekomercyjna); badania i edukacja traktowane są jako niekomercyjne ([BirdNET-Analyzer, README](https://raw.githubusercontent.com/birdnet-team/BirdNET-Analyzer/main/README.md), [dokumentacja](https://birdnet-team.github.io/BirdNET-Analyzer)). Własne modele wytrenowane z BirdNET podlegają tym samym warunkom ([FAQ](https://birdnet-team.github.io/BirdNET-Analyzer/faq.html)). **[FAKT]**
→ **Decyzja:** w produkcie komercyjnym **nie opieramy się na BirdNET**. Używamy go co najwyżej jako punktu odniesienia w badaniach, a w sprawie użycia komercyjnego kontaktujemy się z zespołem BirdNET (adres kontaktowy w dokumentacji).

### 3.2. Gotowe modele czy własne?

**Decyzja: gotowe modele jako baza + własne, małe głowy klasyfikatorów.** Nie trenujemy dużych modeli od zera (zbędny koszt).

- Własnego trenowania wymagają klasy specyficzne dla nas: piła w polskim kontekście (z kosą spalinową, ciągnikiem, crossem), strzał (myśliwski), pojazd, część gatunków lokalnych. Trening głowy na zamrożonych embeddingach to lekki proces opisany w dokumentacji model zoo ([PyPI](https://pypi.org/project/bioacoustics-model-zoo/0.13.1/)). **[FAKT]**
- **Dwa tryby przetwarzania:** (1) **chmura/serwer wsadowy** analizuje nagrania z kart SD (tanio, wysoka jakość), (2) **edge** tylko w wybranych węzłach „na żywo”.

### 3.3. Przepływ rozpoznawania i klasyfikacji

1. **Nagranie** w zaplanowanych oknach (np. świt, noc dla sów) lub ciągle w węzłach „na żywo”.
2. **Segmentacja** na okna 5 s (zgodnie z wejściem Perch 2.0: 5 s, 32 kHz — [karta ONNX](https://huggingface.co/Calotriton/perch-v2-onnx)). **[FAKT]**
3. **Filtr prywatności (VAD):** okna z mową są **usuwane lub zamazywane** przed zapisem i wysyłką.
4. **Embedding + klasyfikacja:** Perch 2.0 + głowy klasyfikatorów (gatunki + zdarzenia).
5. **Reguły kontekstowe:** pogoda (deszcz/wiatr), harmonogram prac LP, kalendarz polowań, korelacja między sąsiednimi węzłami.
6. **Weryfikacja:** próbka krótkich klipów trafia do eksperta (panel odsłuchu); decyzje wracają do treningu (aktywne uczenie).
7. **Wynik:** raport z poziomami pewności i miarą niepewności.

### 3.4. Jak ograniczamy błędne rozpoznania

| Źródło błędu | Środek zaradczy | Status |
|---|---|---|
| Legalna piła (prace LP, drewno opałowe) | **Integracja z harmonogramem prac nadleśnictwa** i oznaczanie „zdarzenie zgodne z planem”. Bez tego alert jest bezwartościowy. | **[ZAŁOŻENIE PROJEKTOWE]** — do zbadania w wywiadach: czy nadleśnictwa udostępnią harmonogram w formie użytecznej. |
| Dźwięki podobne do piły (kosa, kosiarka, motocykl, skuter) | Klasy „konfuzory” w treningu, drugie okno potwierdzające, sąsiedni węzeł | konfuzory z literatury: [Anđelić i in.](https://tfsa.ucg.ac.me/pap/tfsa-001454.pdf) |
| Deszcz, wiatr | Gating przez czujnik pogody i klasy „szumowe” | **[ZAŁOŻENIE]** |
| Strzały (łowiectwo legalne) | Kalendarz polowań + raportowanie liczby zdarzeń, nie „alarm” | **[ZAŁOŻENIE]** |
| Niska pewność | Próg per klasa i per lokalizacja, reguła „N z M okien” | standardowa praktyka, **[ZAŁOŻENIE]** |
| Obciążenie danymi z literatury | Wyniki z literatury to dane z zestawów testowych: np. dokładność 92,59% w zestawie 27 klas ([Sensors 2023](https://pmc.ncbi.nlm.nih.gov/articles/PMC9966992/table/sensors-23-02032-t009)) i 94,4% dla piły w innej pracy ([Sensors 2021](https://pmc.ncbi.nlm.nih.gov/articles/PMC8624687/table/sensors-21-07593-t001)). **Nie przenoszę ich na warunki terenowe.** | **[FAKT]** o literaturze; w terenie wartości **[DO WERYFIKACJI]** w pilotażu |

> **Uwaga o metrykach:** dokładność (accuracy) w rzadkich zdarzeniach jest myląca. W pilotażu mierzymy **precyzję i czułość per klasa** oraz **liczbę fałszywych alarmów na węzeł na tydzień**.

### 3.5. Prywatność i RODO (twarde ograniczenie projektowe)

- Głos człowieka może być daną osobową. Przewodnik IUCN (Tech4Nature, 2026) omawia ramy prawne i etyczne monitoringu w obszarach chronionych, w tym RODO dla obrazu i dźwięku, i zastrzega, że nie jest poradą prawną ([IUCN](https://iucn.org/sites/default/files/2026-11/T4N_Legal%20and%20Ethical%20Guide_EN.pdf)). **[FAKT]**
- Przykład dobrej praktyki: projekt SOPRANO (Edynburg) przeprowadził DPIA, oznakowuje obszar i przetwarza nagrania z możliwą obecnością człowieka w kontrolowany sposób ([University of Edinburgh](https://information-services.ed.ac.uk/iot/soprano-project)). **[FAKT]**
- **Nasze środki:** VAD na urządzeniu, brak zapisu mowy, minimalizacja danych, DPIA, tablice informacyjne, umowy powierzenia z zamawiającym. Konkretną podstawę prawną w Polsce (RODO, zgoda zarządcy terenu, ewentualne zezwolenia parku) **[DO WERYFIKACJI]** u prawnika przed pierwszym wdrożeniem.

---

## 4. Urządzenie i infrastruktura

### 4.1. Architektura dwupoziomowa

| Typ | Do czego | Kluczowe cechy |
|---|---|---|
| **Rejestrator R (offline)** | Główny „koń roboczy” MVP: zbieranie danych, monitoring sezonowy | gotowy rejestrator klasy AudioMoth w obudowie IPX7; wymiana kart SD co kilka tygodni; analiza wsadowa w chmurze |
| **Węzeł L (live)** | 5–6 sztuk w pilotażu: eksperyment z alertami i telemetrią | własna elektronika, modem komórkowy, panel słoneczny + akumulator, analiza na brzegu |

**Uzasadnienie:** zasilanie i łączność w lesie zimą to największe ryzyko sprzętowe (rozdz. 7). Dlatego większość danych zbieramy tanimi rejestratorami, a drogi węzeł „na żywo” ograniczamy do kilku testów.

### 4.2. Komponenty, parametry i ceny

| Komponent | Wybór | Parametry (źródło) | Cena | Status |
|---|---|---|---|---|
| Rejestrator R | AudioMoth 1.2.0 + obudowa IPX7 | do 384 kHz, zapis WAV na microSD, 3 baterie AA ([OIST](https://oist.jp/node/40994)); 79,99 GBP + 39,99 GBP za obudowę, z VAT ([zestawienie](https://sites.google.com/view/dun-coillich/home/biodiversity/monitoring-equipment)); inna oferta 79,99 USD ([GroupGets](https://reach.dog/shop/groupgets/products/audiomoth-v1-2-0)) | ok. **120 GBP ≈ 600–700 zł za zestaw** przy założonym kursie | **[FAKT]** ceny; **[ZAŁOŻENIE]** kurs i brak ceł/transportu |
| Komputer węzła L | Raspberry Pi **Compute Module 4 w wersji rozszerzonej temperaturowo** | −40…+85°C dla wariantów ET (standardowe −20…+85°C) ([Raspberry Pi](https://www.raspberrypi.com/news/new-extended-temperature-range-for-compute-module-4), [product brief](https://pip-assets.raspberrypi.com/categories/634-raspberry-pi-compute-module-4/documents/RP-008169-DS-8-cm4-product-brief.pdf)). Najtańszy ET kosztuje 50 USD wobec 30 USD wersji standardowej ([Notebookcheck](https://www.notebookcheck.net/Raspberry-Pi-Compute-Module-4-gets-rugged-upgrades.971861.0.html)). | wariant z większą pamięcią **[SZACUNEK WŁASNY]** 60–100 USD | **[FAKT]** zakres temp.; **[SZACUNEK]** cena docelowego wariantu |
| Komputer (alternatywa) | Raspberry Pi 5 | cena katalogowa 50–120 USD zależnie od RAM ([product brief](https://cdn.sparkfun.com/assets/9/9/0/d/e/raspberry-pi-5-product-brief.pdf)); **zakres temperatur nie zweryfikowany** | — | **[DO WERYFIKACJI]** do pracy zimą |
| Mikrofon | MEMS/USB, wiatrochron (futerko) i membrana | AudioMoth zaleca piankę na porcie mikrofonu, aby ograniczyć hałas wiatru ([OIST](https://oist.jp/node/40994)) | **[SZACUNEK WŁASNY]** 100–200 zł | **[ZAŁOŻENIE]** dobór po testach |
| Zasilanie | panel PV + akumulator + regulator | **zob. 4.4: główny problem** | **[SZACUNEK WŁASNY]** 600–900 zł | **[ZAŁOŻENIE]** |
| Łączność | modem LTE-M/NB-IoT lub LoRaWAN | zasięg w terenie **[DO WERYFIKACJI]** | **[SZACUNEK WŁASNY]** 150 zł + abonament ok. 20–30 zł/mies. | **[ZAŁOŻENIE]** |
| Obudowa i montaż | IP67, dławiki, zawiesie na drzewo, zabezpieczenie | gryzonie i ssaki potrafią uszkadzać obudowy AudioMoth — pojedyncze środki odstraszające nie zapobiegły żuciu ([Goodman i in., MDPI/PMC](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC13468931/)) | **[SZACUNEK WŁASNY]** 200–400 zł | **[FAKT]** o ryzyku |

**Szacunkowy koszt prototypu węzła L:** ok. **1,6–2,5 tys. zł** **[SZACUNEK WŁASNY: suma pozycji z tabeli, bez robocizny]**.

### 4.3. Odporność na warunki w Polsce

| Warunek | Zagrożenie | Środek | Weryfikacja |
|---|---|---|---|
| Mróz (poniżej −20°C) | wyłączenie elektroniki, awaria akumulatora | moduł ET (−40°C), akumulator dobrany do niskich temperatur | test zimowy w grudniu–lutym |
| Upał | przegrzanie w obudowie nasłonecznionej | cień (zawieszenie pod koroną), wentylacja pasywna | test letni |
| Wilgoć i deszcz | korozja, kondensacja | IP67, osuszacze, membrana akustyczna; praktyka dla AudioMoth: wodoodporna membrana i żel krzemionkowy (około 8 USD za sztukę wg [Mongabay](https://news.mongabay.com/2018/01/audiomoth-device-aims-to-deliver-low-cost-power-efficient-monitoring-of-remote-landscapes)) | komora lub test terenowy |
| Śnieg i szron | zasypanie panelu/mikrofonu, oblodzenie | montaż wysoko, osłona mikrofonu | test zimowy |
| Zwierzęta | gryzienie obudów | materiały i konstrukcja, nie tylko repelenty | obserwacja w terenie |
| Kradzież/wandalizm | utrata sprzętu | ukrycie, oznakowanie, GPS | **[ZAŁOŻENIE]**: budżet na utratę 5–10% |

### 4.4. Zużycie energii i zasilanie (wyliczenia własne, zweryfikować pomiarem)

**Dane referencyjne:** AudioMoth z bateriami litowymi 3000 mAh potrafi nagrywać 115 dni przy 8 kHz w trybie 30 s co 5 min oraz 9 dni nagrywania ciągłego przy 48 kHz (dane Hill i in. cytowane w [Stahlman & Kitzes, PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC10256106/)). **[FAKT]**
→ Rejestrator R pracuje miesiącami na bateriach. Węzeł L z komputerem klasy Raspberry Pi pobiera nieporównywalnie więcej.

**Rachunek poglądowy węzła L [SZACUNEK WŁASNY]:**

| Pozycja | Wartość | Skąd |
|---|---|---|
| Średnia moc (komputer + mikrofon + modem) | **2 W** | **[ZAŁOŻENIE]**, trzeba zmierzyć |
| Zapotrzebowanie dobowe | 2 W × 24 h = **48 Wh/dobę** | obliczenie |
| Uzysk z panelu 20 W zimą pod koroną | rzędu **kilku Wh/dobę** | **[ZAŁOŻENIE]**: niskie nasłonecznienie zimą i zacienienie; zweryfikować w [PVGIS](https://re.jrc.ec.europa.eu/pvg_tools/en/) (narzędzie UE, nie sprawdzone w tym przeglądzie) |
| Wniosek | **ciągła praca z AI na komputerze klasy Pi nie utrzyma się na małym panelu zimą** | **[WNIOSEK z założeń]** |

**Konsekwencje projektowe (decyzja PM):**
1. **Cykl pracy (duty cycling):** węzeł śpi, budzi się w oknach nagrań i na zdarzenie wykryte przez mały układ (MCU).
2. **Mały klasyfikator na MCU** jako „wyzwalacz”: literatura pokazuje sieć CNN do wykrywania piły działającą na układzie ARM Cortex-M4F z 256 kB RAM ([Sensors 2021](https://pmc.ncbi.nlm.nih.gov/articles/PMC8624687)). **[FAKT]**
3. W MVP: węzły L tam, gdzie możliwe jest **zasilanie sieciowe lub duży akumulator wymieniany** (np. przy leśniczówce, wiacie), a solarne tylko eksperymentalnie.

### 4.4a. Koszty utrzymania (na węzeł/rok) **[SZACUNEK WŁASNY]**

| Pozycja | Zł/rok | Założenie |
|---|---|---|
| Łączność (węzeł L) | ok. 300 | 25 zł/mies. |
| Wizyty serwisowe | ok. 600 | 2–3 wizyty × 200–300 zł (dojazd + czas) |
| Wymiana akumulatorów/kart, naprawy, straty | ok. 400 | 20% wartości sprzętu rocznie |
| Chmura (przechowywanie i analiza) | ok. 200 | zależy od ilości audio; **[DO WERYFIKACJI]** |
| **Razem (węzeł L)** | **ok. 1500 zł** | suma |

---

## 5. MVP i plan działania

### 5.1. Minimalny zespół

| Rola | Wymiar | Uwaga |
|---|---|---|
| PM / CEO / sprzedaż B2G | 1 etat (współzałożyciel) | wywiady, przetargi, relacje z parkami i LP |
| Inżynier ML / audio | 1 etat (współzałożyciel) | modele, dane, ewaluacja |
| Inżynier embedded / hardware | 1 etat (współzałożyciel) | węzeł L, zasilanie, testy |
| Full-stack | 0,5 etatu | panel, API, pipeline |
| Bioakustyk / ornitolog (konsultant) | ok. 0,2 etatu | **kluczowe**: etykietowanie, weryfikacja, wiarygodność wobec klienta |
| Prawnik (usługi doraźne) | godziny | RODO/DPIA, umowy, licencje |

### 5.2. Harmonogram (start: styczeń 2027)

| Etap | Czas | Gotówka (bez pensji) **[SZACUNEK WŁASNY]** | Rezultat |
|---|---|---|---|
| **0. Walidacja potrzeb** (+ test zimowy 2 prototypów) | M1–M2 (sty–lut 2027) | 15 tys. zł (+ ok. 5 tys. zł na 2 prototypy testowe) | 15 wywiadów; min. 3 listy intencyjne (LOI); decyzja GO/NO-GO; wstępna opinia prawna (RODO, licencje) |
| **1. Zebranie nagrań** | M1–M4 (lut–maj) | 45 tys. zł (20 zestawów R ≈ 14 tys., podróże, karty, etykietowanie ekspertem) | zbiór nagrań z ≥3–4 stanowisk, sezon sów i chóru świtu; zbiór etykiet (**cel [ZAŁOŻENIE]**: kilka tysięcy zaetykietowanych okien 5 s) |
| **2. Model AI** | M3–M5 (mar–maj) | 15 tys. zł | głowy klasyfikatorów na Perch 2.0 dla ok. 15–20 klas; raport czułości i precyzji **na stanowisku niewidzianym w treningu** |
| **3. Prototyp sprzętu** | M3–M6 | 50 tys. zł (6 węzłów L, obudowy, badania środowiskowe zlecone) | 6 węzłów L, 20 rejestratorów R, instrukcja montażu |
| **4. Oprogramowanie** | M4–M7 | 10 tys. zł | panel (mapa, wykresy, odsłuch klipów), pipeline analizy wsadowej, szablon raportu |
| **5. Testy terenowe** | M6–M8 (cze–sie) | 20 tys. zł | wyniki testu upału, deszczu, zasilania; lista poprawek; **bramka**: decyzja o pilotażu |
| **6. Pilotaż** | M9–M14 (wrz 2027–lut 2028) | 60 tys. zł (serwis, podróże, straty sprzętu, chmura) | pilotaż u 1 klienta, pełny raport, ocena KPI, oferta komercyjna |
| **Rezerwa 20% + spółka i marketing** | cały okres | ok. 70 tys. zł | — |

**Razem gotówka (bez pensji): ok. 285–290 tys. zł [SZACUNEK WŁASNY: suma wierszy + rezerwa].**

### 5.3. Całkowity budżet MVP **[SZACUNEK WŁASNY]**

| Wariant | Pensje (14 mies.) | Gotówka | Razem |
|---|---|---|---|
| **Lean** (założyciele ok. 8 tys. zł/mies. każdy; 0,5 dev 8 tys.; konsultant 4 tys. → **36 tys. zł/mies.**) | 36 × 14 ≈ **504 tys. zł** | ok. 290 tys. zł | **ok. 0,8 mln zł** |
| **Rynkowy** (**ok. 75 tys. zł/mies.** łącznych kosztów zespołu **[ZAŁOŻENIE]**) | 75 × 14 ≈ **1 050 tys. zł** | ok. 290 tys. zł | **ok. 1,35 mln zł** |

> Stawki wynagrodzeń to założenia, nie dane rynkowe z źródeł. Ceny w zł są przybliżone, kurs walut i cła niezweryfikowane.

**Możliwe finansowanie (wszystko [DO WERYFIKACJI] pod kątem warunków i terminów):**
- Granty i programy dla startupów (np. nabór partnera projektu Inno_LAB w ramach FENG 2021–2027, planowany na lata 2026–2029 — [gov.pl](https://www.gov.pl/web/rozwoj-technologia/otwarty-nabor-na-partnera-do-realizacji-projektu-innolab---nowy-model-akceleracji-startupow-o-wysokim-potencjale-wzrostu)). **[FAKT]** o istnieniu programu; **[DO WERYFIKACJI]** czy i jak startup może uzyskać wsparcie.
- Płatny pilotaż od klienta publicznego, w tym z mechanizmu „przedsięwzięć wspólnych” LP finansowanych z funduszu leśnego (zarządzenie DGLP z 26.06.2026 odwołuje się do art. 58 ust. 2 ustawy o lasach — [gov.pl](https://www.gov.pl/attachment/e21b5d65-6c1f-49fa-a3e9-61bc0dd4db63)). **[FAKT]** o odwołaniu; **[DO WERYFIKACJI]** czy to ścieżka dla dostawcy.

---

## 6. Biznes i klienci

### 6.1. Ocena potencjalnych klientów

| Klient | Problem, który rozwiązujemy | Decydent (hipoteza) | Szybkość sprzedaży | Ocena |
|---|---|---|---|---|
| **Parki narodowe** | monitoring gatunków (np. sowy), presja turystyczna | dyrektor parku, dział nauki/ochrony **[ZAŁOŻENIE]** | średnia | **Najlepszy pierwszy cel** |
| **Nadleśnictwa / RDLP** | monitoring przyrody, obszary wyłączone z pozyskania, Natura 2000 | nadleśniczy, specjalista ds. ochrony przyrody **[ZAŁOŻENIE]** | wolna (struktura: 431 nadleśnictw, [Sejm](https://api.sejm.gov.pl/sejm/term10/committees/OSZ/sittings/105/html)) | **Drugi cel, największy rynek** |
| **Instytucje naukowe** | taniej i szybciej analizować nagrania | kierownik projektu/zespołu | szybka, ale małe budżety | **Partner walidacyjny** |
| **Samorządy** | lasy podmiejskie i hałas | wydział środowiska | wolna, niepewny popyt | niski priorytet |
| **Organizacje ekologiczne** | dowody dla działań ochronnych | zarząd/dyrektor | szybka, małe budżety | okazjonalnie |

> **Uwaga:** informacje o budżetach i procedurach zakupowych poszczególnych podmiotów **nie zostały zweryfikowane**. Wywiady (etap 0) to najtańszy sposób, aby to sprawdzić.

### 6.2. Rekomendowany pierwszy klient

**Park narodowy z doświadczeniem w nagraniach, w pierwszej kolejności Białowieski PN** (we współpracy z jego nadleśnictwem/otoczeniem naukowym). Argumenty:
- Park już zainwestował w stały system: 70 rejestratorów AudioMoth Edge, które mają pozostać w terenie ([AntyWeb](https://antyweb.pl/huawei-tech4all), [RFCx](https://rfcx.org/projects/poland)). **[FAKT]**
- W projekcie zaplanowano analizę zaledwie 17 osobników (15 ptaków, 2 ssaki), więc istnieje **luka w analizie** większych zbiorów ([AntyWeb](https://antyweb.pl/huawei-tech4all)). **[FAKT]** → **[ZAŁOŻENIE]**: park może potrzebować taniej, powtarzalnej analizy już zebranych nagrań.
- **Pierwsza oferta bez sprzętu:** „zanalizujemy Wasze istniejące nagrania i pokażemy raport”, czyli test wartości przed jakimkolwiek wdrożeniem sprzętu.

**Dlaczego klient miałby zapłacić (hipotezy do wywiadów):** oszczędność godzin odsłuchu eksperta, powtarzalność, ciągłość pomiaru (także nocą i zimą), dowody dla raportowania.

### 6.3. Model przychodów (ceny **[SZACUNEK WŁASNY]**, do weryfikacji w wywiadach)

| Strumień | Cena orientacyjna | Uwagi |
|---|---|---|
| **A. Analiza nagrań klienta (usługa jednorazowa)** | zryczałtowana za godzinę/stanowisko | **wejście na rynek**, bez sprzętu |
| **B. Monitoring jako usługa (MaaS)** | **250–400 zł/węzeł/miesiąc** (sprzęt w dzierżawie, analiza w cenie) | docelowy główny przychód |
| **C. Raporty sezonowe z weryfikacją eksperta** | **15–30 tys. zł za stanowisko/sezon** | wysoka marża, praca eksperta |
| **D. Sprzedaż urządzeń** | marża na węźle | tylko dla klientów wymagających własności; mniejsza przewidywalność przychodu |

### 6.4. Rachunek jednostkowy i próg rentowności **[SZACUNEK WŁASNY]**

Założenia: abonament 350 zł/mies. = **4 200 zł/rok**; koszt sprzętu węzła 2 000 zł amortyzowany przez 3 lata (**ok. 667 zł/rok**); łączność **300**; serwis **600**; chmura i wsparcie **400**.

- Koszt roczny węzła ≈ 667 + 300 + 600 + 400 = **1 967 zł** → marża brutto ≈ 4 200 − 1 967 = **2 233 zł/węzeł/rok (ok. 53%)**.
- Koszty stałe zespołu: lean ≈ 36 tys. zł/mies. = **432 tys. zł/rok**; rynkowy ≈ 75 tys. zł/mies. = **900 tys. zł/rok**.
- **Próg rentowności:** lean ≈ 432 000 / 2 233 ≈ **ok. 195 węzłów**; rynkowy ≈ 900 000 / 2 233 ≈ **ok. 400 węzłów**. (Bez kosztów sprzedaży i podatków, więc w praktyce wyżej, rząd **200–600**.)

### 6.5. Wielkość rynku w Polsce (obliczenie poglądowe) **[SZACUNEK WŁASNY]**

Jeśli każde nadleśnictwo (431, wg [Sejm](https://api.sejm.gov.pl/sejm/term10/committees/OSZ/sittings/105/html)) kupiłoby 10 węzłów, to 431 × 10 × 4 200 zł ≈ **18 mln zł/rok**. Parki narodowe (liczba **[DO WERYFIKACJI]**, ok. dwóch dziesiątek) po np. 30 węzłów to rząd **3 mln zł/rok**. Razem ok. **20 mln zł/rok** przy bardzo optymistycznej penetracji **100%**. Realna penetracja będzie wielokrotnie niższa.

> **Wniosek krytyczny:** polski rynek wystarcza na zdrową, niewielką firmę (dziesiątki węzłów u kilku klientów daje przychód rzędu setek tysięcy złotych), ale **nie na szybki wzrost venture bez ekspansji zagranicznej** lub dodatkowych linii produktowych. Warto to powiedzieć inwestorom i grantodawcom otwarcie.

### 6.6. Sygnały budżetowe po stronie LP

- LP zarządzają ok. **7,6 mln ha** (ok. ¼ powierzchni kraju) ([RDLP Katowice](https://www.gov.pl/attachment/dc902c59-ef63-4160-9800-8578066d233b)). **[FAKT]**
- Wynik LP za 2024 r. miał wynieść ponad 800 mln zł brutto według wypowiedzi ministra w Sejmie ([stenogram](https://api.sejm.gov.pl/sejm/term10/proceedings/33/2025-04-24/transcripts/123)); **wypowiedź polityczna, [DO WERYFIKACJI]** w sprawozdaniu finansowym.
- Są doniesienia medialne o sięganiu rządu po 200 mln zł z LP ([wnp.pl](https://www.wnp.pl/budownictwo/rzad-siega-po-200-mln-zl-z-lasow-panstwowych-branza-alarmuje-to-drugi-fundusz-sprawiedliwosci,1081828.html)); treść nie została tu zweryfikowana. **Ryzyko:** presja na budżety może spowolnić zakupy innowacyjne.

---

## 7. Ryzyka i rekomendacja

### 7.1. Trzy największe ryzyka i tania weryfikacja przed kosztownym rozwojem

| # | Ryzyko | Dlaczego groźne | Tania weryfikacja | Koszt / czas | Kryterium „przechodzimy dalej” **[ZAŁOŻENIE]** |
|---|---|---|---|---|---|
| **1** | **Jakość AI w prawdziwym polskim lesie** (legalne piły, polowania, deszcz, wiatr; zmiana domeny między stanowiskami) | decyduje o zaufaniu i o tym, czy alerty mają sens | 5–10 rejestratorów AudioMoth na 2–3 stanowiskach przez 4–8 tygodni, Perch 2.0 + etykietowanie ekspertem, test na stanowisku niewidzianym w treningu | ok. 20–30 tys. zł, 6–8 tygodni | sowy: czułość ≥ 80% względem eksperta na wspólnych oknach; zdarzenia: precyzja ≥ 70% po reguła „N z M okien”; ≤ 2 fałszywe zdarzenia/węzeł/tydzień po filtrach |
| **2** | **Zasilanie, łączność i trwałość zimą** | węzły L mogą nie przetrwać, a bez nich nie ma alertów | 2 prototypy węzła L w terenie od grudnia do lutego, rejestrowanie poboru mocy i temperatury | ok. 5–8 tys. zł, 2–3 miesiące | ≥ 90% czasu pracy w okresie; udowodnione zasilanie przez ≥ 4 tygodnie bez interwencji lub plan wymiany akumulatora |
| **3** | **Biznes: brak płatnika i trudna procedura zakupu; ryzyko prawne (RODO, licencje, zgoda zarządcy)** | można zbudować dobry produkt, którego nikt nie kupi | 15 wywiadów (parki, nadleśnictwa, RDOŚ, firmy przyrodnicze), oferta „analiza Waszych nagrań”, konsultacja prawna (RODO/DPIA, licencje) | ok. 15–25 tys. zł, 6–8 tygodni | ≥ 3 listy intencyjne lub zamówienia na płatny pilotaż; potwierdzenie, że dane z PAM mogą wspierać wymagany monitoring; brak blokującej bariery prawnej |

**Ryzyka dodatkowe (krótko):** konkurencja darmowa (BirdNET, Perch, sponsorowane projekty), licencja BirdNET (rozwiązana wyborem Perch), kradzież/zniszczenie sprzętu, mała skala rynku (rozdz. 6.5), zależność od jednego klienta.

### 7.2. Decyzja Product Managera (odpowiedzi na osiem pytań)

**1. Co dokładnie budujemy?**
Akustyczny system monitoringu przyrody i presji człowieka w lesie: sieć rejestratorów (R) i kilku węzłów „na żywo” (L), pipeline AI na bazie Perch 2.0 z naszymi głowami klasyfikatorów, panel z weryfikacją ekspercką oraz raporty. Rdzeń to wykrywanie **gatunków (priorytet: sowy)**; warstwa **zdarzeń** (piła, pojazd, strzał) jest dodatkiem raportowanym po weryfikacji.

**2. Dlaczego potrzebujemy Voice AI?**
Bo przedmiotem jest **dźwięk**: ptaki, w tym sowy aktywne nocą, mają głos, który na czujnikach obrazu nie jest widoczny, a ręczny odsłuch tysięcy godzin nagrań jest nieopłacalny. AI zamienia nagrania w dane. Bez niej mielibyśmy tylko tani rejestrator. W tym sensie AI jest **wartością produktu**, a nie dodatkiem do monitoringu wideo. **Zastrzeżenie:** wartość wymaga potwierdzenia jakości w teście (ryzyko 1).

**3. Kto za to zapłaci?**
Pierwszy płatnik: park narodowy lub nadleśnictwo/RDLP (budżet ochrony przyrody, własne środki lub granty). Dodatkowo firmy przyrodnicze i instytucje naukowe. **[ZAŁOŻENIE do wywiadów]**: faktyczne budżety i procedury.

**4. Jak będzie działał produkt?**
Rejestratory nagrywają w zaplanowanych oknach. Nagrania trafiają (z kart SD lub łączem) do analizy: VAD usuwa mowę, Perch 2.0 + nasze głowy wykrywają gatunki i zdarzenia, reguły kontekstowe odrzucają znane źródła fałszywych trafień, ekspert weryfikuje próbkę, a klient dostaje panel i raport. Węzły L dodatkowo wysyłają zdarzenia w czasie zbliżonym do rzeczywistego (eksperyment).

**5. Ile kosztuje MVP i ile potrwa?**
Ok. **0,8 mln zł (lean) do 1,35 mln zł (koszty rynkowe)**, w tym ok. 290 tys. zł gotówki bez pensji **[SZACUNEK WŁASNY]**; **ok. 14 miesięcy** do końca pilotażu (rozdz. 5). Pierwsza faza walidacji: ok. 60–80 tys. zł gotówki i 2 miesiące w trzech tanich testach z rozdz. 7.1.

**6. Co znajdzie się w pierwszej wersji, a z czego rezygnujemy?**

| W v1 | Rezygnujemy (na razie) |
|---|---|
| Detekcja sów i wybranych ptaków | Wykrywanie pożarów akustycznie |
| Zdarzenia: piła, pojazd, strzał (raport po weryfikacji) | Alerty na żywo jako funkcja produkcyjna |
| Filtr prywatności (VAD) | Rozpoznawanie treści mowy (nigdy) |
| Panel z odsłuchem klipów i raport sezonowy | Lokalizacja źródła dźwięku (triangulacja) |
| Rejestratory R + 5–6 węzłów L | Nietoperze (ultradźwięk) |
| Analiza wsadowa w chmurze | Własny, duży model trenowany od zera |
| — | Aplikacja mobilna, publiczne API, skalowanie na cały kraj |

**7. Jak zdobędziemy pierwszego klienta?**
(1) Wywiady z dyrekcjami parków i nadleśnictw (etap 0). (2) Oferta „darmowej próbki”: analiza krótkiego zbioru ich istniejących nagrań i pokazanie raportu. (3) Wejście przez partnera naukowego (zespoły z doświadczeniem PAM, np. [UAM](https://bip.amu.edu.pl/__data/assets/pdf_file/0021/554034/Winiarska-Dominika_rozprawa-doktorska.pdf)). (4) Wniosek o płatny pilotaż (sezon 2027/28). (5) Dopiero potem sprzęt.

**8. Jak zmierzymy sukces pilotażu?** (**cele [ZAŁOŻENIE]**, do uzgodnienia z klientem)

| KPI | Cel |
|---|---|
| Czułość wykrywania sów wobec odsłuchu eksperta | ≥ 80% (okna wspólne) |
| Precyzja zdarzeń (po filtrach) | ≥ 70% |
| Fałszywe zdarzenia | ≤ 2 na węzeł na tydzień |
| Dostępność węzłów (czas pracy) | ≥ 90% w pilotażu (w tym zima) |
| Oszczędność czasu eksperta (godziny odsłuchu) | ≥ 50% względem pełnego ręcznego odsłuchu |
| Biznes | podpisana oferta/umowa komercyjna lub płatne przedłużenie po pilotażu; NPS/ocena klienta |
| Prywatność | 0 incydentów; DPIA ukończone; brak zapisu mowy |

### 7.3. Rekomendacja końcowa

**GO warunkowe.** Zatwierdzam fazę walidacji (wywiady, analiza istniejących nagrań, 5–10 rejestratorów, 2 prototypy zimowe). Przechodzimy do budowy prototypu węzła L i pilotażu **tylko po spełnieniu kryteriów z 7.1**. Jeśli ryzyko 3 (płatnik) się potwierdzi negatywnie, **przekształcamy projekt w usługę analizy nagrań** (model A z 6.3) bez własnego sprzętu. To najtańsza wersja firmy i może okazać się docelowa.

---

## Wykaz źródeł (bezpośrednie linki)

**Technologia i modele**
- Perch 2.0 (arXiv): https://arxiv.org/pdf/2508.04665v2
- Perch 2.0, blog Google DeepMind (agile modeling): https://deepmind.google/discover/blog/how-ai-is-helping-advance-the-science-of-bioacoustics-to-save-endangered-species/
- Perch 2 int8 LiteRT (karta modelu, Apache-2.0): https://huggingface.co/Arm/perch-v2-int8-litert
- Perch 2 ONNX (wejście 5 s, 32 kHz): https://huggingface.co/Calotriton/perch-v2-onnx
- bioacoustics-model-zoo: https://pypi.org/project/bioacoustics-model-zoo/0.13.1/
- OpenSoundscape: https://github.com/kitzeslab/opensoundscape
- BirdNET-Analyzer (licencje): https://raw.githubusercontent.com/birdnet-team/BirdNET-Analyzer/main/README.md · https://birdnet-team.github.io/BirdNET-Analyzer · https://birdnet-team.github.io/BirdNET-Analyzer/faq.html
- Detekcja piły na MCU (Sensors 2021): https://pmc.ncbi.nlm.nih.gov/articles/PMC8624687 · tabela porównawcza: https://pmc.ncbi.nlm.nih.gov/articles/PMC8624687/table/sensors-21-07593-t001
- Tabela dokładności (Sensors 2023): https://pmc.ncbi.nlm.nih.gov/articles/PMC9966992/table/sensors-23-02032-t009
- Detekcja piły, dźwięki podobne (IEEE): https://tfsa.ucg.ac.me/pap/tfsa-001454.pdf
- VAD w danych eko-akustycznych: https://www.repository.cam.ac.uk/handle/1810/342220

**Sprzęt**
- AudioMoth (HardwareX / koszt ok. 43 USD): https://ora.ox.ac.uk/objects/uuid:17e01cea-25ff-484d-b8ec-85a8ccc14cd3/files/mc8e85d7bbbe142538b2ba14224d1b870
- AudioMoth 1.2.0 (opis): https://oist.jp/node/40994
- Ceny AudioMoth (zestawienie): https://sites.google.com/view/dun-coillich/home/biodiversity/monitoring-equipment · https://reach.dog/shop/groupgets/products/audiomoth-v1-2-0
- Żywotność baterii AudioMoth: https://pmc.ncbi.nlm.nih.gov/articles/PMC10256106/
- Uszkodzenia przez ssaki: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC13468931/
- Membrana i żel (Mongabay): https://news.mongabay.com/2018/01/audiomoth-device-aims-to-deliver-low-cost-power-efficient-monitoring-of-remote-landscapes
- Raspberry Pi CM4 ET: https://www.raspberrypi.com/news/new-extended-temperature-range-for-compute-module-4 · https://pip-assets.raspberrypi.com/categories/634-raspberry-pi-compute-module-4/documents/RP-008169-DS-8-cm4-product-brief.pdf · https://www.notebookcheck.net/Raspberry-Pi-Compute-Module-4-gets-rugged-upgrades.971861.0.html
- Raspberry Pi 5 (ceny): https://cdn.sparkfun.com/assets/9/9/0/d/e/raspberry-pi-5-product-brief.pdf

**Konkurencja**
- RFCx Guardian: https://rfcx.org/guardian · przegląd: https://panorama.solutions/sites/default/files/rainforest_connection_overview.pdf
- RFCx Polska (Białowieża): https://rfcx.org/projects/poland · https://antyweb.pl/huawei-tech4all · https://superbiz.se.pl/technologie/huawei-wdraza-system-nature-guardian-w-polskiej-puszczy-bialowieskiej-aby-chronic-bioroznorodnosc-aa-YY8J-dDUr-2y1r.html
- RFCx Kolumbia (ograniczenia): https://rfcx.org/projects/colombia
- Dryad Silvanet: https://blog.st.com/?p=43695 · https://blog.semtech.com/fighting-wildfires-and-combating-climate-change-with-lorawan · https://tech.eu/2023/08/11/ultra-early-detection-system/ · https://hs.abiresearch.com/market-research/insight/7782559-the-smart-way-to-prevent-wildfires-an-iot-
- Akademickie PAM w Polsce (UAM): https://bip.amu.edu.pl/__data/assets/pdf_file/0021/554034/Winiarska-Dominika_rozprawa-doktorska.pdf

**Polska: lasy, dane i klienci**
- Raport o stanie lasów 2024, wystąpienie w Sejmie: https://api.sejm.gov.pl/sejm/term10/committees/OSZ/sittings/105/html
- Szkodnictwo leśne: https://journals.us.edu.pl/index.php/ppgos/article/download/13933/11549
- Pożary (IBL): https://www.ibles.pl/wp-content/uploads/2025/11/10.48538-lpb-2025-0015.pdf
- Sowy GIOŚ: https://www.gov.pl/web/gios/miedzynarodowy-dzien-ptakow · metodyka sów w OPN: https://opn.gov.pl/pliki-do-pobrania/otworz/bf85092c-f2a4-4d01-ac68-22bb7fe97a5b.pdf
- Przetarg GIOŚ 2026–2028: https://ted.europa.eu/en/notice/537008-2026/pdf
- Wyłączenia z pozyskania: https://www.rp.pl/gospodarka/art44348121-wiceminister-klimatu-mikolaj-dorozala-jesli-wygra-kontrreformacja-odejde
- Lasy społeczne: https://ios.edu.pl/wp-content/uploads/2026/05/ruszyl-drugi-etap-pilotazu-wyznaczania-lasow-spolecznych-wokol-najwiekszych-aglomeracji-w-polsce-2.pdf
- LP, powierzchnia: https://www.gov.pl/attachment/dc902c59-ef63-4160-9800-8578066d233b
- Stenogram (wynik LP): https://api.sejm.gov.pl/sejm/term10/proceedings/33/2025-04-24/transcripts/123
- Doniesienia o 200 mln zł z LP: https://www.wnp.pl/budownictwo/rzad-siega-po-200-mln-zl-z-lasow-panstwowych-branza-alarmuje-to-drugi-fundusz-sprawiedliwosci,1081828.html
- Zarządzenie DGLP (przedsięwzięcia wspólne): https://www.gov.pl/attachment/e21b5d65-6c1f-49fa-a3e9-61bc0dd4db63
- Inno_LAB: https://www.gov.pl/web/rozwoj-technologia/otwarty-nabor-na-partnera-do-realizacji-projektu-innolab---nowy-model-akceleracji-startupow-o-wysokim-potencjale-wzrostu

**Prawo i prywatność**
- IUCN Tech4Nature, przewodnik prawny i etyczny (2026): https://iucn.org/sites/default/files/2026-11/T4N_Legal%20and%20Ethical%20Guide_EN.pdf
- SOPRANO (DPIA, praktyka): https://information-services.ed.ac.uk/iot/soprano-project

## Czego ten przegląd nie rozstrzyga (uczciwa lista luk)

1. Brak zweryfikowanych budżetów i procedur zakupowych parków i nadleśnictw (wymaga wywiadów).
2. Brak potwierdzenia, czy dane z rejestratorów będą uznane w obowiązkowych monitoringach GIOŚ/Natura 2000.
3. Brak własnych pomiarów skuteczności modelu na polskich nagraniach, a liczby z literatury to dane laboratoryjne/zestawy testowe.
4. Ceny, kursy walut, cła, stawki wynagrodzeń i koszty chmury to założenia lub szacunki, zaznaczone w tekście.
5. Brak przeglądu polskiego rynku komercyjnych dostawców (KRS, targi, przetargi) i cen profesjonalnych rejestratorów.
6. Podstawy prawne montażu urządzeń w lasach LP i parkach oraz szczegóły RODO wymagają opinii prawnika.
7. Dane o kradzieżach drewna pochodzą z lat 2019–2020. Warto je zaktualizować w najnowszych raportach LP.
