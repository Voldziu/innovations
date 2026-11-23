# Słuchacz lasu: business case

> Model: Claude Opus 5.5 · Data: 2026-11-23 · Środowisko: aplikacja Claude, wyszukiwanie w sieci · Skill: lean-pm-skills:business-case

## 1. Pre-flight check

- **Dominujące rozwiązanie: w Polsce brak, ale klocki są tanie.** Rejestrator AudioMoth kosztuje ok. 50 USD [fakt, [1]]. W Puszczy Białowieskiej Huawei i Rainforest Connection (RFCx) uruchomiły w 2023 r. ponad 70 urządzeń nasłuchowych jako projekt wizerunkowy, nie płatną usługę [fakt, [2]]. Barierą wejścia nie jest sprzęt, tylko modele dla polskich gatunków, lokalizacja źródeł dźwięku i raporty, za które ktoś zapłaci.
- **Kto próbował: RFCx nie upadł, ale żyje z darowizn.** Darowizny to od 39% do 99% jego rocznych przychodów [fakt, [3]]. Sama ochrona lasu przed wycinką nie utrzymuje firmy.
- **Akustyka nie jest automatycznie tańsza.** W monitoringu ptaków na polach pasywny nasłuch wyszedł drożej niż obserwator [fakt, [4]]. Przewaga musi pochodzić z automatycznej analizy i ciągłości pomiaru, nie z samego mikrofonu.
- **Przeszkody prawne: brak zakazu, trzy procedury.** RODO przy przypadkowym nagraniu mowy; zgoda zarządcy terenu (Lasy Państwowe oczekują zgłaszania urządzeń rejestrujących, choć podstawa prawna jest sporna [fakt, [5]]); zezwolenie dyrektora parku narodowego. Unijne rozporządzenie o monitoringu lasów, które mogło stworzyć popyt, Parlament Europejski odrzucił 21.10.2025 [fakt, [6]].

## 2. Podsumowanie

**Szansa:** zastąpić część kosztownych liczeń terenowych zwierząt i monitoringu przyrodniczego ciągłym, automatycznym nasłuchem, sprzedawanym nadleśnictwom i firmom wykonującym oceny oddziaływania na środowisko (OOŚ).

**Czego potrzebujemy:** 3,4 mln zł do 2030 r. [szacunek: maksymalny skumulowany ujemny przepływ w scenariuszu bazowym]: 1,5 mln zł pre-seed i ok. 1,9 mln zł dotacji B+R (sekcja 8), oraz jednego nadleśnictwa pilotażowego.

**Główny wskaźnik:** NPV z 5 lat przy stopie 30% wynosi −2,0 mln zł bez wartości końcowej i +1,1 mln zł z wartością końcową; EBITDA dodatnia od 2030 r. [szacunek: model z sekcji 5].

**Koszt zaniechania:** w 2023 r. Lasy Państwowe ustaliły sprawców tylko 23% kradzieży drewna [fakt, [7]], a jelenie liczy się ręcznie. Zespół traci też okno, zanim firmy konsultingowe same złożą zestaw z AudioMoth i darmowego klasyfikatora ptaków [szacunek: brak barier technicznych].

**Kluczowe założenia** [wszystkie: szacunek]:
1. Ceny: 60 tys. zł/rok za nadleśnictwo (30 węzłów), 45 tys. zł za projekt OOŚ, 80 tys. zł za projekt parku lub regionalnej dyrekcji ochrony środowiska (RDOŚ), 3 tys. zł za sezon rykowiska dla koła łowieckiego.
2. Adopcja w 2031 r.: 40 z 429 nadleśnictw (9%) i 55 projektów OOŚ rocznie.
3. Węzeł czuwający 1,2 tys. zł, rejestrator 0,6 tys. zł; 15% floty rocznie do wymiany (kradzieże, awarie).
4. Koszty zmienne 25% przychodu; zespół 4→10 etatów, płace +6% rocznie; brak podatku dochodowego w horyzoncie (straty).
5. Stopa dyskontowa 30%; wartość końcowa 2× przychód z 2031 r.
6. Pilotażowe nadleśnictwo udostępni plan prac z Systemu Informatycznego Lasów Państwowych (SILP) [fakt istnienia systemu, [8]] i dostęp do dostrzegalni przeciwpożarowych.

## 3. Kontekst strategiczny

**Problem i dowody.** Lasy zajmują ponad 9,2 mln ha, z czego 77% zarządzają Lasy Państwowe (LP) [fakt, [9]] w 429 nadleśnictwach [fakt, [10]]. Dzierżawca każdego z ok. 5 tys. obwodów łowieckich musi co roku do 10 marca podać szacowaną liczebność zwierzyny [fakt, [11], [12]], a metody są ręczne: tropienie po śniegu, pędzenia, liczenie ryczących byków z tras (w Bieszczadzkim Parku Narodowym 144 km tras w jednym sezonie [fakt, [13]]). LP wprowadziły w 2026 r. metodykę stałych powierzchni do oceny szkód od zwierzyny [fakt, [14]], więc liczebność jeleniowatych ma dla nich znaczenie gospodarcze. Państwowy monitoring obejmuje wszystkie gatunki sów [fakt, [15]], a farmy wiatrowe wymagają monitoringu nietoperzy przed budową i po niej [fakt, [16]].

**Rynek** [szacunek: liczba podmiotów × ceny z sekcji 2]: nadleśnictwa ok. 26 mln zł/rok przy pełnym pokryciu; koła łowieckie ok. 7 mln zł (jeleń w połowie obwodów); OOŚ ok. 3–4 mln zł (portfel 8,2 GW farm wiatrowych z warunkami przyłączenia [fakt, [17]]); parki i RDOŚ ok. 2–3 mln zł. Razem ok. 40 mln zł rocznie: nisza, nie rynek pod klasyczny venture capital.

**Dlaczego teraz:** rejestratory są ok. 20 razy tańsze od profesjonalnych [fakt, [1]]; opublikowano metody automatycznej lokalizacji jeleni na rykowisku [fakt, [18]] i szacowania zagęszczenia z nagrań [fakt, [19]]; LP mają nową ścieżkę zamawiania usług badawczych [fakt, [20]].

**Weryfikacja hipotez z karty:**

| Hipoteza | Decyzja | Uzasadnienie |
|---|---|---|
| 1a. Piły i silniki | Ograniczona | Straty LP z kradzieży drewna to 35 mln zł w 13 lat [fakt, [7]], a legalna wycinka trwa wszędzie (średnio 40,9 mln m³ sprzedaży rocznie [fakt, [21]]); alarm tylko jako dodatek z filtrem kontekstu. |
| 1b. Krzyki ludzi | Odrzucona | Mowę rozpoznaje się wiarygodnie tylko do ok. 10 m [fakt, [22]], a nagrywanie ludzi to główne ryzyko RODO. |
| 1c. Lawiny | Odrzucona | Poza rynkiem leśnym, dotyczy małych obszarów Tatr i Karkonoszy, wymaga innych czujników (infradźwięki). |
| 1d. Strzały (nowa) | Dodana | Strzał w parku narodowym lub w nocy w okresie ochronnym jest jednoznacznym sygnałem kłusownictwa. |
| 2. Mikrofony w fotopułapkach | Odrzucona w tej formie | Fotopułapki to zamknięte urządzenia nagrywające po wykryciu ruchu; zamiast nich bramki łączności stawiamy na dostrzegalniach, które mają zasilanie i łącza radiowe [fakt, [23], [24]]. |
| 3. Pożar po dźwięku | Odrzucona | Trzask ognia słychać z bliska, a LP realizują za 160 mln zł projekt PPOŻ2: dostrzegalnie i kamery z automatyczną detekcją dymu [fakt, [23], [24]]. |
| 4. Liczebność po głosach | Rozwinięta, ograniczona | Obecność i aktywność: dla wielu gatunków. Liczebność tylko dla gatunków głośnych i lokalizowalnych (jeleń na rykowisku, sowy, wilki); ryk pokazuje byki ryczące, nie łanie i cielęta [fakt, [25]], więc to wskaźnik trendu. Zasięg zależy od źródła: piłę słychać do ok. 1,5 km [fakt, [26]], ptaki znacznie bliżej. |

## 4. Proponowane rozwiązanie

**Co budujemy:** abonament „spis i nasłuch”: klient płaci za raport (liczba i mapa terytoriów, lista gatunków, alarmy), a sprzęt pozostaje naszą własnością; klient może go też odkupić.

**Jak działa** [parametry techniczne: szacunek projektowy]:
- **Sprzęt.** *Rejestrator* (klasa AudioMoth, bez łączności, do OOŚ i spisów sezonowych) oraz *węzeł czuwający* (montaż 4–6 m, panel słoneczny, odbiornik GPS synchronizujący czas, wysyłka samych zdarzeń przez LoRaWAN do bramek na dostrzegalniach). Serwis 2× w roku robi nasz technik; pracownicy LP nie dostają nowych obowiązków.
- **Modele audio (technika główna, Voice AI).** (1) Wykrywanie zdarzeń na urządzeniu: piła, silnik, strzał; (2) klasyfikacja gatunków w chmurze: ryk jelenia, wycie wilka, sowy, ptaki, nietoperze; (3) lokalizacja źródła z różnic czasu dotarcia dźwięku do ≥3 węzłów, co rozróżnia osobniki i wyznacza terytoria; (4) detektor mowy, który kasuje głos człowieka na urządzeniu przed zapisem.
- **Logika alarmu.** Piła lub silnik: tylko nocą albo w oddziale bez prac zaplanowanych w SILP; strzał w parku lub rezerwacie: zawsze; reszta trafia do raportu dziennego.
- **Techniki pomocnicze (nie audio):** statystyczny model zagęszczenia z przestrzennych ponownych wykryć [fakt istnienia metody, [19]]; łączenie zdarzeń z mapą i planem prac z SILP.

**Proponowany zespół:** CEO z praktyką w OOŚ lub leśnictwie (sprzedaż, przetargi); CTO, specjalista ML audio; inżynier systemów wbudowanych (niski pobór mocy, radio); ekolog-bioakustyk (metodyka zgodna z państwowym monitoringiem, walidacja). Od 2028 r. drugi inżynier ML i technik terenowy, potem handlowiec i inżynier danych. Doradcy: emerytowany nadleśniczy, prawnik RODO, opiekun naukowy z PWr.

**Plan realizacji** [koszty netto po przychodach: szacunek, model z sekcji 5]:

| Etap | Cel | Czas | Koszt | Kryterium przejścia |
|---|---|---|---|---|
| 0. Walidacja | 20 wywiadów; nagrania wiosenne sów z 40 rejestratorów | I–VI 2027 | 0,3 mln zł | ≥2 listy intencyjne, 1 płatny pilotaż, akceptacja ceny ≥45 tys. zł/rok |
| 1. Pilotaż | 1 nadleśnictwo (30 węzłów) i 2 projekty OOŚ; rykowisko IX–X 2027 | IV–XII 2027 | 0,9 mln zł | spis byków ±25% względem liczenia z tras; trafność alarmów ≥80%; straty sprzętu <10% |
| 2. Komercjalizacja | 14 nadleśnictw, 25 projektów OOŚ | 2028–2029 | 2,0 mln zł | przychód 2029 ≥2,0 mln zł; odejścia klientów <15% rocznie |
| 3. Skala | 40 nadleśnictw, zamówienia GIOŚ i RDOŚ | 2030–2031 | 0,1 mln zł | EBITDA >0 w 2030 |

## 5. Model finansowy

Stopa dyskontowa 30% [szacunek: zwrot typowo wymagany przez inwestorów na etapie pre-seed przy wysokim ryzyku porażki]. Scenariusz bazowy, tys. zł [szacunek: model własny, założenia z sekcji 2]:

| Rok | 2027 | 2028 | 2029 | 2030 | 2031 |
|---|---|---|---|---|---|
| Przychody | 150 | 1 030 | 2 375 | 3 990 | 5 725 |
| Koszty operacyjne | 1 138 | 1 924 | 2 629 | 3 490 | 4 643 |
| EBITDA | −988 | −894 | −254 | 500 | 1 082 |
| Nakłady na sprzęt | 193 | 288 | 552 | 742 | 907 |
| Przepływ wolny | −1 181 | −1 182 | −806 | −242 | 175 |
| Skumulowany | −1 181 | −2 363 | −3 169 | −3 411 | −3 236 |

- **NPV (5 lat):** −2,0 mln zł; z wartością końcową +1,1 mln zł.
- **IRR:** nieokreślone bez wartości końcowej; 48% z wartością końcową.
- **Okres zwrotu:** ponad 5 lat, ok. 2034 r. [szacunek: przepływ rośnie o 0,6 mln zł rocznie po 2031].
- **Próg rentowności (EBITDA = 0):** ok. 3,3 mln zł przychodu rocznie, osiągnięty w 2030 r.

Realistyczne wyjście dla inwestora to sprzedaż spółki firmie konsultingowej lub producentowi sprzętu monitorującego; mnożnik 2× przychodu zakłada taki scenariusz [szacunek].

**Scenariusze** [szacunek]:

| Scenariusz | Przychody 2031 | EBITDA >0 od | Maks. potrzeba gotówki | NPV | NPV z wart. końcową | IRR z wart. końcową |
|---|---|---|---|---|---|---|
| Konserwatywny (adopcja ok. 50% niższa) | 2,9 mln | poza horyzontem | 5,2 mln | −2,8 mln | −1,2 mln | 5% |
| Bazowy (tylko Polska) | 5,7 mln | 2030 | 3,4 mln | −2,0 mln | +1,1 mln | 48% |
| Optymistyczny (z Czechami) | 8,7 mln | 2029 | 2,9 mln | −1,7 mln | +3,0 mln | 73% |

**Pierwszy kraj ekspansji: Czechy** [szacunek: bez danych rynkowych z researchu]. Podobny model gospodarki leśnej z dużym przedsiębiorstwem państwowym, populacje jelenia i liczenia łowieckie, bliskość Wrocławia obniżająca koszt serwisu oraz niska bariera językowa. Wejście w 2030 r. przez jeden pilotaż; w modelu 8 kontraktów w 2030 i 22 w 2031 r.

**Wrażliwość (scenariusz bazowy)** [szacunek]:

| Zmiana | Maks. potrzeba gotówki | NPV | EBITDA >0 w horyzoncie |
|---|---|---|---|
| Koszty +50% | 11,5 mln | −5,4 mln | nie |
| Przychody −30% | 7,2 mln | −3,4 mln | nie |
| Oba naraz | 15,5 mln | −6,8 mln | nie |

Każda z tych zmian osobno przesuwa rentowność poza 2031 r. Dlatego etapy 0–1 kosztują razem 1,2 mln zł, a kill criteria zatrzymują projekt przed dużymi zakupami floty.

## 6. Warianty alternatywne

| Kryterium | Nic nie robimy | Wersja okrojona: analiza nagrań klienta | Kamery, fotopułapki, drony termowizyjne | Słuchacz lasu (pełny) |
|---|---|---|---|---|
| NPV 5 lat (z wart. końcową) [szacunek] | 0 | −2,1 mln (−1,5 mln) | nie liczono: usługę już świadczą inni [fakt, [27]] | −2,0 mln (+1,1 mln) |
| Czas do efektu | brak | 6 mies. | od ręki | 12–18 mies. |
| Ryzyko | niskie | średnie: łatwa do skopiowania | niskie | średnio-wysokie |
| Dopasowanie do problemu | problem zostaje | gatunki głosowe, bez alarmów i lokalizacji | dobre dla kopytnych, słabe dla sów, ptaków i nietoperzy; satelity nie widzą zwierząt | gatunki głosowe, terytoria, anomalie |
| Odwracalność | pełna | wysoka | wysoka | średnia: flota sprzętu |

**Rekomendacja:** pełny Słuchacz lasu, wdrażany etapami. Wersja okrojona daje podobne NPV bez wartości końcowej, ale nie ma trwałej przewagi, więc jest wariantem awaryjnym po K1 lub K4. Kamery uzupełniają rozwiązanie o gatunki ciche, a nie je zastępują.

## 7. Ryzyka

Prawdopodobieństwo i wpływ to ocena własna [szacunek].

| Ryzyko | Prawdopodobieństwo | Wpływ | Sposób ograniczenia | Kto odpowiada |
|---|---|---|---|---|
| Techniczne: modele mylą się w hałasie (wiatr, deszcz, maszyny leśne) | średnie | wysoki | nagrania z pilotażu, kalibracja na stanowisku, ręczna weryfikacja próbki | CTO |
| Techniczne i organizacyjne: kradzieże, zima, brak prądu | wysokie | średni | montaż wysoko i zamaskowany, alarm przy zdjęciu urządzenia, 15% floty rocznie w budżecie | technik terenowy |
| Rynkowe: wolne zakupy LP, cięcia kosztów | wysokie | wysoki | start od OOŚ (płatnik prywatny); kontrakty poniżej progu 130 tys. zł z ustawy Pzp [fakt, [28]] | CEO |
| Rynkowe: zastój energetyki wiatrowej (weto, limit 700 m [fakt, [29]]) | średnie | średni | farmy fotowoltaiczne, drogi, zamówienia GIOŚ | CEO |
| Finansowe: odrzucona dotacja (566 wniosków na 3,6 mld zł w jednym naborze [fakt, [30]]) | średnie | wysoki | pre-seed na 12 miesięcy, ścieżka konsorcjalna z PWr [fakt, [31]], ponowny wniosek | CEO |
| Prawne: RODO, przypadkowe nagranie ludzi | średnie | wysoki | kasowanie mowy na urządzeniu, brak surowego dźwięku z węzłów, ocena skutków dla ochrony danych, tablice informacyjne, prawnie uzasadniony interes jako podstawa | CEO i zewnętrzny inspektor ochrony danych |
| Prawne: ochrona przyrody, zgody na montaż | niskie | średni | zgoda nadleśniczego w umowie, zezwolenie dyrektora parku, montaż poza okresem lęgowym i z dala od gniazd | ekolog |

## 8. Czego potrzebujemy i od kogo

| Źródło lub partner | Co | Kwota | Termin | Kamień milowy kontrolny |
|---|---|---|---|---|
| Fundusz pre-seed z programu PFR Starter (1–5 mln zł na spółkę [fakt, [32]]) | kapitał na etapy 0–1 | 1,5 mln zł [szacunek] | umowa do VI 2027 | etap 0 zaliczony (VI 2027) |
| Konsorcjum z PWr w Ścieżce SMART (w naborze PARP min. 3 mln zł kosztów B+R [fakt, [30]]) | dotacja na modele, lokalizację i węzeł | ok. 1,9 mln zł [szacunek: ok. 60% z 3,2 mln zł] | wniosek w pierwszym naborze 2027 [szacunek: nabory 2× w roku] | wyniki rykowiska 2027 jako dowód wykonalności |
| Nadleśnictwo pilotażowe lub Dyrekcja Generalna LP (zamówienie usługi badawczej [fakt, [20]]) | teren, dane SILP, dostrzegalnie, płatny pilotaż | 0,1–0,3 mln zł [szacunek] | porozumienie do IV 2027 | raport z rykowiska XI 2027 |
| Dwie firmy konsultingowe OOŚ | kanał sprzedaży, pierwsze projekty | 90 tys. zł przychodu [szacunek] | 2027 | powtórne zamówienie w 2028 |
| Instytut naukowy (np. Instytut Badawczy Leśnictwa) | niezależna walidacja metod | w budżecie dotacji | 2027–2028 | opinia metodyczna 2028 |
| Fundusz seed (warunkowo) | skala floty; pokrycie scenariusza konserwatywnego | 2,0 mln zł [szacunek] | 2029 | przychód 2029 ≥2,0 mln zł |

## 9. Kill criteria

| Nr | Warunek | Etap | Decyzja |
|---|---|---|---|
| K1 | <2 listy intencyjne, brak płatnego pilotażu lub cena <45 tys. zł do VI 2027 | 0 | wersja okrojona albo stop |
| K2 | spis byków różni się o >30% od liczenia z tras lub błąd lokalizacji >100 m | 1 | rezygnacja z liczebności; tylko obecność i aktywność |
| K3 | trafność alarmów po filtrze kontekstu <70% przez 3 miesiące | 1 | wycofanie linii alarmowej |
| K4 | straty sprzętu >20% w sezonie | 1 | tylko rejestratory, bez węzłów stałych |
| K5 | <4 płacące nadleśnictwa i <10 projektów OOŚ do XII 2028 | 2 | zawężenie do OOŚ |
| K6 | przychód 2029 <1,5 mln zł lub marża brutto <55% | 2 | brak rundy seed; sprzedaż technologii lub wygaszenie |
| K7 | EBITDA <0 w 2030 | 3 | redukcja zespołu do rentownego rdzenia |

## 10. Scorecard

| Wymiar | Ocena 1–10 | Uzasadnienie |
|---|---|---|
| Oryginalność | 7 | Trzy elementy nieoczywiste, ale realistyczne: (1) automatyzacja tradycyjnego liczenia ryczących byków przez lokalizację dźwięku, co daje liczbę i mapę terytoriów metodą, której leśnicy już ufają; (2) alarm o pile tylko w kontekście (noc, oddział bez prac w SILP), bo sam dźwięk piły w gospodarowanym lesie nic nie znaczy; (3) kasowanie mowy na urządzeniu, które zamienia główne ryzyko RODO w cechę produktu, a częstość wykrytej mowy daje wskaźnik presji turystycznej [fakt możliwości, [22]]. |
| Wykonalność techniczna | 6 | Wykrywanie i klasyfikacja są dojrzałe; liczebność z dźwięku ma status badawczy [fakt, [19]]. |
| Popyt i płatnik | 4 | Płatnicy rozproszeni, częściowo publiczni; ceny niezweryfikowane. |
| Ekonomia | 4 | NPV bez wartości końcowej ujemne; mały rynek; duża wrażliwość na koszty i przychody. |
| Ryzyko prawne i regulacyjne | 7 | Brak zakazów; procedury znane i do opanowania. |
| Zespół i realizacja | 5 | Brakuje osoby z kontaktami w LP i doświadczeniem terenowym. |

**Werdykt: kontynuować warunkowo.** Warunki: (1) zaliczyć etap 0 przed pozyskaniem pre-seedu; (2) dołączyć współzałożyciela z praktyką leśną lub OOŚ; (3) sprzedawać spis zwierząt i monitoring przyrodniczy, a ochronę przed kradzieżą tylko jako dodatek. Bez warunku 1 projekt nie powinien ruszać.

## Źródła

1. University of Southampton / Oxford, REF 2021 Impact Case Study „AudioMoth” (cena ok. 50 USD, 20× taniej od urządzeń komercyjnych). https://results2021.ref.ac.uk/impact/602221dc-0923-4165-a03f-c41b71337495/pdf
2. Telepolis, „AI Huawei nasłuchuje w Puszczy Białowieskiej” (ponad 70 urządzeń); RFCx, opis projektu w BPN (III–VI 2023). https://www.telepolis.pl/wiadomosci/huawei-tech4all-bialowieski-park-narodowy-rainforest-connection ; https://rfcx.org/projects/poland
3. ProPublica Nonprofit Explorer, Rainforest Connection, dane z formularzy 990. https://projects.propublica.org/nonprofits/organizations/462022575
4. Markova-Nenova N., Engler J.O., Cord A., „Will passive acoustic monitoring make result-based payments more attractive? A cost comparison with human observation for farmland bird monitoring”, MPRA. https://mpra.ub.uni-muenchen.de/118377/1/Paper%20Audiomoths_mpra_CSP.pdf
5. Prawo.pl, „Z kamerą wśród zwierząt – Lasy Państwowe nie mogą zabraniać instalowania fotopułapek”. https://www.prawo.pl/prawo/fotopulapki-w-lesie-nie-mozna-zabronic,520794.html
6. Carbon Gap Policy Tracker, Forest Monitoring Law (stan prac legislacyjnych). https://tracker.carbongap.org/policy/forest-monitoring-law/
7. Artykuł o kradzieżach drewna w PGL LP w latach 2011–2023, Acta Scientiarum Polonorum Silvarum Colendarum Ratio et Industria Lignaria, 2025. https://www.forestry.actapol.net/pub/27_3_2025.pdf
8. Zarządzenie DGLP dotyczące klauzul RODO dla danych w Systemie Informatycznym Lasów Państwowych. https://www.gov.pl/attachment/df53c4af-c033-4367-9c8f-2b474179ea3a
9. NIK, informacja o wynikach kontroli P/24/078 (2024). https://www.nik.gov.pl/kontrole/wyniki-kontroli-nik/pobierz,lop~p_24_078_202407171259461721213986~01,typ,kk.pdf
10. DGLP, Sprawozdanie finansowo-gospodarcze PGL LP za 2024 r. https://www.gov.pl/attachment/4ecfaec4-d573-4211-8818-6c5c460894f0
11. Ustawa z dnia 13 października 1995 r. – Prawo łowieckie, art. 8a (tekst jednolity Dz.U. 2023 poz. 1082). https://eli.gov.pl/eli/DU/2023/1082/ogl/pol/pdf
12. Ministerstwo Klimatu i Środowiska, „Obwody łowieckie i ich zasięgi”. https://www.gov.pl/web/klimat/obwody-lowieckie-i-ich-zasiegi
13. Bieszczadzki Park Narodowy, „Monitoring ryczących byków w sezonie 2010”. https://www.bdpn.pl/dokumenty/nauka/2010/monitoring/2010_monitoring_bykow_opracowanie.pdf
14. Zarządzenie DGLP z 28.04.2026, metodyka stałych powierzchni monitoringowych i ewidencji uszkodzeń od zwierzyny. https://www.gov.pl/attachment/9e439944-1d45-4b9e-a858-40fd867075d3
15. GIOŚ, „Międzynarodowy Dzień Ptaków” (monitoring wszystkich gatunków sów). https://www.gov.pl/web/gios/miedzynarodowy-dzien-ptakow
16. GDOŚ, „Wytyczne dotyczące oceny oddziaływania elektrowni wiatrowych na nietoperze”. https://www.gov.pl/attachment/8823fdad-5589-4a87-af7f-94b78fe7ae9f
17. Gramwzielone.pl, „Wiatraki czekają na zielone światło. Portfel projektów z warunkami przyłączenia sięga 8,2 GW”. https://www.gramwzielone.pl/?p=20376780
18. Avots E. i in., „Towards Automated Detection and Localization of Red Deer Cervus elaphus Using Passive Acoustic Sensors”, Remote Sensing 14(10):2464, 2022. https://doi.org/10.3390/rs14102464
19. „Towards Automated Animal Density Estimation with Acoustic Spatial Capture-Recapture”, arXiv:2308.12859. https://arxiv.org/abs/2308.12859
20. Zarządzenie nr 42 DGLP z 18.06.2026 w sprawie zasad zamawiania usług badawczych. https://www.gov.pl/attachment/35440189-09fe-49b4-a30c-a58e0f594497
21. Ministerstwo Klimatu i Środowiska, „Raport o sytuacji branży leśno-drzewnej”. https://www.gov.pl/web/klimat/raport-o-sytuacji-branzy-lesno-drzewnej
22. „Voice activity detection in eco-acoustic data enables privacy protection and is a proxy for human disturbance”, University of Cambridge Repository. https://www.repository.cam.ac.uk/handle/1810/342220
23. Karta projektu PPOŻ2 (FEnIKS): koszt 160,3 mln zł, 77 obiektów, w tym dostrzegalnie. https://www.gov.pl/attachment/6655fdbd-3276-4de1-9004-2fbb586dae96
24. TED, ogłoszenie Nadleśnictwa Torzym 2026: system wczesnego wykrywania pożarów z łączami radiowymi 5 GHz między wieżami. https://ted.europa.eu/en/notice/248544-2026/pdf
25. Borkowski J., prezentacja o metodach oceny liczebności jeleni, materiały Instytutu Biologii Ssaków PAN w Białowieży. https://ibs.bialowieza.pl/wp-content/uploads/2020/09/BORKOWSKI.pdf
26. Rainforest Connection, „Guardian Location Selection”. https://support.rfcx.org/article/131-guardian-location-selection
27. Pagacz S., Witczuk J., „Inwentaryzacja dużych ssaków z wykorzystaniem fotopułapek – przykład realizacji w trzech nadleśnictwach północno-zachodniej Polski”, Leśne Prace Badawcze 85, 2025. https://lpb-ibl.sggw.edu.pl/article/view/11386
28. Ustawa z dnia 11 września 2019 r. – Prawo zamówień publicznych, art. 2 ust. 1 pkt 1.
29. Globenergia, „Wiatraki nadal czekają na odblokowanie. Nowa ustawa o OZE zostawia limit 700 metrów”. https://globenergia.pl/wiatraki-nadal-czekaja-na-odblokowanie-nowa-ustawa-o-oze-zostawia-limit-700-metrow/
30. PARP, wyniki I etapu oceny w naborze 1/2026 Ścieżka SMART B+R; ogłoszenie naboru 29.10–29.12.2026; ARP, opis Ścieżki SMART (min. 3 mln zł kosztów B+R). https://www.parp.gov.pl/component/grants/news/informacja-o-wynikach-oceny-projektow-i-etapu-w-naborze-nr-1-2026-sciezka-smart-b-r ; https://www.parp.gov.pl/storage/grants/documents/743/ogloszenie_naboru.pdf ; https://europark.arp.pl/documents/26/%C5%9Acie%C5%BCka_SMART.pdf
31. NCBR, Ścieżka SMART – projekty realizowane w konsorcjach (FENG.01.01-IP.01-002/26). https://www.gov.pl/web/ncbr/sciezka-smart--projekty-realizowane-w-konsorcjach-ogloszenie-naboru-feng0101-ip01-00226
32. XYZ.pl, „Setki milionów na inwestycje w startupy. Powstały nowe fundusze” (PFR Starter, 1–5 mln zł na projekt). https://xyz.pl/setki-milionow-na-inwestycje-w-startupy-powstaly-nowe-fundusze/

## Aneks: co zmieniłem po samokrytyce

| Perspektywa | Zarzut | Co zmieniono albo dlaczego odrzucono |
|---|---|---|
| Sceptyczny inwestor | Popyt niezweryfikowany: wszystkie ceny to szacunki, a ok. 42% przychodu 2031 zależy od nadleśnictw, które kupują wolno i tną koszty. | Do kryterium etapu 0 i do K1 dodano akceptację ceny ≥45 tys. zł/rok; wrażliwość pokazuje, że −30% przychodu oznacza brak rentowności w horyzoncie. |
| Sceptyczny inwestor | Model kapitałochłonny: ok. 2 100 urządzeń na bilansie startupu, a 15% strat rocznie może być zaniżone. | Dodano opcję odkupu floty przez klienta; próg strat testuje K4, który przełącza model na same rejestratory. |
| Sceptyczny inwestor | Rynek ok. 40 mln zł i ujemne NPV bez wartości końcowej: to nie jest spółka pod klasyczny venture capital. | Zarzut przyjęty jako fakt, modelu nie podkoloryzowano: dopisano realistyczne wyjście (sprzedaż spółki) i finansowanie małym pre-seedem oraz dotacją. |
| Nadleśniczy z 20-letnim stażem | Piły pracują legalnie codziennie, także przy samowyrobie drewna; SILP nie zna godziny prac; Straż Leśna nie pojedzie na każdy alarm. | Alarm o pile tylko nocą lub w oddziale bez zaplanowanych prac; strzały w parkach zawsze; reszta w raporcie dziennym; trafność mierzy K3. |
| Nadleśniczy z 20-letnim stażem | Ryk byków to nie liczebność: łanie, cielęta i milczące byki nie ryczą, a inwentaryzacja jest na 10 marca. | Dopisano ograniczenie ze źródłem [25]; produkt sprzedaje liczbę i mapę ryczących byków jako wskaźnik trendu, a płatnikiem jest nadleśnictwo zatwierdzające plany, nie koło. |
| Nadleśniczy z 20-letnim stażem | Kto zimą wymieni baterie w 30 rozproszonych punktach i co z kradzieżami? Leśniczy nie weźmie kolejnego obowiązku. | Serwis 2× w roku przez naszego technika w cenie abonamentu, zasilanie słoneczne, bramki na dostrzegalniach z zasilaniem; pracownicy LP bez nowych obowiązków. |