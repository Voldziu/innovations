> Model: Claude Opus 5.5 (Claude Code, 5 równoległych subagentów + koordynator) · Data: 2026-11-23

Tryb pracy panelu: równoległe subagenty

## 0. Oczywiste podejścia, które odrzucamy

- **Alarm o nielegalnej wycince (wykrywanie pił łańcuchowych, harwesterów, ciężarówek) dla straży leśnej lub parku.** Wskazało go wszystkich pięciu ekspertów. Robi to od lat Rainforest Connection (system Guardian). W polskim lesie piła w dzień to zwykle legalna praca zakładu usług leśnych, więc fałszywych alarmów byłoby mnóstwo. Kradzież drewna częściej polega na wywozie już ściętych kłód niż na cięciu. Klient publiczny kupuje sprzęt raz, płaci późno i mało.
- **Spis gatunków, monitoring liczebności populacji, „indeks bioróżnorodności” dla naukowców, parków narodowych i RDOŚ.** Też wskazało go wszystkich pięciu. Narzędzia są tanie albo darmowe (BirdNET, Merlin, AudioMoth, Arbimon), a płatnikiem jest grant, nie stały klient. Z samego raportu o tym, co śpiewa w lesie, nie wynika żadna decyzja, za którą ktoś zapłaci.
- **Akustyczne wykrywanie pożarów.** Trzask ognia słychać z kilkudziesięciu metrów i dopiero wtedy, gdy pożar już się rozwinął. Dym widać z kilometrów. Dostrzegalnie, kamery i czujniki dymu są tańsze w przeliczeniu na hektar.
- **Wykrywanie pojazdów w strefach zakazu wjazdu i kłusownictwa.** Samo „słyszę quada albo strzał” niczego nie załatwia, jeśli nikt nie przyjedzie na interwencję. Leśniczy ma pod opieką ponad tysiąc hektarów i nie pojedzie w nocy na każdy alarm.

## 1. Panel ekspertów

### Ekspert 1: Bioakustyk

#### Oczywiste podejścia, które odrzucam
- **Wykrywanie piły, ciągnika i pojazdów (antykłusownictwo, nielegalna wycinka).** Robi to od lat Rainforest Connection [Analogia]. W Polsce nielegalna wycinka to margines, więc trudno znaleźć klienta, który za to zapłaci.
- **Liczenie gatunków i „indeks bioróżnorodności” lasu.** BirdNET i AudioMoth są darmowe lub tanie [Analogia]. Sam raport o tym, co śpiewa w lesie, ma wartość naukową, ale żadna decyzja z niego nie wynika, więc trudno go sprzedać.
- **Akustyczna detekcja pożarów.** Trzask ognia słychać z kilkudziesięciu metrów, a dym widać z kilometrów [Szacunek]. Wieże obserwacyjne i czujniki dymu zawsze będą tańsze w przeliczeniu na hektar.

#### Koncepcja 1: Akustyczny paszport zrębu
- **Opis:** Przed wycinką w sezonie lęgowym (marzec–sierpień) ekipa rozstawia na planowanej powierzchni 4–6 rejestratorów na 5–7 nocy i dni. Model sprawdza, czy są tam gatunki chronione, które gniazdują lub zajmują terytorium. Wynikiem jest dokument „zrąb czysty / przesunąć / wyłączyć fragment” z dowodem audio i znacznikiem czasu.
- **Kto płaci i za co:** Płacą nadleśnictwa i zakłady usług leśnych, a także prywatni właściciele lasów i nabywcy drewna z certyfikatem FSC. Koszt to opłata za każdą przebadaną powierzchnię. Założenie: kilkaset do ponad tysiąca złotych za zrąb, czyli mniej niż dzień przestoju harwestera [Szacunek].
- **Jaki problem klienta rozwiązuje:** TSUE w wyroku C-473/19 i C-474/19 (Skydda Skogen, 4.03.2021) orzekł, że zakazy niszczenia gniazd obowiązują bez względu na to, czy wykonawca działał umyślnie i czy populacja gatunku jest liczna [Źródło: https://curia.europa.eu/jcms/jcms/p1_4519979/sv]. Wykonawca wycinki nie ma dziś taniego sposobu, żeby wykazać należytą staranność. Paszport daje mu dowód i ogranicza ryzyko protestów, kontroli RDOŚ i blokad prac.
- **Rola Voice AI:** System nie tylko wykrywa gatunek. Rozpoznaje też zachowanie, które wskazuje na gniazdowanie: bębnienie i głosy żebrzących piskląt dzięciołów, głosy terytorialne sów o zmierzchu, głosy kontaktowe dorosłych przy dziupli. Ultradźwiękowe głosy społeczne nietoperzy wskazują kryjówkę w drzewie. Do tego dochodzi przybliżona lokalizacja źródła dźwięku z kilku mikrofonów, co pozwala wskazać drzewo lub kępę do zostawienia.
- **Dlaczego to nieoczywiste:** Nie służy monitorowaniu lasu, tylko zabezpiecza prawnie konkretną decyzję gospodarczą. Klientem jest strona, która wycina, a nie ekolodzy.
- **Największe ryzyko:** To, że czegoś nie usłyszano, nie dowodzi, że tego nie ma. Ciche gatunki i deszczowe noce zaniżają wykrywalność. Trzeba podawać prawdopodobieństwo wykrycia i uzgodnić metodykę z RDOŚ, bo inaczej paszport nie będzie miał wartości dowodowej.

#### Koncepcja 2: Śpiewająca rekultywacja
- **Opis:** Na terenach pogórniczych, które się zalesia, system zamknięty w pętli najpierw nasłuchuje, a potem odtwarza głosy gatunków docelowych, żeby przyciągnąć je do zasiedlenia. Gdy usłyszy, że ptaki odpowiadają, a potem śpiewają bez zachęty, wycisza głośnik i przenosi go dalej.
- **Kto płaci i za co:** Płacą spółki wydobywcze i energetyczne, które mają obowiązek rekultywacji (np. odkrywki węgla brunatnego, zwałowiska, kopalnie kruszyw). Kupują abonament w modelu „wynik przyrodniczy jako usługa”: zestaw urządzeń, odtwarzanie oraz kwartalny raport do sprawozdawczości ESRS E4 (bioróżnorodność) w ramach CSRD.
- **Jaki problem klienta rozwiązuje:** Posadzony las przez lata pozostaje „cichy”, a firma musi wykazać, że przyroda faktycznie wraca. Przyspieszenie zasiedlania skraca okres, w którym nie ma czego pokazać w raporcie.
- **Rola Voice AI:** Strona mówiąca: synteza i dobór sekwencji śpiewu, czyli zmienne zwrotki, pory dnia i dialekty lokalne, żeby ptaki nie przyzwyczaiły się do jednego nagrania. Strona słuchająca: wykrywanie odpowiedzi na odtwarzanie i rozróżnianie, czy śpiewa głośnik, czy żywy ptak. Do tego śledzenie, jak z miesiąca na miesiąc przybywa śpiewających samców.
- **Dlaczego to nieoczywiste:** AI nie tylko obserwuje przyrodę, ale aktywnie ją zasiedla dźwiękiem. Jest to realistyczne: odtwarzanie dźwięków zdrowej rafy podwoiło liczebność ryb [Źródło: Gordon i in. 2019, Nature Communications, https://doi.org/10.1038/s41467-019-13186-2]. Odtwarzanie śpiewu przyciągnęło zagrożone wireo czarnogłowe do pustych siedlisk [Źródło: Ward i Schlossberg 2004, Conservation Biology 18(2):519–525].
- **Największe ryzyko:** Może powstać „pułapka ekologiczna”, czyli zwabienie ptaków do siedliska, które nie zapewni im lęgu. Konieczne są: wybór tylko tych gatunków, dla których siedlisko jest już gotowe, nasłuch sukcesu lęgowego (głosy podlotów) oraz zgoda RDOŚ na odtwarzanie głosów gatunków chronionych.

*Założenie: przyjmuję realia polskie. Podawane kwoty to szacunki rzędu wielkości, a nie dane rynkowe.*

### Ekspert 2: Leśniczy

#### Oczywiste podejścia, które odrzucam
- **Wykrywanie pił łańcuchowych i nielegalnej wycinki.** Robi to już Rainforest Connection (Guardian, [Źródło](https://blog.google/technology/ai/fight-against-illegal-deforestation-tensorflow/)). W Polsce piła w lesie w dzień to zwykle legalna praca Zakładu Usług Leśnych (ZUL), więc alarmów byłoby mnóstwo. Kradzież drewna częściej oznacza też wywóz już ściętych kłód ze stosów przy drodze niż samo cięcie.
- **Liczenie ptaków i zwierząt (bioakustyka populacji).** Dobrze wygląda w prezentacji, ale nie ma klienta, który płaciłby za to co roku. Ostatecznie płaci grant naukowy, a nie nadleśnictwo.
- **Wykrywanie pożarów i pojazdów w strefie zakazu.** Pożar słychać dopiero wtedy, gdy już się rozwinął, a punkty obserwacyjne i straż pożarna istnieją. Samo „słyszę samochód” bez reakcji na miejscu niczego nie załatwia, bo leśniczy ma pod opieką ponad tysiąc hektarów i nie przyjedzie w nocy na każdy alarm.

#### Koncepcja 1: „Nocny Stróż Zrębu”
- **Opis:** Przenośny węzeł akustyczny z głośnikiem stawiany na noc przy harwesterze, forwarderze i stosach drewna na powierzchni zrębowej. Rozpoznaje dźwięki typowe dla kradzieży. Gdy je usłyszy, odzywa się z głośnika spersonalizowanym komunikatem i wysyła alarm do właściciela maszyny.
- **Kto płaci i za co:** Prywatne firmy usług leśnych (ZUL) płacą miesięczny abonament za każdy zestaw. Drugim kanałem są ubezpieczyciele i leasingodawcy maszyn, którzy mogą dawać zniżkę na polisę.
- **Jaki problem klienta rozwiązuje:** Maszyny warte kilka milionów złotych stoją nocami w głębi lasu, bez prądu i bez ochrony. Złodzieje spuszczają olej napędowy i kradną części. Kradzieże paliwa z maszyn budowlanych są w Polsce powszechne ([Źródło](https://motoryzacja.interia.pl/wiadomosci/news-systematycznie-kradl-paliwo-z-koparki-i-ciezarowek,nId,6245136)). Dla maszyn leśnych nie znalazłem statystyk, ale zakładam ten sam mechanizm [Szacunek]. Telematyka zgłasza spadek poziomu paliwa dopiero po fakcie.
- **Rola Voice AI:**
  - Słyszy: auto dojeżdżające nocą na zrąb, trzaśnięcie drzwi, kanistry, pompkę, szlifierkę, rozmowy w pobliżu maszyny.
  - Mówi: syntezowany głos informuje, że teren jest nagrywany, a właściciel został powiadomiony („...pojazd zarejestrowany o 2:14”). Właściciel może też przez głośnik odezwać się na żywo.
- **Dlaczego to nieoczywiste:** Klientem nie są Lasy Państwowe, tylko prywatny wykonawca prac. Chronione jest mienie, a nie przyroda. Węzeł wędruje razem z frontem robót, zamiast stać na stałe w lesie.
- **Największe ryzyko:** Łączność GSM na zrębie i fałszywe alarmy od zwierząt. Zakładam łączność LTE lub LoRa z przekaźnikiem na maszynie oraz tryb „uzbrojony” tylko w nocy.

#### Koncepcja 2: „Akustyczna Miedza”
- **Opis:** Szereg węzłów wzdłuż granicy lasu i pola, wybrany na podstawie map szkód z ubiegłych lat. Wykrywają nocne podejście dzików i jeleniowatych. W odpowiedzi odtwarzają zmienne, syntezowane bodźce dźwiękowe i powiadamiają myśliwego dyżurnego, z której strony podchodzą zwierzęta.
- **Kto płaci i za co:** Koła łowieckie płacą sezonowy abonament za kilometr chronionej granicy. Rozliczenie może zależeć od tego, o ile spadną odszkodowania.
- **Jaki problem klienta rozwiązuje:** Koła łowieckie wypłacają rolnikom odszkodowania za szkody łowieckie. Za sezon 2012/2013 łącznie było to 68,3 mln zł według GUS ([Źródło](https://ageconsearch.umn.edu/record/268638/files/Szkody%20%C5%82owieckie.pdf)), a część kół mówi, że grozi im bankructwo ([Źródło](https://radiokrakow.pl/mysliwi-nie-maja-dobrego-pr-rolnicy-nie-maja-upraw)). Myśliwy nie jest w stanie pilnować wszystkich pól każdej nocy.
- **Rola Voice AI:**
  - Słyszy: chrząkanie i kwiczenie dzików, buchtowanie (rycie), łamanie kukurydzy. Lokalizuje źródło dźwięku na podstawie różnicy czasu dotarcia sygnału do kilku węzłów.
  - Mówi: krótkie, za każdym razem inne sekwencje (szczekanie psa, ludzki głos, alarm stada) odtwarzane tylko wtedy, gdy zwierzęta faktycznie są przy polu. Losowość i reagowanie wyłącznie na obecność zwierząt mają opóźnić przyzwyczajanie się do bodźców. Myśliwy dostaje też komunikat głosowy w słuchawce, np. „dziki, sektor 3, wschodni skraj”.
- **Dlaczego to nieoczywiste:** Odwraca standardowy pomysł. System nie liczy zwierząt dla przyrodnika, tylko obsługuje spór rolnik–myśliwy, który ma realną cenę w złotówkach. Strona „mówiąca” działa jako aktywny, adaptacyjny odstraszacz.
- **Największe ryzyko:** Dziki przyzwyczajają się do bodźców. Proste odstraszacze dźwiękowe dla rolników już istnieją i z czasem tracą skuteczność [Analogia]. Do tego dochodzą skargi mieszkańców na hałas w pobliżu zabudowań. Trzeba to sprawdzić w jednym sezonie pilotażowym na kilku kołach, porównując ich odszkodowania z kołami bez systemu.

*Założenie: obie koncepcje korzystają wyłącznie z mikrofonów, głośników, łączności i klasyfikacji dźwięku lub syntezy mowy, bez kamer.*

### Ekspert 3: Finanse klimatyczne i ESG

#### Oczywiste podejścia, które odrzucam
- **Alarmy o wycince, kłusownictwie i pojazdach dla straży leśnej.** Rainforest Connection robi to od lat [Analogia: https://www.rfcx.org], a nadleśnictwo to klient z małym budżetem, który kupuje sprzęt raz, a nie usługę.
- **Wczesne wykrywanie pożarów.** Tu wygrywają tańsze i sprawdzone czujniki dymu i kamery, więc samo „słyszę trzask ognia” nie obroni się w konkurencji.
- **Spis gatunków lub indeks bioakustyczny dla naukowców i parków narodowych.** Platformy takie jak Arbimon dają to za darmo [Źródło: https://www.rfcx.org/ecoacoustics], więc nie ma tu modelu przychodowego.

#### Koncepcja 1: Akustyczna wyrocznia ryzyka dla ubezpieczycieli kredytów
- **Opis:** Sieć mikrofonów na terenie projektu węglowego lub przyrodniczego działa jak ciągły „licznik ryzyka utraty trwałości” (permanence). Mierzy minuty pracy pił, ruch silników, strzały i trzaski ognia na hektar, a do tego spadek biofonii jako wczesny sygnał degradacji. Z tych danych powstaje indeks, którym ubezpieczyciel wycenia składkę, a w wersji parametrycznej uruchamia wypłatę.
- **Kto płaci i za co:** Ubezpieczyciele i reasekuratorzy kredytów (np. Kita, coverholder Lloyd's [Źródło: https://www.theinsurer.com/article/kita-insurance-can-aid-scale-and-confidence-as-voluntary-carbon-market-develops/]) oraz agencje ratingowe kredytów. Płacą abonament za każdy monitorowany projekt i opłatę za każdy raport szkodowy.
- **Jaki problem klienta rozwiązuje:** Ubezpieczyciel nie ma niezależnych, częstych danych o tym, co dzieje się na terenie projektu, więc wycenia ryzyko „na oko”. Kita w stanowisku dla UNFCCC postuluje szybki raport o incydencie przed pełnym dochodzeniem [Źródło: https://www.unfccc.int/sites/default/files/resource/SBM018_CFI_reversals_Kita.pdf]. Znacznik czasu z nagrania jest właśnie takim raportem.
- **Rola Voice AI:** Klasyfikacja dźwięków antropogenicznych (piła, ciągnik zrywkowy, strzał, ogień) i przyrodniczych, lokalizacja źródła przez triangulację. Hash surowego audio trafia do rejestru, żeby audytor mógł odsłuchać dowód.
- **Dlaczego to nieoczywiste:** Nikt w lesie nie reaguje na alarm. Ten sam dźwięk piły staje się szeregiem czasowym danych finansowych, a odbiorcą jest underwriter w Londynie, nie leśniczy.
- **Największe ryzyko:** Rynek ubezpieczeń kredytów jest młody i niemal nie było jeszcze wypłat [Źródło: https://trellis.net/article/insurers-hope-new-policies-covering-carbon-credits-will-restore-trust-battered-market]. Do tego gęstość czujników potrzebna, żeby objąć duży projekt, może zjeść marżę. [Szacunek] Zakładam, że jeden czujnik słyszy piłę w promieniu około 1 km. Wtedy 10 000 ha wymaga około 30–40 czujników, przy kosztach rzędu dziesiątek tysięcy USD rocznie. To ma sens tylko przy projektach wartych miliony.

#### Koncepcja 2: Las, który odpowiada. Aktywne ankiety głosowe dla banków siedlisk
- **Opis:** Urządzenie nie tylko słucha, ale też mówi. Według harmonogramu odtwarza zsyntetyzowane głosy gatunków skrytych (sowy, derkacz, chruściele) i rozpoznaje odpowiedzi. To automatyzacja standardowej metody ornitologicznej, czyli stymulacji głosowej (playback) [Analogia]. Każda sesja daje powtarzalny, odsłuchiwalny dowód obecności gatunku na hektarze, który wchodzi do raportu monitoringowego.
- **Kto płaci i za co:** Operatorzy banków siedlisk w ramach angielskiego Biodiversity Net Gain, którzy muszą utrzymywać siedliska przez minimum 30 lat [Źródło: https://www.gov.uk/guidance/understanding-biodiversity-net-gain], oraz deweloperzy kredytów bioróżnorodności. Płacą za każdy roczny raport stanu gatunków wskaźnikowych.
- **Jaki problem klienta rozwiązuje:** Metodyki kredytów, np. Wallacea Trust z „koszykiem wskaźników” i 1% uplift na hektar, wymagają porównania z linią bazową [Źródło: https://carbon-pulse.com/233151]. Ręczne nocne liczenia przez ekologów są drogie, rzadkie i łatwe do podważenia. Pasywny nasłuch przeocza gatunki, które milczą, dopóki ktoś ich nie sprowokuje.
- **Rola Voice AI:** Synteza i odtwarzanie wokalizacji, wykrywanie i klasyfikacja odpowiedzi w oknie czasowym, szacowanie odległości i kierunku. Dodatkowo krótki raport głosowy dla audytora po wizycie terenowej, np. „sektor 4: puszczyk, 3 odpowiedzi”.
- **Dlaczego to nieoczywiste:** Voice AI zwykle służy w ekologii do biernego słuchania. Tu aktywnie „przesłuchuje” przyrodę, a wynikiem jest dowód o standardzie audytowym, a nie ciekawostka naukowa.
- **Największe ryzyko:** Odtwarzanie głosów niepokoi zwierzęta. W okresie lęgowym może wymagać zezwoleń, a za częste ankiety zmieniają zachowanie ptaków (habituacja). Druga kwestia: angielska metryka BNG opiera się na siedliskach, nie gatunkach. Zakładam więc, że dane gatunkowe będą sprzedawane jako dowód uzupełniający lub do przyszłych kredytów gatunkowych (np. Verra Nature Framework [Źródło: https://verra.org/methodologies/nature-framework/]).

### Ekspert 4: Inżynier systemów akustycznych

#### Oczywiste podejścia, które odrzucam
- **Spis gatunków i liczebności z nagrań (BirdNET na rejestratorach).** Takie narzędzia już są tanie i ogólnodostępne [Analogia: BirdNET, AudioMoth za ok. 80 USD, [GroupGets](https://groupgets.com/audiomoth)], a odbiorca (naukowcy, parki narodowe) ma mały budżet, więc nie widać tu przewagi ani wyraźnego płatnika.
- **Wykrywanie pił łańcuchowych i nielegalnej wycinki.** Robi to Rainforest Connection na starych telefonach [Analogia]. W Polsce las jest gęsto pilnowany przez Lasy Państwowe, więc problem jest mały, a fałszywych alarmów będzie dużo.
- **Wykrywanie pożarów i pojazdów w strefach zakazu.** Pożar słychać dopiero wtedy, gdy kamery na dostrzegalniach już go widzą. Wykrycie quada nic nie daje, jeśli nikt nie przyjedzie na interwencję.

Założenie: działamy w Polsce. Pozycja węzłów jest stała, a dane wysyłamy przez LoRa lub zbieramy ręcznie, bez zasięgu GSM.

#### Koncepcja 1: „Akustyczna miedza” (abonament dla kół łowieckich)
- **Opis:** Na skraju lasu przy polach uprawnych wieszamy węzły z mikrofonem i głośnikiem, montowane na istniejących amboninach i paśnikach. Model działający na urządzeniu rozpoznaje dziki i jelenie wchodzące w pole. Dopiero wtedy węzeł odtwarza zmienny zestaw odstraszających dźwięków. Każde zdarzenie trafia do dziennika ze znacznikiem czasu.
- **Kto płaci i za co:** Koła łowieckie płacą abonament za kilometr chronionej granicy pola i lasu, np. za sezon wegetacyjny.
- **Jaki problem klienta rozwiązuje:** Koła płacą rolnikom odszkodowania. Łącznie to ok. 118 mln zł, z czego ponad 105 mln zł płacą koła łowieckie i ośrodki hodowli zwierzyny PZŁ [Źródło: [streszczenie IBL, Flis](https://www.ibles.pl/wp-content/uploads/2024/02/Flis-streszczenie.pdf); rok nie jest podany w streszczeniu]. Dziennik zdarzeń jest też dowodem przy sporach o to, kiedy i przez kogo powstała szkoda. Dziś szkodę szacuje sam płacący, co rodzi konflikt [Źródło: [prawo.pl](https://www.prawo.pl/samorzad/szkody-lowieckie-rolnicy-chca-zmian-w-systemie-odszkodowan,1549271.html)].
- **Rola Voice AI:** Na wejściu klasyfikacja dźwięków: pochrząkiwanie i buchtowanie dzików, kroki dużych ssaków, odróżnianie ich od psów i ludzi. Na wyjściu synteza dźwięku: odtwarzanie alarmowych głosów dzików i odgłosów drapieżników, z losowaną kolejnością i barwą. Gra tylko wtedy, gdy zwierzę jest obecne, co ma ograniczyć przyzwyczajenie.
- **Dlaczego to nieoczywiste:** „Słuchacz lasu” nie służy tu ochronie przyrody, tylko gospodarce łowieckiej i rozwiązywaniu sporów. Klient ma realny koszt, który da się wycenić. Pomysł jest wykonalny, bo podobne rozwiązania już działają: UOZ-1 na torach PKP PLK, choć to wersja „głucha”, bez nasłuchu [Analogia: [Stolarski](https://yadda.icm.edu.pl/baztech/element/bwmeta1.element.baztech-article-BGPK-2071-7665/c/Stolarski.pdf)], oraz system ZHAW z głosami alarmowymi dzików [Analogia: [ZHAW](https://www.zhaw.ch/en/about-us/news/news-releases/news-detail/event-news/using-an-acoustic-signal-to-prevent-wild-boars-from-damaging-crops)]. Koszt węzła to ok. 600–900 zł: rejestrator ok. 350 zł, głośnik i wzmacniacz ok. 150 zł, panel 10 W z akumulatorem ok. 200 zł. Przy jednym węźle na 150–200 m to ok. 4 tys. zł za kilometr [Szacunek]. Głośnik ma zasięg kilkudziesięciu metrów, a odtwarzanie tylko po wykryciu oszczędza energię.
- **Największe ryzyko:** Zwierzęta mogą się przyzwyczaić. W badaniach odstraszaczy skuteczność spadała z czasem [Źródło: [Springer 2022](https://link.springer.com/article/10.1007/s10344-022-01599-2)]. Trzeba to sprawdzić w pilotażu na co najmniej jeden sezon, porównując pola z węzłami i bez nich.

#### Koncepcja 2: „Automatyczny nocny inwentaryzator” (B2B dla firm przygotowujących raporty OOŚ)
- **Opis:** Węzeł sam prowadzi nocne kontrole z odtwarzaniem głosów (stymulacją głosową) sów, lelka i derkacza. O zaplanowanej godzinie odtwarza głos terytorialny danego gatunku, a potem przez kilka minut nasłuchuje odpowiedzi. Kilka węzłów rozstawionych w siatce wyznacza położenie odpowiadającego ptaka.
- **Kto płaci i za co:** Firmy konsultingowe przygotowujące inwentaryzacje przyrodnicze do raportów OOŚ dla farm wiatrowych, dróg i linii energetycznych. Płacą za wynajem zestawu na sezon i za raport z mapą stanowisk.
- **Jaki problem klienta rozwiązuje:** Nocny nasłuch wymaga wielu wyjazdów eksperta. Pojedyncza kontrola łatwo przeoczy aktywnego ptaka [Źródło: [Mirski, SGGW](https://cepl.sggw.edu.pl/wp-content/uploads/sites/75/2021/08/Mirski.pdf?x68467)]. Przy np. 30 punktach i 3 kontrolach to ok. 90 punktonocy pracy eksperta, a sieć węzłów może powtarzać kontrolę co noc przez cały sezon [Szacunek].
- **Rola Voice AI:** Synteza i odtwarzanie głosów stymulujących, potem rozpoznanie odpowiedzi gatunku i lokalizacja źródła na podstawie różnic czasu dotarcia dźwięku (TDOA) do kilku węzłów.
- **Dlaczego to nieoczywiste:** Urządzenie nie tylko pasywnie słucha, ale samo zadaje ptakowi „pytanie” i odbiera odpowiedź. Odtwarza ręczną metodę terenową, którą już stosuje się w monitoringu [Analogia: [OPN, punkty ze stymulacją](https://opn.gov.pl/pliki-do-pobrania/otworz/bf85092c-f2a4-4d01-ac68-22bb7fe97a5b.pdf)].
- **Największe ryzyko:** Prawo i ekologia. Wielokrotne odtwarzanie głosów może płoszyć chronione gatunki, co może wymagać zezwolenia RDOŚ. Trzeba też, żeby RDOŚ uznał taką metodę w raporcie. Ograniczenie ryzyka: z góry ustalony limit odtwarzań na noc i walidacja wyników z ornitologiem w pierwszym sezonie.

### Ekspert 5: Przedsiębiorca spoza branży

#### Oczywiste podejścia, które odrzucam
- **Alarm o nielegalnej wycince dla straży leśnej lub parku.** To już działa w praktyce (Rainforest Connection i system Guardian [Analogia], https://rfcx.org/?p=5163), więc nie jest oryginalne. Do tego klientem jest budżet publiczny, który płaci późno i mało.
- **Monitoring liczebności i populacji gatunków dla naukowców i RDOŚ.** To standard bioakustyki (BirdNET, Merlin Sound ID [Źródło], https://www.allaboutbirds.org/news/whats-that-bird-song-merlin-bird-id-can-tell-you/). Płacą granty, a z grantów nie zbuduje się skalowalnej firmy.
- **Wczesne wykrywanie pożaru lasu.** To pierwszy pomysł każdego. Konkurują z nim gotowe, tańsze czujniki, a akustyka słyszy ogień dopiero wtedy, gdy już się rozwinął, więc jako jedyny detektor jest słaba.

#### Koncepcja 1: Akustyczny dowód nienaruszalności dla ubezpieczycieli kredytów węglowych
- **Opis:** Sieć nasłuchu w lasach objętych projektami węglowymi. Działa jak „czarna skrzynka” polisy: przez całą dobę rejestruje dowody, że las stoi i żyje. Ubezpieczyciel dostaje ciągły wskaźnik ryzyka zamiast rzadkich audytów, a w razie szkody materiał dowodowy z dokładnym czasem zdarzeń.
- **Kto płaci i za co:** Ubezpieczyciele ryzyka odwrócenia (reversal), na przykład Kita, który działa jako coverholder Lloyd's i sprzedaje Buffer Depletion Insurance [Źródło], https://www.msci.com/research-and-insights/blog-post/insurance-joins-list-of-options-to-de-risk-carbon-credits. Płacą abonament za hektar, a deweloper projektu dostaje w zamian niższą składkę. Model znam z telematyki w ubezpieczeniach komunikacyjnych [Analogia].
- **Jaki problem klienta rozwiązuje:** Ubezpieczyciel wycenia ryzyko po omacku, na podstawie danych, które deweloper zgłasza sam o sobie. Kita w konsultacjach UNFCCC zwracał uwagę, że samoraportowanie może zaniżać ryzyko [Źródło], https://unfccc.int/sites/default/files/resource/Kita.pdf. Do tego dochodzą drogie wizyty likwidatorów szkód.
- **Rola Voice AI:**
  - System słyszy piły, harwestery, ciężarówki i strzały. Liczy też akustyczny wskaźnik bioróżnorodności, bo spadek liczby gatunków to wczesny sygnał degradacji, zanim las zniknie.
  - System mówi i rozumie mowę: leśnik zgłasza incydent głosem w terenie („zwalone drzewa, sektor 12”), a system zamienia nagranie w ustrukturyzowane zgłoszenie szkody (odpowiednik FNOL, czyli pierwszego zgłoszenia szkody).
- **Dlaczego to nieoczywiste:** Klientem nie jest obrońca lasu, tylko podmiot, który traci pieniądze, kiedy las znika. Ochrona przyrody staje się wtedy wprost częścią wyceny ryzyka.
- **Największe ryzyko:** Rynek kredytów węglowych jest mały i niestabilny, a jego reputacja ucierpiała. Drugie ryzyko to wymagany zasięg. Szacuję, że jeden czujnik obejmuje 1–3 km² [Szacunek: slyszalność piły rzędu 1 km w gęstym lesie], więc projekt na 10 000 ha potrzebuje około 50–100 urządzeń.

#### Koncepcja 2: Przewodnik, który słyszy las teraz
- **Opis:** Głosowy przewodnik dla turystów w parkach i ośrodkach glampingowych. Nie odtwarza nagrań z puszki, tylko na żywo opowiada, co w tej chwili dzieje się w lesie: „300 m na północ od dziesięciu minut odzywa się puszczyk, zatrzymaj się tutaj”. Ta sama sieć prowadzi grupy z dala od aktywnych legowisk, o których wie z nasłuchu.
- **Kto płaci i za co:** Operatorzy turystyczni, hotele przy parkach i parki narodowe sprzedające bilety. Płacą licencję za stanowisko lub prowizję od biletu na „nocny spacer na słuch”. Część przychodu idzie na fundusz ochrony parku.
- **Jaki problem klienta rozwiązuje:** Turysta płaci za kontakt z dziką przyrodą, a zwykle widzi tylko drzewa. Operator nie potrafi zagwarantować wrażeń. Park chce przychodu, ale nie chce płoszenia zwierząt.
- **Rola Voice AI:**
  - System słyszy i lokalizuje głosy zwierząt na żywo. Na tej podstawie wie, gdzie wyją młode wilki, i zamyka te strefy dla grup.
  - System mówi: syntetyzuje narrację w wielu językach i rozumie pytania zadawane szeptem („co to było?”).
  - System prowadzi ruch: słyszy, kiedy grupa robi się za głośna, i łagodnie ją ucisza.
- **Dlaczego to nieoczywiste:** Sieć ochronna staje się produktem rozrywkowym. Ta sama wiedza, która przyciąga turystę, chroni zwierzęta przed tym turystą. Przewodnik nie potrzebuje kamer ani obecności człowieka.
- **Największe ryzyko:**
  - Turystyka jest sezonowa, a narracja wymaga niskich opóźnień w lesie bez zasięgu. Założyłem lokalny serwer brzegowy przy ośrodku.
  - Pojawia się ryzyko etyczne: dane o lokalizacji zwierząt mogą wyciec do kłusowników. Dlatego system podaje tylko kierunek przybliżony co do strefy i z opóźnieniem dla gatunków wrażliwych [Szacunek: założenie projektowe].

Założenie: obie koncepcje korzystają z tej samej sieci sprzętowej. Pierwsza daje stabilny przychód B2B, druga daje markę i przychód sezonowy.

## 2. Ocena wszystkich koncepcji

| Koncepcja | Ekspert | Oryginalność 1–10 | Wykonalność 1–10 | Uzasadnienie |
|---|---|---|---|---|
| Akustyczny paszport zrębu | 1. Bioakustyk | 9 | 7 | Nikt nie sprzedaje akustycznego dowodu należytej staranności przed konkretną wycinką. Klasyfikacja ograniczonej listy gatunków działa dziś dobrze (BirdNET z progowaniem osiąga precyzję ≥0,9 dla 70% z 61 gatunków w niemieckim lesie [Źródło](https://www.nw-fva.de/fileadmin/nwfva/publikationen/pdf/singer_2024_aggregated_time-series_features_boost_species-specific.pdf)). Natomiast rozpoznawanie *zachowania lęgowego* (głosy żebrzących piskląt) wymaga własnego modelu, a „nie usłyszano” nie dowodzi „nie ma”, stąd 7, a nie 9. |
| Śpiewająca rekultywacja | 1. Bioakustyk | 8 | 4 | Wabienie ptaków odtwarzaniem ma podstawy naukowe, ale efekt przychodzi po latach, grozi pułapką ekologiczną, a popyt na raporty ESRS E4 jest niepewny [Szacunek], więc spółka wydobywcza raczej nie zapłaci w ciągu roku. |
| Nocny Stróż Zrębu | 2. Leśniczy | 6 | 7 | Ból klienta (ZUL) jest realny i technicznie to proste wykrywanie zdarzeń w ciszy nocnej, ale w istocie jest to alarm antykradzieżowy: chroni mienie, nie przyrodę, i konkuruje z gotowymi systemami alarmowymi oraz telematyką. |
| Akustyczna Miedza | 2. Leśniczy | 6 | 5 | Płatnik ma policzalny koszt (odszkodowania), ale odstraszacze dźwiękowe już istnieją, zwierzęta się do nich przyzwyczajają, a wykrywanie dzików po dźwięku na otwartym skraju pola przy wietrze i deszczu jest zawodne [Szacunek]. |
| Akustyczna wyrocznia ryzyka dla ubezpieczycieli kredytów | 3. Finanse/ESG | 5 | 3 | W rdzeniu to wciąż wykrywanie pił, czyli odrzucona oczywistość z nowym odbiorcą. Rynek ubezpieczeń kredytów węglowych jest młody, polskie lasy praktycznie nie są projektami węglowymi, a gęstość czujników (30–100 na 10 000 ha) zjada marżę. |
| Las, który odpowiada (ankiety z odtwarzaniem dla banków siedlisk) | 3. Finanse/ESG | 7 | 5 | Automatyczna stymulacja głosowa jest technicznie udowodniona ([Ausband i in. 2011, USGS](https://pubs.usgs.gov/publication/70003753)), ale angielski BNG liczy siedliska, nie gatunki, więc płatnik jest hipotetyczny i daleko od Polski. |
| Akustyczna miedza (abonament dla kół łowieckich) | 4. Inżynier | 6 | 6 | Duplikat koncepcji Leśniczego, ale lepiej policzony (4 tys. zł/km, analogie ZHAW i UOZ-1). Ryzyko przyzwyczajenia zwierząt pozostaje nierozwiązane. |
| Automatyczny nocny inwentaryzator dla firm OOŚ | 4. Inżynier | 7 | 7 | Jasny płatnik komercyjny i metoda znana z terenu. Ryzyko: firmy OOŚ mogą kupić sprzęt i zrobić to same, a RDOŚ musi uznać metodę. |
| Akustyczny dowód nienaruszalności dla ubezpieczycieli | 5. Przedsiębiorca | 5 | 3 | Niemal ten sam pomysł co wyrocznia ryzyka Eksperta 3, z tymi samymi słabościami. Plus za głosowe zgłaszanie szkód (FNOL), które da się przenieść gdzie indziej. |
| Przewodnik, który słyszy las teraz | 5. Przedsiębiorca | 7 | 4 | Efektowne, ale wymaga lokalizacji zwierząt w czasie rzeczywistym w gęstej sieci z łącznością w lesie. Turystyka jest sezonowa, a podawanie pozycji zwierząt grozi wyciekiem do kłusowników. |

**Powtórzenia i nakładanie się (eksperci pracowali niezależnie):**
- **„Akustyczna miedza”** zaproponowali niezależnie Leśniczy i Inżynier, nawet pod tą samą nazwą. To mocny sygnał, że problem szkód łowieckich jest widoczny z kilku stron.
- **Ubezpieczenia kredytów węglowych** (Ekspert 3, Koncepcja 1, i Ekspert 5, Koncepcja 1) to ten sam pomysł: ten sam klient (Kita/Lloyd's) i te same źródła.
- **Aktywna stymulacja głosowa (playback i nasłuch odpowiedzi)** pojawia się u trzech ekspertów: Finanse/ESG (banki siedlisk), Inżynier (inwentaryzator OOŚ) i Bioakustyk (w odwróconej formie wabienia przy rekultywacji). Najbardziej nieoczywisty wspólny motyw panelu to las, który nie tylko jest podsłuchiwany, ale sam „zadaje pytania”.
- **Powierzchnia zrębowa jako miejsce działania** łączy Paszport zrębu (Bioakustyk) i Nocnego Stróża (Leśniczy): oba urządzenia wędrują razem z frontem robót.

## 3. Synteza rozwiązania

### 3.1. Rdzeń i uzasadnienie wyboru

**Rdzeń: Akustyczny paszport zrębu (Ekspert 1).** Ma najwyższą sumę ocen (9 + 7) i jako jedyna koncepcja spełnia jednocześnie trzy warunki inwestora:

1. **Ktoś płaci z konkretnego powodu.** Gospodarka leśna w UE działa pod rosnącą presją prawną. TSUE w sprawie Skydda Skogen (C-473/19 i C-474/19, 2021) orzekł, że zakazy dyrektyw ptasiej i siedliskowej chronią osobniki i ich gniazda, a nie tylko populacje [Źródło](https://curia.europa.eu/jcms/jcms/p1_4519979/sv). W sprawie C-432/21 (2 marca 2023 r.) TSUE orzekł przeciwko Polsce w sprawie przepisów ustawy o lasach, które wyłączały gospodarkę leśną prowadzoną według „dobrej praktyki” spod zakazów ochrony gatunkowej [Źródło](https://bip.brpo.gov.pl/pl/content/rpo-sejm-wykonac-wyrok-tsue-ustawa-o-lasach-projekt-senacki). Rząd przyjął projekt nowelizacji, który ma ten wyrok wykonać [Źródło](https://www.gov.pl/web/climate/the-council-of-ministers-has-adopted-a-draft-bill-amending-the-forest-act-and-certain-other-acts). Kto tnie w sezonie lęgowym, potrzebuje więc dowodu, że sprawdził, czy niszczy gniazda.
2. **Da się to zbudować w rok.** Rejestratory są tanie i dojrzałe, klasyfikatory ptaków działają, a model rozpoznawania zachowań lęgowych dla 8–12 gatunków docelowych to zadanie inżynierskie, a nie naukowe. Nie potrzeba łączności w czasie rzeczywistym, bo karty pamięci zbiera się po 5–7 dobach.
3. **Pomysł jest nieoczywisty.** Wszyscy eksperci odrzucili „monitoring bioróżnorodności” jako oczywistość bez płatnika. Paszport odwraca ten pomysł: nie monitoruje lasu, tylko zabezpiecza jedną decyzję gospodarczą, a płaci ten, kto wycina, nie przyrodnik.

Koncepcje „Las, który odpowiada” i „Nocny inwentaryzator” miały podobną wykonalność, ale ich płatnicy są słabsi (rynek BNG w Anglii) albo mogą łatwo zrobić to sami (firmy OOŚ). Ich najlepszy pomysł, czyli aktywną stymulację, warto natomiast wbudować w rdzeń jako rozwiązanie jego największego ryzyka.

### 3.2. Dołączone elementy

| Element | Z koncepcji | Co wzmacnia w rdzeniu | Jak spełnia trzy warunki |
|---|---|---|---|
| **Aktywna stymulacja głosowa gatunków skrytych:** węzeł o zmierzchu i w nocy odtwarza głos terytorialny sowy lub dzięcioła, a potem nasłuchuje odpowiedzi | „Las, który odpowiada” (Ekspert 3), „Nocny inwentaryzator” (Ekspert 4) | Rozwiązuje największe ryzyko rdzenia („nie usłyszano ≠ nie ma”). Gatunki milczące odzywają się na bodziec, więc prawdopodobieństwo wykrycia rośnie, a paszport może podać je liczbowo | (1) Ten sam węzeł, dodany tylko głośnik. (2) Synteza dźwięku i rozpoznawanie odpowiedzi to czysta Voice AI. (3) Klient i produkt się nie zmieniają: paszport jest po prostu pewniejszy |
| **Audytowalny dowód audio:** każdy klip z wykryciem dostaje skrót SHA-256 i kwalifikowany znacznik czasu, a w raporcie jest link do odsłuchu | „Akustyczna wyrocznia ryzyka” (Ekspert 3), „Dowód nienaruszalności” (Ekspert 5) | Zamienia raport z „opinii firmy” w dowód, który da się zweryfikować w sporze z RDOŚ, organizacją przyrodniczą lub w sądzie | (1) Te same nagrania. (2) Inteligencja pozostaje w Voice AI, a skrót i znacznik czasu to infrastruktura. (3) Wzmacnia główną wartość, czyli dowód należytej staranności |
| **Głosowy interfejs dla leśniczego i operatora harwestera:** syntezowany brief „co i gdzie zostawić” oraz głosowe potwierdzenie wykonania („drzewo oznaczone, bufor 20 m”) zamieniane w zapis protokołu | Głosowe zgłaszanie szkód (FNOL) z „Dowodu nienaruszalności” (Ekspert 5) oraz „mówiący” węzeł z „Nocnego Stróża” (Ekspert 2) | Domyka pętlę od wykrycia do działania. Wynik trafia do człowieka w kabinie maszyny, który nie przeczyta mapy, a zatwierdzenie wraca do paszportu jako dowód wykonania | (1) Te same dane i ten sam raport. (2) Synteza i rozpoznawanie mowy. (3) Odbiorcą pozostaje nadleśnictwo i jego wykonawcy |

### 3.3. Elementy celowo odrzucone

- **Nocny Stróż Zrębu (ochrona maszyn ZUL).** Kusi, bo węzły i tak stoją na zrębie, a ZUL ma pieniądze. Wprowadza jednak drugiego klienta i inną wartość (ochrona mienia), wymaga łączności w czasie rzeczywistym i całonocnego zasilania, a w momencie wejścia maszyn nasze węzły już wyjeżdżają. Rozmyłby produkt i zespół.
- **Ubezpieczenia kredytów węglowych.** Bierzemy z nich tylko ideę dowodu audio. Sam rynek jest młody, polskich projektów węglowych w lasach praktycznie nie ma, a wymagany ciągły monitoring dużych obszarów to zupełnie inna ekonomika niż kilkudniowe badanie jednej powierzchni.
- **Przewodnik dla turystów i Akustyczna miedza.** Obie mają innych klientów (turystyka, koła łowieckie) i inne miejsce działania (szlaki, skraj pola). Przewodnik dodatkowo publikuje pozycje zwierząt, co kłóci się z ochroną gniazd, którą sprzedajemy.

## 4. Rozwiązanie w szczegółach

### 4.1. Nazwa i opis w jednym zdaniu (elevator pitch)

**EchoZrąb** to usługa, w której przed każdą wycinką w sezonie lęgowym kilka węzłów akustycznych przez 5–7 dób słucha planowanej powierzchni i „zadaje pytania” ukrytym gatunkom. Z odpowiedzi powstaje paszport zrębu z wynikiem „ciąć / przesunąć termin / zostawić te drzewa”, dowodem audio i znacznikiem czasu, a operator harwestera dostaje głosowy brief, co ma zostawić.

### 4.2. Problem i klient: kto ma problem, kto płaci, ile dziś traci

**Główny klient: nadleśnictwo** (PGL Lasy Państwowe). LP zarządzają ok. 7,1 mln ha lasów [Źródło](https://lasy.gov.pl/pl/informacje/publikacje/do-poczytania/lasy-panstwowe-w-liczbach-1/lasy-w-liczbach_pl_online.pdf) w ok. 430 nadleśnictwach [Źródło](https://lasy.gov.pl/pl/informacje/publikacje/do-poczytania/lasy-panstwowe-w-liczbach-1/lasy-panstwowe-w-liczbach-2014). Średnia sprzedaż drewna w latach 2018–2024 wynosiła 40,9 mln m³ rocznie [Źródło](https://www.gov.pl/web/klimat/raport-o-sytuacji-branzy-lesno-drzewnej). Prace nie zatrzymują się w sezonie lęgowym, bo w 2017 r. Lasy Państwowe zostały wyłączone spod części zakazów dotyczących miejsc lęgowych [Źródło](https://www.polsatnews.pl/wiadomosc/2017-03-06/lesnicy-moga-nadal-ciac-okres-legowy-po-zmianie-prawa-ich-nie-obowiazuje/). To właśnie to wyłączenie TSUE zakwestionował w 2023 r.

**Problem nadleśnictwa w trzech zdaniach:**
1. **Wiedza o gniazdach jest nieaktualna.** Inwentaryzacja przyrodnicza powstaje przy planie urządzenia lasu, który obowiązuje 10 lat (ustawa o lasach z 28 września 1991 r.). Dziupla dzięcioła czy gniazdo jastrzębia mogą powstać w dowolnym roku tego okresu.
2. **Brakuje dowodu staranności.** Gdy wycinka w maju staje się tematem protestu, skargi organizacji przyrodniczej albo kontroli RDOŚ, nadleśnictwo nie ma udokumentowanego dowodu, że sprawdziło powierzchnię. Wyrok C-432/21 i toczące się prace legislacyjne oznaczają, że ten dowód będzie coraz potrzebniejszy [Szacunek: wnioskuję z kierunku orzecznictwa, a nie z konkretnego przepisu, bo status nowelizacji jest dla mnie niepotwierdzony].
3. **Ręczna kontrola jest droga i rzadka.** Wizyta ornitologa to jedno do dwóch wejść na powierzchnię, w ciągu dnia, bez zapisu.

**Ile dziś traci [Szacunek]:**
- Przestój kontraktu z ZUL po wstrzymaniu prac (harwester z obsługą to kilka tysięcy złotych dziennie).
- Koszt ręcznej kontroli ornitologicznej: ok. 4 wizyty × ok. 600 zł = ok. 2 400 zł na powierzchnię.
- Koszt wizerunkowy i prawny sporów, który trudno wycenić, ale który dziś trafia do mediów ogólnopolskich.

**Klienci drugiej kolejności, ale ten sam produkt:** prywatni właściciele lasów, których wyłączenie z 2017 r. nie obejmowało, oraz rynki skandynawskie. Szwedzki Naturvårdsverket opublikował w 2025 r. analizę wyroku TSUE doprecyzowującego ochronę ptaków w okresie lęgowym w lasach gospodarczych [Źródło](https://www.naturvardsverket.se/om-oss/aktuellt/nyheter-och-pressmeddelanden/2025/oktober/analys-av-eu-dom-fortydligat-skydd-av-faglar-under-hackningstid/).

### 4.3. Jak to działa: rola Voice AI krok po kroku (od dźwięku w lesie do decyzji lub działania)

1. **Zlecenie.** Leśniczy wybiera z planu cięć powierzchnię w sezonie lęgowym (marzec–sierpień), w drzewostanie starszym niż ok. 80 lat albo w obszarze Natura 2000. Zamówienie składa głosem w aplikacji („oddział 214b, rębnia, termin 12 maja”). Rozpoznawanie mowy po polsku działa offline (np. model Whisper obsługuje polski [Źródło](https://github.com/openai/whisper)).
2. **Rozstawienie.** Podleśniczy, który i tak jest w terenie, wiesza 4 węzły na pniach w siatce co ok. 100–150 m. Na typową powierzchnię 1–5 ha z buforem to wystarcza, przy założeniu efektywnego promienia wykrycia głosu dzięcioła lub sowy rzędu 75–150 m [Szacunek: zasięg mocno zależy od siedliska i pogody, co pokazało polskie badanie 31 gatunków w dwóch typach lasu, [Winiarska i in. 2024](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10776575/)]. Każdy węzeł to rejestrator klasy AudioMoth z mikrofonem, który próbkuje do 384 kHz, więc słyszy też nietoperze, oraz z małym głośnikiem.
3. **Nasłuch pasywny (5–7 dób).** Węzeł nagrywa w oknach: świt, zmierzch, noc. Model na urządzeniu wykrywa aktywność głosową (VAD) i **wycina fragmenty z mową ludzką przed zapisem**, co jest kluczowe dla prywatności (4.9).
4. **Stymulacja głosowa (element dołączony).** O zmierzchu, raz na noc, węzeł odtwarza zsyntetyzowany, za każdym razem nieco inny głos terytorialny gatunku docelowego (puszczyk, włochatka, sóweczka, dzięcioł czarny lub średni). Następnie przez 3–5 minut nasłuchuje odpowiedzi. Automatyczne urządzenia typu „zawołaj i słuchaj” są opisane w literaturze [Źródło](https://pubs.usgs.gov/publication/70003753), a odtwarzanie jest standardem w liczeniu sów [Źródło](https://ftp-public.abmi.ca/home/publications/documents/69_Bayne_2014_OwlsReport2012_ABMI.pdf). Limit to jedno odtwarzanie na noc na gatunek.
5. **Analiza (w chmurze, po zebraniu kart).** Pracują trzy warstwy modeli:
   - **(a) Gatunek:** klasyfikator ogólny typu BirdNET z progami dobranymi dla poszczególnych gatunków [Źródło](https://www.nw-fva.de/fileadmin/nwfva/publikationen/pdf/singer_2024_aggregated_time-series_features_boost_species-specific.pdf).
   - **(b) Zachowanie lęgowe:** własny klasyfikator głosów żebrzących piskląt, bębnienia i głosów kontaktowych przy dziupli, głosów społecznych nietoperzy.
   - **(c) Lokalizacja:** różnice czasu dotarcia (TDOA) między węzłami wskazują sektor ok. 20–40 m [Szacunek: przy synchronizacji zegarów GPS i rozstawie 100–150 m].
6. **Weryfikacja przez człowieka.** Ornitolog odsłuchuje tylko klipy, które przesądzają o decyzji (ok. 1 h na powierzchnię [Szacunek]). Każdy klip dostaje skrót SHA-256 i kwalifikowany znacznik czasu (element dołączony).
7. **Paszport.** Dokument PDF z jednym z trzech wyników:
   - **ZIELONY:** brak dowodów lęgu gatunków docelowych przy prawdopodobieństwie wykrycia ≥ X%,
   - **ŻÓŁTY:** zajęte terytorium bez potwierdzenia lęgu, zalecane przesunięcie po 15 lipca,
   - **CZERWONY:** lęg potwierdzony, zostawić wskazane drzewa z buforem.
   Paszport zawiera mapę sektorów i linki do odsłuchu.
8. **Działanie.** Przed wejściem maszyn operator harwestera odsłuchuje w kabinie syntezowany brief, np. „W oddziale 214b, ok. 40 m na północny wschód od drogi, drzewo z aktywną dziuplą dzięcioła czarnego. Zostaw je z buforem 20 m”. Leśniczy po oznaczeniu drzewa mówi „potwierdzam, oznaczone farbą”. Rozpoznana wypowiedź wraca do paszportu jako zapis wykonania.

### 4.4. Co czyni to rozwiązanie nieoczywistym (także: co daje połączenie rdzenia z dołączonymi elementami)

- **Zmienia się klient.** W bioakustyce płaci zwykle ten, kto chce przyrodę badać. Tu płaci ten, kto ma ją wyciąć i potrzebuje zgody, spokoju i dowodu. Ochrona gniazd przestaje być kosztem narzuconym z zewnątrz, a staje się ubezpieczeniem decyzji.
- **Zmienia się skala.** Nie monitorujemy tysięcy hektarów latami. Wykonujemy krótkie badanie jednej powierzchni tuż przed decyzją, dlatego sprzęt jest tani, nie potrzeba łączności, a jeden zestaw obsłuży kilkanaście powierzchni w sezonie.
- **Las „mówi”.** Dzięki stymulacji głosowej system nie czeka biernie, aż ptak się odezwie. Prowokuje gatunki skryte do odpowiedzi, co zamienia słabą stronę bioakustyki (cisza ≠ brak) w mierzalne prawdopodobieństwo wykrycia. Bez tego elementu paszport byłby łatwy do podważenia.
- **Pętla jest domknięta głosem.** Wykrycie kończy się w kabinie harwestera i wraca jako głosowe potwierdzenie. Nic nie zostaje w raporcie, którego nikt nie czyta.
- **Dowód jest audytowalny.** Skrót i znacznik czasu sprawiają, że ta sama ścieżka audio jest jednocześnie wynikiem modelu i dowodem dla strony przeciwnej w sporze. Połączenie trzech elementów daje produkt, który ani bioakustyk, ani prawnik, ani firma IT nie zbudowaliby osobno.

### 4.5. Model biznesowy i wycena (za co i ile płaci klient)

- **Opłata za paszport:** 950 zł netto za powierzchnię do 5 ha (6 dób nasłuchu, stymulacja, weryfikacja ornitologa, paszport, brief głosowy). Powierzchnia powyżej 5 ha kosztuje 950 zł + 150 zł za każdy kolejny hektar. To ok. 40% kosztu ręcznej kontroli (ok. 2 400 zł [Szacunek, 4.2]).
- **Pakiet sezonowy dla nadleśnictwa:** 40 paszportów, wypożyczenie 12 węzłów, szkolenie podleśniczych, za 36 000 zł netto. Kwota jest poniżej progu stosowania Prawa zamówień publicznych, który od 2026 r. wynosi 170 000 zł netto [Źródło](https://www.prawo.pl/biznes/pzp-170000-zl-prog-przetargi,535939.html), więc nadleśnictwo może kupić bez przetargu.
- **Skąd 40 powierzchni [Szacunek]:** 40,9 mln m³ / 430 nadleśnictw ≈ 95 tys. m³ na nadleśnictwo rocznie. Około 1/3 przypada na marzec–sierpień, czyli ok. 32 tys. m³. Przy średnio ok. 150 m³ na pozycję cięć daje to ok. 210 pozycji. Około 20% z nich to drzewostany starsze lub Natura 2000, czyli ok. 40 powierzchni wysokiego ryzyka.
- **Ekonomika jednostkowa pakietu [Szacunek]:**
  - sprzęt 12 × 900 zł amortyzowany przez 3 sezony to 3 600 zł,
  - ornitolog 40 h × 120 zł = 4 800 zł,
  - chmura i przechowywanie dowodów ok. 500 zł,
  - logistyka i wsparcie ok. 3 000 zł.
  Łączny koszt to ok. 11 900 zł, więc marża brutto wynosi ok. 67%.
- **Wielkość rynku [Szacunek]:** 430 nadleśnictw × 40 powierzchni × 950 zł ≈ 16 mln zł rocznie w samych Lasach Państwowych. Do tego dochodzą prywatni właściciele lasów i rynki nordyckie. Jako sceptyczny inwestor przyznaję, że polski rynek sam w sobie jest niszowy. Uzasadnieniem dla funduszu jest metodyka przenośna do Szwecji, Finlandii i Estonii, gdzie wycinkę prowadzą firmy prywatne, a orzecznictwo TSUE z lat 2021–2025 bezpośrednio dotyczyło gospodarki leśnej.

### 4.6. MVP: najmniejsza wersja do przetestowania w ciągu 3 miesięcy

Założenie: MVP musi wypaść w sezonie lęgowym, więc obejmuje okres **marzec–maj 2027**. Przygotowanie (grudzień–luty) jest opisane w planie w 4.10.

- **Zakres:**
  - 1 nadleśnictwo partnerskie (zamówienie z wolnej ręki poniżej progu albo bezpłatny pilotaż),
  - 12 powierzchni w drzewostanach powyżej 80 lat,
  - 20 węzłów,
  - 6 gatunków docelowych: puszczyk, włochatka, sóweczka, dzięcioł czarny, dzięcioł średni i jastrząb.
- **Prawda wzorcowa:** niezależny ornitolog wykonuje klasyczną kontrolę (wizyty o świcie i nocą ze stymulacją, przegląd dziupli) na tych samych 12 powierzchniach, bez znajomości wyniku systemu.
- **Produkt minimalny:**
  - nagrania z kart SD, bez łączności,
  - klasyfikator gatunków na progach i klasyfikator głosów żebrzących piskląt dzięciołów (największa luka modelowa),
  - jedno odtwarzanie na noc,
  - paszport PDF generowany półautomatycznie,
  - brief głosowy jako plik audio wysyłany SMS-em lub komunikatorem.
- **Kryterium „idziemy dalej”:**
  - system wykrywa ≥ 80% lęgów potwierdzonych przez ornitologa,
  - ≤ 25% paszportów ŻÓŁTYCH lub CZERWONYCH jest fałszywych,
  - koszt własny ≤ 500 zł na powierzchnię,
  - nadleśniczy deklaruje zakup pakietu na sezon 2028.

### 4.7. Szacunkowe koszty i potrzebne zasoby

**Zespół na 12 miesięcy [Szacunek]:**
- inżynier ML audio,
- inżynier embedded i sprzętu (węzeł z głośnikiem, synchronizacja czasu),
- bioakustyk-ornitolog,
- osoba od sprzedaży i relacji z LP, ze znajomością prawa ochrony przyrody,
- inżynier full-stack na pół etatu.

Łącznie 4,5 etatu × ok. 18 tys. zł kosztu pracodawcy miesięcznie × 12 ≈ **970 tys. zł**.

**Pozostałe koszty [Szacunek]:**

| Pozycja | Koszt |
|---|---|
| Sprzęt: 60 węzłów × 900 zł (rejestrator klasy AudioMoth ok. 80 USD [Źródło](https://groupgets.com/audiomoth), plus głośnik, akumulator, obudowa i moduł GPS do synchronizacji) | ≈ 54 tys. zł |
| Prawda wzorcowa: ornitolog terenowy na 30 dni sezonu × 800 zł | ≈ 24 tys. zł |
| Licencje: komercyjna licencja na model bazowy albo budowa własnego (BirdNET opisano w [Kahl i in. 2021, Ecological Informatics 61](https://doi.org/10.1016/j.ecoinf.2020.101236), a jego udostępniane modele mają licencję niekomercyjną, co trzeba rozwiązać przed sprzedażą) | budżet 40 tys. zł |
| Prawnik: RODO/DPIA, zezwolenie RDOŚ na stymulację, wzór paszportu | ≈ 40 tys. zł |
| Chmura, znaczniki czasu, przechowywanie | ≈ 15 tys. zł |
| Podróże i logistyka | ≈ 40 tys. zł |

**Razem ok. 1,2 mln zł na pierwszy rok.** Finansowanie: runda pre-seed lub grant B+R na komponent ML (lokalizacja, zachowanie lęgowe).

### 4.8. Konkurencja i przewaga

| Konkurent | Co robi | Dlaczego nie robi paszportu |
|---|---|---|
| Ręczna kontrola ornitologiczna / zespoły ochrony przyrody | Wizyty eksperta na powierzchni | Droga (ok. 2 400 zł/pow. [Szacunek]), 1–2 wejścia, brak zapisu audio. Nie jesteśmy dla nich zagrożeniem, tylko narzędziem: ornitolog weryfikuje klipy |
| Wildlife Acoustics (Song Meter, Kaleidoscope) | Sprzęt i oprogramowanie dla badaczy, Song Meter Mini 2 za ok. 499 USD [Źródło](https://wildlifeacoustics.com/products/song-meter-mini-2-aa) | Sprzedaje sprzęt, nie decyzję. Brak stymulacji, paszportu i dowodu prawnego |
| Arbimon / Rainforest Connection | Platforma analizy nagrań, system alarmowy Guardian [Źródło](https://rfcx.org/guardian) | Ukierunkowane na monitoring długoterminowy i nielegalną wycinkę, nie na decyzję przed legalną wycinką |
| BirdNET, Merlin | Darmowa identyfikacja gatunków | To nasz potencjalny komponent, nie produkt dla nadleśnictwa |

**Przewaga:**
1. **Własny zbiór danych o zachowaniu lęgowym.** Każdy paszport z weryfikacją ornitologa zasila oznaczone dane, których nikt inny nie zbiera.
2. **Metodyka uzgodniona z RDOŚ i LP.** Bariera trudna do skopiowania przez firmę sprzętową.
3. **Pozycja dostawcy dowodu.** Kto pierwszy stanie się standardem dowodowym w sporach, ten zostaje.

### 4.9. Ryzyka i sposoby ich ograniczenia (techniczne, biznesowe, prawne, w tym prywatność przy nagrywaniu ludzi w lesie)

**Techniczne:**
- **Pogoda i cisza.** Deszcz i wiatr zaniżają wykrywalność [Źródło](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10776575/).
  - Paszport mierzy szum w każdej nocy i odrzuca noce zaszumione.
  - Wymaga minimum 4 „czystych” nocy.
  - Wynik podaje jako prawdopodobieństwo wykrycia. Przy założeniu 40% szansy wykrycia zajętego terytorium na noc ze stymulacją, 6 nocy daje 1 − 0,6⁶ ≈ 95% [Szacunek].
- **Pomyłki klasyfikatora.** Każda decyzja ŻÓŁTA lub CZERWONA przechodzi przez weryfikację człowieka. Model tylko porządkuje i skraca odsłuch.
- **Zachowanie lęgowe trudne do wykrycia.** Zaczynamy od gatunków o głośnych, charakterystycznych pisklętach (dzięcioły, jastrząb) i rozszerzamy listę dopiero po walidacji.

**Biznesowe:**
- **Nadleśnictwa mogą nie płacić, dopóki prawo nie zmusza.** Ograniczenia:
  - sprzedaż do nadleśnictw, które już miały konflikty społeczne,
  - pakiet poniżej progu Pzp,
  - równoległy kanał do prywatnych właścicieli i nabywców drewna wymagających certyfikacji,
  - wejście na rynek nordycki w 2. roku.
- **Polski rynek jest mały.** Uczciwie przyznajemy, że to biznes rzędu kilku mln zł przychodu w Polsce. Skala musi przyjść z eksportu metodyki.

**Prawne:**
- **Prywatność (RODO).** Mikrofon w lesie nagra pracowników, zbieraczy grzybów i turystów, a głos osoby to dane osobowe.
  - VAD na urządzeniu wykrywa mowę i zeruje te fragmenty przed zapisem na kartę.
  - Węzły nagrywają tylko w oknach świt, zmierzch, noc.
  - Na drogach dojazdowych stoją tabliczki informacyjne.
  - Robimy ocenę skutków dla ochrony danych (DPIA) i przechowujemy wyłącznie klipy z wykryciami zwierząt.
- **Stymulacja gatunków chronionych.** Odtwarzanie może być uznane za umyślne płoszenie.
  - Wnioskujemy o zezwolenie RDOŚ.
  - Stosujemy limit jednego odtwarzania na noc na gatunek i brak odtwarzania w promieniu znanego gniazda po jego wykryciu.
  - Metoda opiera się na praktyce stosowanej już w monitoringu.
- **Wycieki lokalizacji gniazd.** Raport trafia tylko do nadleśnictwa. Współrzędne gniazd gatunków wrażliwych nie trafiają do briefu głosowego (operator słyszy „drzewo oznaczone farbą”, a nie gatunek).
- **Wartość dowodowa.** Ryzyko, że paszport nie zostanie uznany, ograniczamy metodyką opublikowaną i uzgodnioną z RDOŚ oraz ślepą walidacją z MVP.

### 4.10. Plan na pierwsze 12 miesięcy

| Miesiąc | Działania |
|---|---|
| 1–2 (gru 2026 – sty 2027) | Lista gatunków docelowych, zbiór danych treningowych (nagrania publiczne i od współpracujących ornitologów), prototyp węzła z głośnikiem i synchronizacją GPS, rozwiązanie licencji modelu bazowego, DPIA, wniosek do RDOŚ o zezwolenie na stymulację |
| 3 (lut) | List intencyjny z 1 nadleśnictwem, rozstawienie testowe, start nasłuchu sów (sezon sów zaczyna się wcześnie) |
| 4–6 (mar – maj) | **MVP** na 12 powierzchniach ze ślepą walidacją ornitologa (4.6) |
| 7–9 (cze – sie) | Pierwsze płatne pakiety w 3–5 nadleśnictwach (ok. 100 paszportów), brief głosowy w kabinie, głosowe potwierdzenia |
| 10 (wrz) | Raport walidacyjny i publikacja metodyki, prezentacja w regionalnej dyrekcji LP |
| 11–12 (paź – lis) | Sprzedaż pakietów na sezon 2028 (cel: 15 nadleśnictw), pilotaż z prywatnym właścicielem, rozmowy z partnerem w Szwecji, runda seed |

### 4.11. Mierniki sukcesu

- **Skuteczność:** ≥ 80% wykrytych lęgów potwierdzonych przez ornitologa (czułość) i ≤ 25% fałszywych wyników ŻÓŁTYCH lub CZERWONYCH (w MVP).
- **Koszt i czas:** koszt własny ≤ 500 zł na powierzchnię, czas od zebrania kart do paszportu ≤ 48 h.
- **Rynek:** 5 płacących nadleśnictw w 1. sezonie, 15 zakontraktowanych na 2. sezon, ≥ 70% klientów odnawiających zakup.
- **Prawo i reputacja:** zero skutecznie podważonych paszportów oraz uzyskane zezwolenie RDOŚ na stymulację.
- **Przyroda (główny miernik etyczny):** liczba drzew z aktywnymi lęgami zostawionych dzięki paszportom i odsetek wycinek przesuniętych poza okres lęgowy.

### 4.12. Założenia i podstawy liczb

| Twierdzenie lub liczba | Wartość | Typ: Źródło / Analogia / Szacunek | Podstawa, czyli źródło, analogia lub obliczenie |
|---|---|---|---|
| Powierzchnia lasów w zarządzie LP | ok. 7,1 mln ha | Źródło | [Lasy w liczbach, LP](https://lasy.gov.pl/pl/informacje/publikacje/do-poczytania/lasy-panstwowe-w-liczbach-1/lasy-w-liczbach_pl_online.pdf) |
| Liczba nadleśnictw | ok. 430 | Źródło | [Lasy Państwowe w liczbach 2014](https://lasy.gov.pl/pl/informacje/publikacje/do-poczytania/lasy-panstwowe-w-liczbach-1/lasy-panstwowe-w-liczbach-2014), stan na 2013 r., zakładam brak dużych zmian |
| Średnia sprzedaż drewna LP | 40,9 mln m³/rok (2018–2024) | Źródło | [MKiŚ, raport o sytuacji branży leśno-drzewnej](https://www.gov.pl/web/klimat/raport-o-sytuacji-branzy-lesno-drzewnej) |
| Powierzchnie wysokiego ryzyka na nadleśnictwo | ok. 40/sezon | Szacunek | 95 tys. m³ × 1/3 (sezon) / 150 m³ na pozycję × 20% (drzewostany starsze, Natura 2000) |
| Zakazy niszczenia gniazd chronią osobniki, nie tylko populacje | — | Źródło | [TSUE C-473/19 i C-474/19 Skydda Skogen](https://curia.europa.eu/jcms/jcms/p1_4519979/sv) |
| Polskie wyłączenie gospodarki leśnej spod ochrony gatunkowej zakwestionowane | wyrok z 2.03.2023 | Źródło | [RPO o wyroku C-432/21](https://bip.brpo.gov.pl/pl/content/rpo-sejm-wykonac-wyrok-tsue-ustawa-o-lasach-projekt-senacki), [projekt nowelizacji rządu](https://www.gov.pl/web/climate/the-council-of-ministers-has-adopted-a-draft-bill-amending-the-forest-act-and-certain-other-acts) |
| Wyłączenie LP z zakazów w okresie lęgowym od 2017 r. | — | Źródło | [Polsat News, 2017](https://www.polsatnews.pl/wiadomosc/2017-03-06/lesnicy-moga-nadal-ciac-okres-legowy-po-zmianie-prawa-ich-nie-obowiazuje/) |
| Rynki nordyckie: doprecyzowanie ochrony ptaków w okresie lęgowym | 2025 | Źródło | [Naturvårdsverket, analiza wyroku TSUE](https://www.naturvardsverket.se/om-oss/aktuellt/nyheter-och-pressmeddelanden/2025/oktober/analys-av-eu-dom-fortydligat-skydd-av-faglar-under-hackningstid/) |
| Precyzja klasyfikacji ptaków w lesie z AudioMoth | ≥ 0,9 dla 70% z 61 gatunków | Źródło | [Singer i in. 2024](https://www.nw-fva.de/fileadmin/nwfva/publikationen/pdf/singer_2024_aggregated_time-series_features_boost_species-specific.pdf) |
| Zasięg wykrycia głosu zależy od siedliska i pogody | — | Źródło | [Winiarska i in. 2024, Scientific Reports](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10776575/) |
| Efektywny promień wykrycia sowy lub dzięcioła | 75–150 m | Szacunek | Ostrożne założenie na podstawie powyższego badania, do zweryfikowania w MVP |
| Automatyczna stymulacja głosowa jest wykonalna | — | Źródło | [Ausband i in. 2011, USGS](https://pubs.usgs.gov/publication/70003753), [Bayne 2014, ABMI](https://ftp-public.abmi.ca/home/publications/documents/69_Bayne_2014_OwlsReport2012_ABMI.pdf) |
| Prawdopodobieństwo wykrycia po 6 nocach | ≈ 95% | Szacunek | 1 − (1 − 0,4)⁶, przy założonych 40% na noc ze stymulacją |
| Cena rejestratora klasy AudioMoth | ok. 80 USD | Źródło | [GroupGets](https://groupgets.com/audiomoth) |
| Koszt węzła z głośnikiem i zasilaniem | ok. 900 zł | Szacunek / Analogia | Kosztorys Eksperta 4 (600–900 zł) plus moduł GPS |
| Cena konkurencyjnego rejestratora | ok. 499 USD | Źródło | [Wildlife Acoustics Song Meter Mini 2 AA](https://wildlifeacoustics.com/products/song-meter-mini-2-aa) |
| Próg stosowania Pzp | 170 000 zł netto od 2026 r. | Źródło | [prawo.pl](https://www.prawo.pl/biznes/pzp-170000-zl-prog-przetargi,535939.html) |
| Cena paszportu i pakietu | 950 zł; 36 000 zł/40 pow. | Szacunek | ok. 40% kosztu ręcznej kontroli, pakiet poniżej progu Pzp |
| Koszt ręcznej kontroli ornitologicznej | ok. 2 400 zł/pow. | Szacunek | 4 wizyty (2 o świcie, 2 nocne) × ok. 600 zł |
| Marża brutto pakietu | ok. 67% | Szacunek | (36 000 − 11 900) / 36 000, rozbicie kosztów w 4.5 |
| Rynek w LP | ok. 16 mln zł/rok | Szacunek | 430 × 40 × 950 zł |
| Koszt pierwszego roku | ok. 1,2 mln zł | Szacunek | 4,5 etatu × 18 tys. zł × 12 plus sprzęt, walidacja, licencje i prawnik (4.7) |
| Rozpoznawanie mowy po polsku offline | — | Źródło | [OpenAI Whisper](https://github.com/openai/whisper) |
| Detekcja zagrożeń akustycznych w lesie działa w praktyce | — | Analogia | [Rainforest Connection Guardian](https://rfcx.org/guardian): podobna technika, inny cel i klient |
| BirdNET jako model bazowy | — | Źródło | [Kahl i in. 2021, Ecological Informatics 61, 101236](https://doi.org/10.1016/j.ecoinf.2020.101236) |
