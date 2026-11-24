> Model: Claude Opus 5.5 (claude-opus-5-5), z wyszukiwarką internetową · Data: 2026-11-23

# Słuchacz lasu: ocena i poprawiony plan

## Założenia

- Nadleśnictwa kupują usługi samodzielnie. Zamówienie poniżej progu ustawy Pzp, który od 1 stycznia 2026 r. wynosi 170 000 zł netto [14], można zlecić bez przetargu. Pierwsza sprzedaż powinna więc zmieścić się w tej kwocie.
- Lasy Państwowe zarządzają około 7,6 mln ha i mają 429 nadleśnictw [18]. Centralne wdrożenie w całych LP wymagałoby przetargu i lat starań, dlatego nie traktujemy go jako pierwszego kroku.
- Nie znam aktualnych, ogólnokrajowych danych o kradzieży drewna po 2020 r. Opieram się na starszych raportach LP.
- Status prawny cięć w okresie lęgowym ptaków jest sporny. Nie mam źródła, które potwierdzałoby obecne wewnętrzne zasady LP.
- Zespół nie ma doświadczenia w budowie sprzętu terenowego. Zakładam zakup gotowych rejestratorów zamiast własnej elektroniki.

## 1. Co już istnieje

**Wykrywanie piły.** Rainforest Connection (RFCx) sprzedaje Guardian 3. To czujnik na energię słoneczną z trzema mikrofonami i łącznością przez Starlink. Rozpoznaje piły, silniki pojazdów, strzały i psy myśliwskie w promieniu od 50 do 1500 m, zależnie od źródła dźwięku [1]. Huawei, który współtworzył model, podaje, że wykrywa on 96% zdarzeń z piłą [2]. To dane od dostawcy i nie wiadomo, czy chodzi o czułość, czy o precyzję. Wczesne wersje myliły piłę z brzęczeniem komarów [2].

**Bioróżnorodność w Polsce.** Ten sam RFCx wspólnie z Huawei i Białowieskim Parkiem Narodowym rozstawił 70 rejestratorów AudioMoth i 3 Guardiany. Pracowały od 27 marca do 9 czerwca 2023 r. Zebrały około 1,08 mln minutowych nagrań, wykryły 56 gatunków, w tym wilka, i posłużyły do budowy modeli występowania (occupancy) dla 17 gatunków ptaków [3][4]. **Nasz główny moduł istnieje więc już w Polsce, u konkurenta z globalnym partnerem.**

**Narzędzia.** BirdNET to darmowy klasyfikator ptaków. W lasach Dolnej Saksonii średnia precyzja wyniosła 0,70, a czułość 0,64 [5b]. Dla wybranych gatunków leśnych precyzja sięga 88–93% [5a]. AudioMoth kosztuje około 80–100 USD [6]. Przy nagrywaniu 30 s co 5 min działa na baterii do 115 dni [19].

**Pożary.** LP mają ponad 700 punktów obserwacyjnych, a utrzymanie systemu przeciwpożarowego kosztowało 158 mln zł w 2024 r. [9]. Polski SmokeD wykrywa dym kamerami i ma kontrakt z LP [8]. Dryad Silvanet wykrywa tlący się ogień czujnikami gazów i wysłał ponad 30 000 czujników [7]. Akustyczne wykrywanie pożaru jest na etapie badań (infradźwięki z kontrolowanych wypaleń) [16]. Nie ma tu przewagi do zdobycia.

**Liczebność.** Szacowanie liczby osobników z samego dźwięku jest trudne. Przy cietrzewiowatych, np. głuszcu, liczba odezwań na toku koreluje z liczbą kogutów, ale nie ma zwalidowanego przelicznika [12]. U jeleni da się policzyć ryczące byki, ale nie łanie i cielęta [17]. Obietnica „liczebności i granic terytoriów” jest dziś nierealna. Realne jest określenie obecności lub braku gatunku i trendu aktywności.

**Co jest naprawdę nowe.** Ani sam sprzęt, ani klasyfikator. Proponuję przesunięcie: **Słuchacz lasu jako akustyczna kontrola przed zabiegiem gospodarczym.** Przed cięciem w okresie lęgowym (1 marca – 15 października [10]) rejestratory pracują 5–7 dni na wydzieleniu przeznaczonym do zabiegu. System zwraca raport: czy wykryto gatunki wymagające ochrony (np. dzięcioł białogrzbiety, sóweczka, włochatka, bocian czarny) i gdzie. Polska przegrała przed TSUE sprawę domniemania, że gospodarka leśna zgodna z dobrą praktyką nie narusza przepisów o ochronie przyrody [11]. Udokumentowana kontrola przyrodnicza ma więc wartość prawną i wizerunkową. Piła zostaje jako moduł drugi i nieoczywisty: alarm tylko o cięciu **poza wydzieleniami, na które wystawiono zlecenie**. Bez tego w lesie gospodarczym każdy legalny zrąb wywoła alarm.

## 2. Pre-mortem

1. **Konkurent był pierwszy, a my nie mieliśmy wyróżnika.** RFCx i Huawei dawały park narodowy za darmo w ramach CSR [3]. Spowodował to krok 1, który pytał o metody i koszty, a nie o konkurencję. Pomysłu nie przesunięto.
2. **Nie było klienta z budżetem.** Krok 8 zakładał, że LP sfinansują wdrożenie. Centralna decyzja wymagała przetargu, a nadleśniczy nie miał pozycji w planie finansowym na „słuchanie zwierząt”. Kroku 8 nie poprzedziło pytanie o płatność w kroku 1.
3. **Alarmy o pile były bezużyteczne.** W lesie gospodarczym piły pracują codziennie legalnie. W 2012 r. LP odnotowały 6451 kradzieży drewna [13], czyli rzadkie zdarzenia rozproszone po 7,6 mln ha [18]. Na jedną prawdziwą kradzież przypadały setki alarmów o legalnej pracy [szacunek]. Spowodowały to kroki 3 i 6, które nie łączyły detekcji z planem cięć.
4. **Sprzęt pochłonął czas i pieniądze.** Kondensacja wilgoci, kradzieże czujników, za mało słońca pod okapem drzewostanu. Spowodował to krok 4, czyli własny prototyp zamiast gotowych AudioMoth [6].
5. **Obietnica „liczebności” nie przeszła porównania.** Pilotaż z kroku 7 porównał nasze liczby z pędzeniami próbnymi. Akustyka nie daje liczby osobników [12][17], więc wynik uznano za porażkę. Spowodował to sposób zdefiniowania sukcesu w krokach 7 i 3.

## 3. Ocena naszego planu

1. **Wywiady: zmienić.** Pytać o konkretną decyzję i budżet: kto i za ile dziś robi inwentaryzację przyrodniczą przed zabiegiem. Cel: 15 rozmów i co najmniej 3 deklaracje pilotażu płatnego poniżej progu Pzp.
2. **Zbieranie i oznaczanie danych: zmienić.** Nie zaczynać od zera. Wziąć BirdNET jako bazę i oznaczyć tylko próbę walidacyjną (około 2000 fragmentów [szacunek]) dla 10 gatunków docelowych.
3. **Trening modelu: zmienić.** Dostrajać BirdNET dla rzadkich gatunków polskich i trenować model „piła/harwester kontra tło”. Miarą jest precyzja i czułość na gatunek, a nie „działa”.
4. **Własny prototyp czujnika: usunąć na start.** Kupić 20 AudioMoth (około 2000 USD [6]). Własny sprzęt budować dopiero przy module piły, który wymaga łączności w czasie rzeczywistym.
5. **Test zasięgu: zostawić.** Dodać mierzalny wynik: zasięg wykrycia piły i 5 gatunków przy odtwarzaniu nagrań z głośnika na odległość 50–500 m.
6. **Aplikacja z mapą: zmienić.** Na start wystarczy raport PDF na wydzielenie i warstwa do importu w GIS nadleśnictwa. Powiadomienia dopiero przy module piły.
7. **Pilotaż: zmienić.** Porównywać z ornitologiem w terenie (wykrycie gatunku na wydzieleniu), a nie z liczeniem zwierzyny. Pilotaż ma być płatny.
8. **Finansowanie przez LP i granty: zmienić.** Sprzedawać pojedynczym nadleśnictwom, parkom narodowym i firmom robiącym inwentaryzacje. Granty traktować jako uzupełnienie, nie jako model biznesowy.
9. **Zgody i RODO: zmienić i przenieść na początek.** Głos jest daną osobową [15]. Filtr mowy na urządzeniu i usuwanie fragmentów przed zapisem trzeba mieć przed pierwszym nagraniem, nie po pilotażu.
10. **Skalowanie jako abonament: zostawić, ale zmienić jednostkę.** Opłata za kontrolę wydzielenia lub za sezon, a nie abonament sprzętowy.

**Czego brakuje:** analizy konkurencji (RFCx w Białowieży), ceny i modelu płatności, łączenia z planem cięć, procedury walidacji przez eksperta, budżetu i harmonogramu, ochrony czujników przed kradzieżą oraz kryteriów porzucenia lub zmiany kierunku.

## 4. Poprawiony plan

| Krok | Czas [szacunek] | Warunek przejścia dalej | Co, jeśli nie jest spełniony |
|---|---|---|---|
| 1. 15 wywiadów (nadleśnictwa, parki narodowe, firmy przyrodnicze, RDOŚ) o kontroli przed zabiegiem i jej koszcie | 4 tyg. | Co najmniej 3 podmioty deklarują płatny pilotaż poniżej 170 tys. zł [14] | Zmienić klienta na firmy robiące monitoring Natura 2000 lub programy ochrony głuszca [12] |
| 2. Test BirdNET na 300 h nagrań publicznych i własnych, 10 gatunków docelowych | 4 tyg. | Precyzja co najmniej 0,8 dla 6 z 10 gatunków przy wybranym progu [5] | Zawęzić listę gatunków albo dostroić model na własnych etykietach |
| 3. Procedura RODO: filtr mowy przed zapisem, ocena skutków dla ochrony danych | 3 tyg., równolegle | Pozytywna opinia prawnika i odsetek mowy w zapisie poniżej 1% w teście [szacunek] | Nagrywać tylko w oknach świtu i nocy, poza szlakami |
| 4. 20 AudioMoth na 4 wydzieleniach, test zasięgu z głośnika | 6 tyg. | Wykrycie 5 gatunków testowych z co najmniej 100 m | Zagęścić siatkę i przeliczyć koszt kontroli |
| 5. Płatny pilotaż: 30 wydzieleń przed zabiegiem, ornitolog na 10 z nich | 1 sezon (marzec–czerwiec) | Zgodność z ornitologiem co najmniej 80% na poziomie wydzielenia i koszt na wydzielenie niższy niż ekspert | Sprzedawać jako narzędzie wspierające eksperta, nie zastępujące go |
| 6. Moduł piły: porównanie detekcji z wykazem zleceń na cięcie | 3 mies. | Co najmniej 90% alarmów o legalnych cięciach odfiltrowanych przez wykaz zleceń [szacunek] | Zostawić piłę jako dowód w raporcie, bez alarmów w czasie rzeczywistym |
| 7. Sprzedaż w 5 nadleśnictwach, cennik za wydzielenie lub sezon | 6–12 mies. | Co najmniej 3 klientów kupuje ponownie w drugim sezonie | Przejść na model dla firm przyrodniczych (licencja na oprogramowanie) |

**Jaką szkodę ograniczamy i jak ją zmierzymy.** Produkt ogranicza niszczenie zajętych stanowisk lęgowych gatunków chronionych przez zabiegi prowadzone w okresie lęgowym. W pilotażu zmierzymy:
- odsetek kontrolowanych wydzieleń, na których wykryto gatunek wymagający ochrony;
- odsetek z nich, na których zabieg przesunięto lub wyznaczono strefę ochronną;
- czułość systemu względem ornitologa, czyli ile stanowisk wykrytych przez eksperta pominęliśmy.

## 5. Trzy najtańsze testy

1. **Ktoś zapłaci za kontrolę przed zabiegiem.** Test: jednostronicowa oferta z ceną (np. 1500 zł za wydzielenie [szacunek]) wysłana do 30 nadleśnictw i firm przyrodniczych, a potem rozmowy. Sukces: co najmniej 3 listy intencyjne. Koszt: czas zespołu.
2. **Gotowy model rozpoznaje polskie gatunki docelowe wystarczająco dobrze.** Test: BirdNET puszczony na publicznych nagraniach (np. xeno-canto) i na kilku godzinach nagranych telefonem w lesie, z ręczną weryfikacją 500 detekcji. Sukces: precyzja co najmniej 0,8 dla większości gatunków [5]. Koszt: zero złotych za sprzęt.
3. **Detekcję piły da się odróżnić od legalnej pracy.** Test: poprosić jedno nadleśnictwo o wykaz zleceń na cięcie z jednego tygodnia i porównać go z nagraniami z publicznych zbiorów oraz z telefonu przy legalnym zrębie. Sprawdzić, czy lokalizacja i czas wystarczą do odfiltrowania. Sukces: nadleśnictwo potwierdza, że da dostęp do danych o zleceniach. Bez tego moduł piły nie ma sensu.

## Źródła

[1] https://rfcx.org/guardian
[2] https://www.huawei.com/en/huaweitech/cases/rainforest2
[3] https://rfcx.org/projects/poland
[4] https://www.telepolis.pl/wiadomosci/huawei-tech4all-bialowieski-park-narodowy
[5a] https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10459908/
[5b] https://media.springernature.com/original/springer-static/esm/art%3A10.1007%2Fs10336-025-02307-y/MediaObjects/10336_2025_2307_MOESM1_ESM.docx
[6] https://groupgets.com/audiomoth
[7] https://www.itu.int/ew4all/solution/silvanet/
[8] https://antyweb.pl/smoked-polski-startup-pozary-lasow
[9] https://www.pap.pl/aktualnosci/jak-dziala-system-ochrony-przeciwpozarowej-w-lasach-monitoring-samoloty-i-siec-0
[10] https://www.polsatnews.pl/wiadomosc/2017-03-06/lesnicy-moga-nadal-ciac-okres-legowy-po-zmianie-prawa-ich-nie-obowiazuje/
[11] https://www.rmf24.pl/fakty/polska/news-polska-przegrala-w-tsue-z-ke-ws-zmiany-ustawy-o-lasach,nId,6629904
[12] https://irep.ntu.ac.uk/id/eprint/36123
[13] https://bip2.lasy.gov.pl/pl/bip/px_raport_pgl_lp_2012_szk.pdf
[14] https://www.prawo.pl/biznes/pzp-170000-zl-prog-przetargi,535939.html
[15] https://nowybiuletyn.uodo.gov.pl/systemy-rozpoznawania-glosu-a-ich-wplyw-na-ochrone-danych-i-prywatnosc/?pdf=1830
[16] https://www.boisestate.edu/news/2025/02/03/monitoring-fires-with-infrasound/
[17] https://ibs.bialowieza.pl/wp-content/uploads/2020/09/BORKOWSKI.pdf
[18] https://lasy.gov.pl/pl/informacje/publikacje/do-poczytania/lasy-panstwowe-w-liczbach-1/lasy-w-liczbach_pl_online.pdf
[19] https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10256106/
