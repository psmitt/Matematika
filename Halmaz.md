# A halmazelmélet megalapozása

Halmazok vagy halmazképzés útján, vagy más halmazokkal végzett műveletek révén "keletkeznek".

## A halmazképzéstől a halmaz fogalmáig

A halmazképzés négy megkülönböztetésből áll:

1. Néhány dolgot megkülönböztetünk minden mástól.

   Ennek a megkülönböztetésnek nem a módja a lényeges, hanem az eredménye: ugyanazokat a dolgokat többféleképpen is megkülönböztethetjük a többitől.
   A másoktól egyértelműen megkülönböztetett dolgokat a halmaz _elemeinek_ nevezzük.

   __A halmazelmélet alapelve__ szerint ___minden elem___. Pontosabban bármely egyértelműen azonosítható dolog elemként halmazba foglalható:
   ∀x ∃A ( x∈A )

2. Egy halmaz elemeit nemcsak minden mástól, hanem egymástól is megkülönböztetjük.

   Ez a megkülönböztetés azt jelenti, hogy a halmaz elemei nem azonosak egymással, és minden egyes elem csak önmagával azonos:
   mindegyik a halmaznak ___egyedi___ (egyszeres) eleme, nem tartozhat "többszörösen" ugyanahhoz a halmazhoz.

3. A halmaz elemeit megkülönböztetjük magától a halmaztól is.

4. Magukat a halmazokat az elemeik alapján különböztetjük meg egymástól.  
   Két halmazt azonosnak tekintünk, ha elemeik megegyeznek.

A halmazelméleti egyenlőség mind a halmazok, mind az elemeik tekintetében _azonosságot_ jelent.
Ha egy halmaz egyik eleme megegyezik egy másik halmaznak valamelyik elemével, akkor az a két halmaznak _közös_ eleme.
Ha két halmaznak minden eleme közös, akkor az egy és ugyanaz a halmaz.  
Ezt a szemléletet rögzíti a __meghatározottsági__ vagy __extenzionalitási axióma__:
A = B ≝ ∀x ( x∈A ⇔ x∈B )

Két halmaz csak akkor különbözik, ha legalább az egyiknek van olyan eleme, amelyik nem közös a másikkal.
Ha az egyik halmaznak a másikkal csak közös elemei vannak, akkor az egyik halmaz _része_ a másik halmaznak.
Ha két halmaznak nincs közös eleme, akkor _idegenek_.
Két halmaz közös elemei képezik a két halmaz _közös részét_ vagy _metszetét_.

Elméleti szempontból döntő jelentőségű, hogyan fogjuk fel idegen halmazok metszetét.
Egy lehetséges megközelítés az, hogy mivel idegen halmazoknak nincs közös eleme, ezért közös része sincsen, tehát idegen halmazoknak a metszete _nem létezik_.
Az a felismerés azonban, hogy a metszetképzés _halmazokkal végezhető művelet_, amely halmazokat eredményez, ahhoz a törekvéshez vezet, hogy a metszetképzés műveletét a halmazokon _zárttá_ tegyük, és abban az esetben is halmazként értelmezzük az eredményt, amennyiben a halmazoknak nincsen közös eleme. Ez utóbbi megközelítés szerint idegen halmazoknak közös eleme ugyan nincsen, de közös része van, noha az _üres_. Létezik tehát halmaz elemek nélkül: az üres halmaz.  
Ezt a megállapodást rögzíti az __üres halmaz posztulátuma__:
∃A ∀x ( x∉A )

Az üres halmaz fogalma olyan (mennyiségi) elvonatkoztatás a halmazokat meghatározó elemektől, amely logikailag összeegyeztethető a halmazképzés négy megkülönböztetésével azzal a következtetéssel, hogy – az extenzionalitási axióma alapján – _csak egyetlen üres halmaz létezik_.

Az elemek megkülönböztetésén és azonosságán alapuló általános halmazfogalom tehát a következő elvekre épül:
- a halmazelmélet alapelve;
- az elemek egyediségének elve;
- a halmazok elemeik általi meghatározottságának elve (extenzionalitási axióma);
- valamint az üres halmaz egzisztenciája és unicitása.

## A tiszta halmazelmélet eszméje és alapproblémái

Miután a fenti szemlélet megalapozta a halmazok _mint dolgok_ fogalmát, a halmazelmélet teljes formalizálása végett elvonatkoztathatunk _az elem fogalom dologi tartalmától_.
Ennek első lépése, hogy a halmazok dologiságát halmazelméleti szempontból teljessé tesszük azzal a megállapítással, hogy mivel a halmazok egymástól egyértelműen megkülönböztethetők, ezért maguk is lehetnek elemek: elemei _más_ halmazoknak.

Az üres halmaz léte garantálja, hogy legalább egy halmaz tőle különnemű elemek nélkül is létezik, az üres halmazt elemként felfogva pedig további halmazokat képezhetünk további különnemű elemek nélkül. Teljesen eltekinthetünk tehát az elemektől _mint halmazoktól különböző dolgoktól_, és ezzel a (minőségi) elvonatkoztatással megalapozhatjuk a tiszta halmazelméletet, amelyben minden dolog halmaz és más halmazoknak az eleme is egyben.  
Ez __a tiszta halmazelmélet elve__: ___minden halmaz___.
Pontosabban: a halmazok elemei is halmazok. Olyan (általában osztály alapú) axiómarendszerekben, amelyek külön 'halmaz' predikátummal rendelkeznek, a tiszta halmazelmélet elve mint __elemaxióma__ formalizálható: ∀x ∀A ( x∈A ⇒ x halmaz )

A tiszta halmazelmélet elve _egyneműsíti_ a halmazokat és az elemeket, ezáltal megszünteti a lényegi különbséget a halmazok és elemeik között. Egyszerre szünteti meg az elem fogalom dologiságát és a halmaz definiálható fogalmát. A halmaz fogalma _alapfogalommá_, az elem fogalma pedig a halmazok közötti _relációvá_ változik. A halmazképzés négy eredeti megkülönböztetése részint összemosódik, részint problematikussá válik. _Az elemek megkülönböztetése egymástól a halmazok egymástól való megkülönböztetésévé lesz, amelyeket viszont éppen az elemeik alapján kellene megkülönböztetnünk._ Ördögi kör!

Ez tehát a tiszta halmazelmélet alapdilemmája:
- Hogyan tehetünk különbséget a halmaz és vele egynemű elemei között?
- Létezhet-e egy halmaz anélkül, hogy az elemeit _tőle függetlenül_ meghatároztuk volna, avagy meghatározhatjuk-e egy halmaz elemeit a halmaz _saját meghatározása által_?

Mi történik, ha a halmazképzési eljárás csődöt mond? Kiutat jelenthetnek-e a halmazműveletek? Ahhoz, hogy egy halmazt más halmazokkal végzett műveletek útján előállítsunk, a műveletek tagjainak már rendelkezésre kell állniuk. Ámde hogyan állítsuk elő azokat a halmazokat, amelyeken majd a műveleteket elvégezhetjük?

Mondhatjuk, hogy az üres halmaz mint kezdőelem már a rendelkezésünkre áll. Csakhogy az üres halmaz puszta absztrakció: csak azért vezettük be, hogy idegen halmazok metszetét is halmazként értelmezhessük. Ha nincsenek idegen halmazok, nincs szükség az üres halmaz bevezetésére sem. Minthogy azonban az elemek nélküli halmaz az egyetlen, amely megtörheti a megkülönböztetési probléma ördögi körét, így az üres halmaz már nemcsak mint formális műveleti eredmény, hanem mint _végső alapelem_ nyer létjogosultságot.

Úgy tűnik tehát, hogy a halmazfogalom alapvető elvei a tiszta halmazelméletben is megőrizhetők. Kérdés azonban, hogy létezik-e a tiszta halmazelméletben a halmazképzésnek más módja is, mint halmazoknak más halmazokon végzett műveletek révén történő előállítása. Egyáltalán és mindenekelőtt: miféle műveletekkel állíthatunk elő adott halmazokból más halmazokat?

## Halmazműveletek

Az alábbiakban olyan eljárásokat ismertetünk, amelyek lehetővé teszik, hogy az üres halmazból mint alapelemből tetszőleges méretű és szerkezetű halmazokat állítsunk elő.

### Elemek felsorolása

Az elemek egyenkénti megjelölése egy halmaz meghatározásának a legegyszerűbb módja. Ezzel a módszerrel az elemek között fennálló bármely összefüggéstől elvonatkoztathatunk. Bonyolultabb lenne más módon elállítani azt a halmazt, amelynek elemei az Esthajnalcsillag, az ibolyaillat és a differenciálhányados.

A tiszta halmazelméletben csak más, már definiált halmazok felsorolásával állíthatunk elő újabb halmazokat. Ehhez a módszerhez kezdetben csak egyetlen halmaz áll a rendelkezésünkre: az üres halmaz. Az üres halmaz "felsorolásával" hozhatjuk létre azt a halmazt, melynek egyetlen eleme maga az üres halmaz. Ezt az eljárást rendre az eredményen megismételve tetszőlegesen sok egymástól különböző egyelemű halmazt hozhatunk létre. Ezekből aztán egyszerre többet is felsorolva tetszőlegesen sok véges elemszámú halmazt állíthatunk elő.

A halmazelmélet alapelve nem garantálja többelemű halmazok létezését. Annyit garantál csupán, hogy az üres halmaz mellett legalább még egy halmaz létezik. Azt, hogy akár két elemet is fel tudjunk venni egy halmazba a __páraxióma__ biztosítja: ∀x ∀y ∃A ∀z ( z∈A ⇔ z=x ∨ z=y )

A páraxióma által biztosított _rendezetlen pár_ szokásos jelölése:
{ x, y }

A páraxióma nem zárja ki (de természetesen nem is követeli meg) a halmazba foglalható két elem azonosságát. Magába foglalja tehát, de egyben ki is terjeszti a halmazelmélet alapelvét. Általánosabb érvényű elvként lép be a halmazelmélet axiómáinak sorába: belőle a halmazelmélet alapelve levezethetővé válik.

A páraxióma önmagában nem elegendő ahhoz, hogy a felsorolás műveleti lehetőségeit kimerítsük. Ahhoz, hogy tetszőleges véges elemszámú halmazokat állíthassunk elő felsorolással, elvileg a páraxiómához hasonló szerkezetű végtelen számú posztulátummal kellene az elméletet bővíteni - ehelyett azonban az is elég, ha bevezetjük két halmaz elemeinek egybefoglalását, azaz két halmaz egyesítését.

### Elemek egyesítése

Különböző halmazok elemeinek egyetlen halmazba foglalását a halmazok _egyesítésének_ vagy _uniójának_ nevezzük. Az egyesített halmazok mindegyike _része_ az egyesítési halmaznak, és az egyesítési halmaznak nincs olyan eleme, amelyik ne volna _közös_ valamelyik egyesített halmazzal.

Az egyesítési halmaz létezését természetesen axiómával kell biztosítani. A formalizáláshoz azonban nem alkalmazhatjuk a halmazalgebrák műveleteinek bevezetésekor használt A∪B jelölést, mert nem csak véges számú, hanem tetszőlegesen sok halmaz uniójának a létezését szeretnénk garantálni. Az __egyesítési axióma__ ezért nem halmazokra, hanem ___elemekre___ van kimondva: _bármely halmaz elemei egyesíthetők_.
∀A ∃B ∀x ( x∈B ⇔ ∀y ( y∈A ∧ x∈y ) )

Egy A halmaz elemeinek egyesítési halmazát így jelöljük: ⋃A

Ahhoz tehát, hogy halmazokat egyesíthessünk, mindenekelőtt egyetlen halmazba kell foglalnunk őket _mint elemeket_. Szerencsére a páraxióma lehetővé teszi, hogy két halmazt egyesítsünk:
A∪B ≝ ⋃ { A, B }

A páraxióma és két halmaz egyesítése révén immár megvalósítható tetszőleges véges elemszámú halmazok előállítása az elemek felsorolásával.

### Halmazrészek, részhalmazok

Definíció szerint adott halmazok metszete: a halmazok közös elemeinek a halmaza, vagyis a halmazok közös része.
Láttuk, hogy az üres halmaz bevezetését (többek között) az is indokolja, hogy általa a metszetképzést a halmazokon értelmezett _zárt_ műveletté tehetjük, tehát halmazok közös részét akkor is halmaznak tekinthetjük, ha a halmazoknak közös eleme nincs.

De vajon miért tekinthetjük halmaznak a metszetet egyáltalában? Minek az alapján gondoljuk azt, hogy halmazok közös része szintén halmaz? A gondolat a halmazképzés első megkülönböztetésére támaszkodik, amely szerint másoktól egyértelműen megkülönböztetett dolgokat egy halmaz elemeinek nevezhetünk. A megkülönböztetésnek azt a módját pedig, amely már meghatározott (jól definiált) halmazok _közös_ elemeit különíti el minden mástól, jogosan nevezhetjük egyértelműnek.

Az axiomatikus halmazelmélet ennél általánosabb elvet rögzít, amely szerint nem csak halmazok közös része, hanem egy adott halmaz _bármely_ része halmaz: tehát egy halmaz tetszőlegesen, de egyértelműen megkülönböztetett elemei szintén halmazt alkotnak.
Ezt az elvet rögzíti az __elkülönítési__ vagy __részhalmaz-axiómaséma__: ∀A ∀𝜑 ∃B ∀x ( x∈B ⇔ x∈A ∧ 𝜑(x) )

Az axiómaséma által garantált egyedi halmaz definitív leírásához használjuk a megszokott B = { x∈A | 𝜑(x) } jelölést.

Olyan (általában osztály alapú) axiómarendszerekben, amelyek külön 'halmaz' predikátummal rendelkeznek, az axiómaséma helyett az egyszerűbb __részhalmaz-axióma__ rögzítése is elegendő: ∀x ∀A ( x⊆A ⇒ x halmaz )

Tekintettel arra, hogy egy halmaz részei maguk is halmazok, a részek összességét is célszerű halmaznak tekinteni. Bár az _elemhalmaz_ (értsd: elemek halmaza), _számhalmaz_  (értsd: számok halmaza), _ponthalmaz_ (értsd: pontok halmaza) szóösszetételek mintájára következetes volna egy halmaz részeinek összességét _részhalmaz_-nak (értsd: részek halmaza) nevezni, azonban ez utóbbi fogalmat magukra a halmazrészekre alkalmazzuk. Egy halmaz részeinek halmazára a _hatványhalmaz_ megnevezést használjuk, és létezését a __hatványhalmaz-axióma__ biztosítja:
∀A ∃B ∀x ( x∈B ⇔ x⊆A )

## Az univerzum megmentése


- Megalkotjuk a halmazokat, vagy csak elkülönítünk bennük más halmazokat?
- Létrejönnek a halmazok, vagy egyszer s mindenkorra adottak?


- Melyek az _eleme_ reláció jellemzői?
- Lehet-e egy halmaz önmagának az eleme?
- Lehet-e két halmaz kölcsönösen eleme egymásnak?

- Kumulatív hierarchia: halmazok halmozása

- Osztályok, mint szuperhalmazok ("más típusú" halmazok)
- Osztályok, mint méretkorlátozott halmazokat
- Osztályok, mint potenciális halmazok (halmazok a megkonstruált osztályok)
- Osztályok, mint fogalmak terjedelmei

- halmazok mélyszerkezete
- halmazok felszíni szerkezete: elemek közötti relációk
