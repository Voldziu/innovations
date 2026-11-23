> Model: Claude Opus 5.5 (claude-opus-5-5) · Data: 2026-11-23

# Stetoskop Leśny

## 1. Pięć kierunków

Pierwszy pomysł, który przyszedł mi do głowy, był oczywisty i go odrzuciłem: akustyczny monitoring bioróżnorodności ptaków (takie narzędzia jak BirdNET już działają) oraz wykrywanie pił łańcuchowych w lesie (to robi Rainforest Connection).

1. **Kornik drukarz w żywych świerkach.** Kontaktowy czujnik przykładany do pnia słucha żerowania chrząszczy i larw pod korą. Używa go leśniczy w drzewostanach świerkowych w Beskidach i Sudetach. Klientem są nadleśnictwa.
2. **Stres suszy młodych drzew miejskich.** Czujnik ultradźwiękowy przy pniu wychwytuje emisje kawitacyjne, które pojawiają się w przewodzących wodę tkankach drzewa przy niedoborze wody. Klientem są miejskie zarządy zieleni, którym usychają świeżo posadzone drzewa.
3. **Akustyczny indeks życia glebowego.** Sondy wbijane w glebę nagrywają dźwięki fauny glebowej, czyli ruch i żerowanie dżdżownic oraz stawonogów. Klientem są gospodarstwa rolnictwa regeneracyjnego i weryfikatorzy praktyk rolno-środowiskowych.
4. **Przywabianie ptaków kolonijnych (generowanie dźwięku).** Głośniki na nowo usypanych, bezpiecznych wyspach lęgowych odtwarzają wygenerowany, zmienny pejzaż dźwiękowy kolonii rybitw, a mikrofony sprawdzają, czy ptaki się osiedlają. Klientem są zarządcy zbiorników, RDOŚ i organizacje ochrony przyrody.
5. **Nielegalne zrzuty do rzek.** Hydrofony przy wylotach kanałów i rowów wykrywają nocną pracę pomp i nagły przepływ, które nie zgadzają się z pozwoleniem wodnoprawnym. Klientem są Wody Polskie i inspekcja ochrony środowiska.

## 2. Wybór

| Kierunek | Nieoczywistość | Pilotaż w rok | Ktoś zapłaci | Dźwięk daje coś, czego nie da kamera ani człowiek | Kto już to robi |
|---|---|---|---|---|---|
| 1. Kornik | 4 | 4 | 4 | Tak: żerowanie pod korą słychać, zanim pojawią się widoczne objawy, a trociny zmywa deszcz | Badania nad akustyką korników i kózkowatych (m.in. grupa R. Hofstettera z Northern Arizona University, prace USDA nad larwami w drewnie). Gotowego produktu dla kornika drukarza nie znam, trzeba to sprawdzić. Dla ryjkowca palmowego istnieje produkt Agrint IoTree |
| 2. Susza drzew | 5 | 2 | 3 | Częściowo: czujniki wilgotności gleby dają podobną informację taniej | Badania: Khait i in., Cell 2023 (dźwięki roślin w stresie); emisje kawitacyjne są znane w fizjologii roślin od dziesięcioleci. Produktu nie znam |
| 3. Gleba | 5 | 3 | 2 | Tak: tego życia nie widać bez rozkopywania gleby | Projekt Sounding Soil (Szwajcaria) i prace badawcze. Produktu nie znam |
| 4. Ptaki kolonijne | 3 | 3 | 2 | Tak: dźwięk przywabia ptaki, czego kamera nie zrobi | Przywabianie odtwarzaniem głosów jest stosowane od dawna (Project Puffin, S. Kress). Generowanie zmiennych nagrań przez AI to mały wkład |
| 5. Zrzuty | 4 | 3 | 3 | Częściowo: czujniki chemiczne mierzą samo zanieczyszczenie, dźwięk pokazuje tylko, kiedy był zrzut | Nie wiem |

**Wybór: kierunek 1.** Kornik drukarz to w Polsce problem na dużą skalę, a nadleśnictwa mają już budżet i obowiązek kontrolowania zasiedlonych drzew, więc wiadomo, kto decyduje i z czego płaci. Nagranie dźwięku z pnia telefonem z tanim czujnikiem kontaktowym da się zbudować małym zespołem w kilka miesięcy, a ten sezon rójki pozwala zrobić pilotaż w 2027 roku. Według mojej wiedzy nikt nie sprzedaje takiego narzędzia dla kornika drukarza, więc nie przenosimy do Polski cudzego produktu (to trzeba potwierdzić w pierwszym miesiącu).

## 3. Problem i klient

Kornik drukarz zasiedla świerki osłabione suszą. Nowe pokolenie wylatuje po kilku tygodniach [szacunek: 6–10 tygodni zależnie od temperatury] i atakuje drzewa sąsiednie. Jeśli drzewo usunie się albo okoruje przed wylotem, ognisko przestaje się rozszerzać. Dziś zasiedlone drzewa szuka się wzrokowo: po trocinach, wyciekach żywicy i otworach wejściowych. Na wczesnym etapie, kiedy korona jest jeszcze zielona, łatwo te objawy przeoczyć, zwłaszcza po deszczu.

**Klient:** nadleśnictwa Lasów Państwowych z dużym udziałem świerka, na start Beskidy, Sudety i północny wschód. O zakupie decyduje nadleśniczy, a rekomendację przygotowuje specjalista do spraw ochrony lasu. Na poziomie RDLP ma wpływ wydział ochrony lasu. Ważnym partnerem merytorycznym jest Instytut Badawczy Leśnictwa, który zajmuje się prognozowaniem zagrożeń. Później dochodzą prywatni właściciele lasów i rynki czeski, słowacki i niemiecki.

## 4. Efekt dla przyrody

Produkt ogranicza **rozprzestrzenianie się ognisk kornika**, a przez to zamieranie kolejnych świerków i powstawanie dużych powierzchni wylesionych po cięciach sanitarnych. Przy wczesnym wykryciu wystarcza wyciąć pojedyncze drzewa zamiast całych płatów.

Miary w pilotażu (oddziały z urządzeniem kontra oddziały kontrolne o podobnym drzewostanie):
- odsetek zasiedlonych drzew wykrytych przed wylotem nowego pokolenia, sprawdzony przez okorowanie próby drzew przeznaczonych już do usunięcia (to miara główna),
- liczba nowo zasiedlonych drzew w promieniu [szacunek: 50 m] od ognisk z poprzedniego pokolenia,
- liczba drzew usuniętych na jedno ognisko.

Uczciwie: jeden sezon może nie wystarczyć, żeby wykazać różnicę w rozprzestrzenianiu się ognisk. Pewnym wynikiem jednego sezonu będzie tylko miara główna.

## 5. Jak to działa

- **Nagranie:** piezoelektryczny czujnik kontaktowy z przedwzmacniaczem, podłączony do smartfona przez USB-C [szacunek: koszt części 150–300 zł]. Leśniczy przykłada go do pnia na wysokości 1–2 m na 60–90 sekund. Do tego krótkie nagranie tła z powietrza, które pomaga odfiltrować wiatr i deszcz.
- **Model:** mały klasyfikator działający w telefonie, bez zasięgu. Wejściem jest spektrogram, a model odróżnia impulsy żerowania w łyku od stukania dzięcioła, trzasków od wiatru, kroków i dotyku dłoni. Wynik to prawdopodobieństwo zasiedlenia i ocena jakości nagrania. Nie wiem, czy da się odróżnić kornika drukarza od współwystępującego rytownika pospolitego. Na początek zakładamy klasę „żerowanie pod korą” bez rozróżniania gatunków.
- **Realna skuteczność:** nie znam terenowych wyników dla tego gatunku. Próg sukcesu prototypu ustawiam na czułość co najmniej 70% przy swoistości co najmniej 85% [szacunek].
- **Użytkownik dostaje:** kolor drzewa na mapie (zasiedlone, czyste albo „powtórz pomiar”), współrzędne GPS i listę drzew do usunięcia, którą da się wyeksportować do systemu nadleśnictwa.

## 6. Co już istnieje

- **Badania akustyki korników i larw w drewnie** (USA, USDA, Northern Arizona University): pokazują, że sygnał istnieje, ale robiono je głównie w laboratorium i na innych gatunkach. Produktem nie zostały, bo w USA i w Polsce nie było kupca z gotowym procesem i budżetem. Tak przynajmniej oceniam, nie mam tego potwierdzonego.
- **Agrint IoTree:** stałe czujniki na palmach przeciw ryjkowcowi palmowemu. To inny gatunek i inny model biznesowy, bo czujnik zostaje na drzewie na stałe. W lesie świerkowym czujnik na każdym drzewie byłby za drogi.
- **Pułapki feromonowe, teledetekcja, psy wyszkolone do wykrywania kornika:** pułapki mierzą tylko liczebność populacji. Satelity i drony widzą drzewo dopiero wtedy, gdy korona zmienia kolor, czyli często po wylocie nowego pokolenia. Psy są skuteczne, ale ich tu nie skalujemy.

**Co robimy inaczej:** budujemy tanie narzędzie ręczne, które wpasowuje się w obchody kontrolne, które leśniczy i tak wykonuje. Model trenujemy na danych z polskich drzewostanów, a etykiety bierzemy z okorowania, nie z oceny wzrokowej. Zdjęcia satelitarne mogą być dodatkiem, który wskazuje, gdzie iść, ale nie są rdzeniem produktu.

## 7. Scenariusz użycia

1. W maju kornik zasiedla świerk na skraju zeszłorocznego ogniska. Korona jest zielona, a trociny zmył deszcz.
2. Aplikacja wyznacza leśniczemu trasę obchodu wzdłuż skrajów znanych ognisk.
3. Przy każdym świerku w pasie kontrolnym leśniczy przykłada czujnik. Po około 90 sekundach aplikacja pokazuje wynik albo prosi o powtórzenie pomiaru, jeśli wieje za mocno.
4. Drzewo z wysokim prawdopodobieństwem zasiedlenia jest oznaczane na mapie. Leśniczy może je sprawdzić, zdejmując mały fragment kory.
5. Na koniec dnia lista drzew trafia do specjalisty do spraw ochrony lasu.
6. Specjalista zleca usunięcie albo okorowanie drzew przed wylotem nowego pokolenia, a nadleśniczy zatwierdza zlecenie dla zakładu usług leśnych.
7. Po 3–4 tygodniach leśniczy sprawdza ponownie pas wokół ogniska.

## 8. Plan realizacji

| Krok | Czas | Warunek przejścia | Jeśli nie jest spełniony |
|---|---|---|---|
| Rozmowy z 15 nadleśnictwami i IBL, przegląd literatury i patentów | XII 2026 – I 2027 | Co najmniej 3 nadleśnictwa dają dostęp do drzewostanów i deklarują chęć zapłaty. Nie znaleźliśmy gotowego produktu | Przechodzimy do kierunku 5 lub 2 |
| Zbiór danych: kłody z zimujących, zasiedlonych drzew i drzewa zdrowe, etykiety z okorowania | II – IV 2027 | Model na odłożonych drzewach osiąga AUC co najmniej 0,85 [szacunek] | Dłuższe nagrania albo stałe czujniki na drzewach pułapkowych. Jeśli to nie pomoże, zamykamy kierunek |
| Prototyp: 20 zestawów i aplikacja | IV – V 2027 | Pomiar zajmuje do 2 minut na drzewo, a test w terenie spełnia progi z sekcji 5 | Poprawiamy mocowanie czujnika i filtrowanie tła. Pilotaż przesuwamy na drugie pokolenie kornika (lipiec) |
| Pilotaż w 2–3 nadleśnictwach | V – IX 2027 | Wykrywamy przed wylotem istotnie więcej drzew niż w oddziałach kontrolnych, a nadleśnictwo chce przedłużyć współpracę | Analizujemy, gdzie model zawodzi. Pozycjonujemy produkt jako narzędzie do weryfikacji, a nie do wyszukiwania drzew |
| Skalowanie: 10–20 nadleśnictw, zamówienia publiczne, Czechy i Słowacja | 2028 | Koszt na hektar niższy niż wartość uratowanego drewna | Zostajemy przy usłudze w modelu „pomiar jako usługa” |

## 9. Model przychodu

- **Kto płaci:** nadleśnictwo, a później prywatni właściciele lasów i zarządcy lasów za granicą.
- **Za co:** roczna subskrypcja za aplikację, model, mapy i raporty z kontroli, liczona od liczby leśnictw albo hektarów drzewostanów świerkowych. Do tego zestawy czujników sprzedawane albo wliczone w abonament.
- **Forma:** na początek zamówienia poniżej progu stosowania ustawy Prawo zamówień publicznych (130 000 zł netto), co skraca sprzedaż. Pilotaż jest płatny symbolicznie [szacunek: 5–15 tys. zł]. Druga ścieżka to usługa: nasz zespół albo zakład usług leśnych wykonuje pomiary i fakturuje za przebadane drzewa.

## 10. Ryzyka i jak je tanio sprawdzić

1. **W terenie nie da się wiarygodnie wychwycić sygnału, bo zagłusza go wiatr, deszcz albo gruba kora.** Test: czujnik za 200 zł i laptop, 30 nagranych kłód i 10 stojących drzew. Spektrogramy ocenia na ślepo człowiek, a wynik porównujemy z okorowaniem. Jeśli człowiek nie widzi różnicy na spektrogramie, model raczej też jej nie zobaczy.
2. **Narzędzie nie daje przewagi nad okiem leśniczego.** Test: jeden dzień obchodu z leśniczym. Zapisujemy jego decyzje dla 50 drzew i porównujemy z okorowaniem. Jeśli ocena wzrokowa jest trafna w ponad 90% [szacunek] przypadków, produkt nie ma sensu.
3. **Nadleśnictwo nie kupi albo nie zmieni procedury.** Test: makieta aplikacji, cennik i prośba o list intencyjny albo płatny pilotaż. Brak choćby jednego zobowiązania po 15 rozmowach oznacza, że trzeba zmienić kierunek.

---

Przed wklejeniem do dokumentu sprawdźcie twierdzenie, że nikt nie sprzedaje narzędzia akustycznego dla kornika drukarza. Opieram je na swojej wiedzy, nie na przeglądzie rynku. Liczby oznaczone [szacunek] są moje i nie mają źródła.
