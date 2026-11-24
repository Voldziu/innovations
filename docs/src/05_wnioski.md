# 5. Wnioski z porównania

Każda z siedmiu osób użyła innego promptu: od prośby o ocenę planu po panel ekspertów i workflow wieloagentowy (sześć odpowiedzi od Claude, jedna od Gemini). Mimo to modele w większości doszły do podobnych wniosków, które wyraźnie zmieniają nasz plan.

## 5.1. Co modele dodały

- **Konkretnego płatnika.** Zamiast ogólnego „finansowania przez Lasy Państwowe i granty”: parki narodowe i pojedyncze nadleśnictwa kupujące poniżej progu zamówień publicznych, firmy wykonujące oceny oddziaływania na środowisko, a w wariancie Bartosza zarządca lasu, który przed wycinką w sezonie lęgowym musi wykazać, że nie niszczy gniazd („paszport zrębu”).
- **Gotowe narzędzia.** Zamiast własnego czujnika i modelu od zera: rejestratory AudioMoth i dostrajanie istniejących modeli (BirdNET, Perch), z uwagą, że BirdNET ma licencję niekomercyjną.
- **Konkurencję**, której nie analizowaliśmy, m.in. Rainforest Connection z projektem w Białowieskim Parku Narodowym.
- **Mierzalne cele i kryteria porzucenia**, np. precyzja dla gatunku i liczba płatnych pilotaży.

## 5.2. Czego nie zauważyliśmy

- **Alarm o wycince ma słabe uzasadnienie.** W lesie gospodarczym piły pracują legalnie codziennie, więc fałszywych alarmów będzie dużo, a udokumentowane straty z kradzieży drewna są niewielkie.
- **Wykrywanie pożarów prawdopodobnie nie ma sensu.** LP mają ponad 700 dostrzegalni i kamery dymu, a ogień słychać dopiero blisko czujnika.
- **RODO trzeba rozwiązać na starcie:** filtr mowy na urządzeniu przed pierwszym nagraniem, nie przy wdrożeniu.
- **Model traci skuteczność w nowym lesie:** w przytoczonym badaniu precyzja detektora strzałów spadła z 0,85 do 0,57.

## 5.3. Gdzie trzeba uważać

Modele nie zgodziły się co do punktu wejścia: większość wybrała monitoring bioróżnorodności, a panel ekspertów z promptu Bartosza odrzucił go jako „oczywistość bez płatnika”. Liczby finansowe (potrzebne finansowanie od 0,8 do 3,4 mln zł, ceny, próg rentowności) to głównie szacunki modeli. Źródła traktujemy jako punkt wyjścia do weryfikacji, nie jako fakty.

## 5.4. Co przyjmujemy

1. Zaczynamy od monitoringu ptaków i sów dla parków narodowych i nadleśnictw, na gotowych rejestratorach i dostrojonych otwartych modelach.
2. Wywiady pytają o konkretną decyzję i budżet, a ich celem są deklaracje płatnego pilotażu.
3. Filtr mowy i walidację z ornitologiem przenosimy na początek.
4. Wykrywanie pił, pojazdów i strzałów dokładamy po pilotażu, tylko na obszarach chronionych. Rezygnujemy z wykrywania pożarów.

Najwięcej modele wniosły nie w samym pomyśle, tylko w pytaniu „kto za to zapłaci i dlaczego”. Dopiero porównanie kilku odpowiedzi pokazało, które wnioski są mocne, a które zależą od sformułowania promptu.
