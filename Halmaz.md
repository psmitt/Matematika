# A halmazelmélet alapjai

## Tartalom

  - #### A halmazképzéstől a halmaz fogalmáig
  - #### A tiszta halmazelmélet eszméje és alapproblémája
  - #### Halmazműveletek
    - __Elemek felsorolása__
    - __Elemek egyesítése__
    - __Halmazrészek, részhalmazok__
    - __Halmazok leképezése__
  - #### Halmazok halmozása
    - __Végtelenek sokasága__
    - __A formalizmus kísértése__
    - __Antinómia és paradoxon__
  - #### Az univerzum megmentése
    - __A logicista megoldás__
    - __A formalista megoldás__
    - __Az ontológiai megoldás__

## A halmazképzéstől a halmaz fogalmáig

Halmazok vagy halmazképzés útján, vagy más halmazokkal végzett műveletek révén "keletkeznek".

A halmazképzés négy megkülönböztetésből áll:

1. Néhány dolgot megkülönböztetünk minden mástól.

   Ennek a megkülönböztetésnek nem a módja a lényeges, hanem az eredménye: ugyanazokat a dolgokat többféleképpen is megkülönböztethetjük a többitől.
   A másoktól egyértelműen megkülönböztetett dolgokat a halmaz _elemeinek_ nevezzük.

   __A halmazelmélet alapelve__ szerint ___minden elem___. Pontosabban, bármely egyértelműen azonosítható dolog elemként halmazba foglalható:
   ∀x ∃A ( x∈A )

2. Egy halmaz elemeit nemcsak minden mástól, hanem egymástól is megkülönböztetjük.

   Ez a megkülönböztetés azt jelenti, hogy a halmaz elemei nem azonosak egymással, minden egyes elem csak önmagával azonos:
   mindegyik a halmaznak ___egyedi___ (egyszeres) eleme, nem tartozhat "többszörösen" ugyanahhoz a halmazhoz.

3. A halmaz elemeit megkülönböztetjük magától a halmaztól is.

4. Magukat a halmazokat az elemeik alapján különböztetjük meg egymástól.  
   Két halmazt azonosnak tekintünk, ha elemeik megegyeznek.

A halmazelméleti egyenlőség mind a halmazok, mind az elemeik tekintetében _azonosságot_ jelent.
Ha egy halmaz egyik eleme megegyezik egy másik halmaznak valamelyik elemével, akkor az a két halmaznak _közös_ eleme.
Ha két halmaznak minden eleme közös, akkor az _egy és ugyanaz_ a halmaz.  
Ezt a szemléletet rögzíti a __meghatározottsági__ vagy __extenzionalitási axióma__:
∀A ∀B ( A = B ⟺ ∀x ( x∈A ⇔ x∈B ) )

Két halmaz csak akkor különbözik, ha legalább az egyiknek van olyan eleme, amelyik nem közös a másikkal.
Ha az egyik halmaznak a másikkal csak közös elemei vannak, akkor az egyik halmaz _része_ a másik halmaznak.
Ha két halmaznak nincs közös eleme, akkor _idegenek_.
Két halmaz közös elemei képezik a két halmaz _közös részét_ vagy _metszetét_.

Elméleti szempontból döntő jelentőségű, hogyan fogjuk fel idegen halmazok metszetét.
Egy lehetséges megközelítés az, hogy mivel idegen halmazoknak nincs közös eleme, ezért közös része sincsen, tehát idegen halmazoknak a metszete _nem létezik_.
Az a felismerés azonban, hogy a metszetképzés _halmazokkal végezhető művelet_, amely halmazokat eredményez, ahhoz a törekvéshez vezet, hogy a metszetképzés műveletét a halmazokon _zárttá_ tegyük, és abban az esetben is halmazként értelmezzük az eredményt, amennyiben a halmazoknak nincsen közös eleme. Ez utóbbi megközelítés szerint idegen halmazoknak közös eleme ugyan nincsen, de közös része van, noha az _üres_. Létezik tehát halmaz elemek nélkül: az üres halmaz.  
Ezt a megállapodást rögzíti az __üres halmaz posztulátuma__:
∃A ∀x ( x∉A )

Az üres halmaz fogalma olyan (mennyiségi) elvonatkoztatás a halmazokat meghatározó elemektől, amely logikailag összeegyeztethető a halmazképzés négy megkülönböztetésével azzal a következtetéssel, hogy – az extenzionalitási axióma alapján – _csak egyetlen üres halmaz létezik_. Az üres halmaz jele: ∅

Az elemek megkülönböztetésén és azonosságán alapuló általános halmazfogalom tehát a következő elvekre épül:
- a halmazelmélet alapelve;
- az elemek egyediségének elve;
- a halmazok elemeik általi meghatározottságának elve (extenzionalitási axióma);
- valamint az üres halmaz egzisztenciája és unicitása.

## A tiszta halmazelmélet eszméje és alapproblémája

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
∀A ∃B ∀x ( x∈B ⇔ ∃y∈A ( x∈y ) )

Egy A halmaz elemeinek egyesítési halmazát így jelöljük: ⋃A

Ahhoz tehát, hogy halmazokat egyesíthessünk, mindenekelőtt egyetlen halmazba kell foglalnunk őket _mint elemeket_. Szerencsére a páraxióma lehetővé teszi, hogy két halmazt egyesítsünk:
A∪B ≝ ⋃ { A, B }

A páraxióma és két halmaz egyesítése révén immár megvalósítható tetszőleges véges elemszámú halmazok előállítása az elemek felsorolásával.

### Halmazrészek, részhalmazok

Definíció szerint adott halmazok metszete: a halmazok közös elemeinek a halmaza, vagyis a halmazok közös része.
Láttuk, hogy az üres halmaz bevezetését (többek között) az is indokolja, hogy általa a metszetképzést a halmazokon értelmezett _zárt_ műveletté tehetjük, tehát halmazok közös részét akkor is halmaznak tekinthetjük, ha a halmazoknak közös eleme nincs.

De vajon miért tekinthetjük halmaznak a metszetet egyáltalában? Minek az alapján gondoljuk azt, hogy halmazok közös része szintén halmaz? A gondolat a halmazképzés első megkülönböztetésére támaszkodik, amely szerint másoktól egyértelműen megkülönböztetett dolgokat egy halmaz elemeinek nevezhetünk. A megkülönböztetésnek azt a módját pedig, amely már meghatározott (jól definiált) halmazok _közös_ elemeit különíti el minden mástól, jogosan nevezhetjük egyértelműnek.

Az axiomatikus halmazelmélet ennél általánosabb elvet rögzít, amely szerint nem csak halmazok közös része, hanem egy adott halmaz _bármely_ része halmaz: tehát egy halmaz tetszőlegesen, de egyértelműen megkülönböztetett elemei szintén halmazt alkotnak.
Ezt az elvet rögzíti az __elkülönítési__ vagy __részhalmaz-axiómaséma__: ∀A ∀𝜗 ∃B ∀x ( x∈B ⇔ ( x∈A ∧ 𝜗(x) ) )

Az axiómaséma által garantált egyedi halmaz definitív leírásához használjuk a megszokott B = { x∈A | 𝜗(x) } jelölést. Ahhoz, hogy a definíció ne legyen körbenforgó, nyilván nem engedhetjük meg, hogy a 𝜗 tulajdonság meghatározásában a B halmazra hivatkozzunk!

Olyan (általában osztály alapú) axiómarendszerekben, amelyek külön 'halmaz' predikátummal rendelkeznek, az axiómaséma helyett az egyszerűbb __részhalmaz-axióma__ rögzítése is elegendő: ∀x ∀A ( x⊆A ⇒ x halmaz )

Tekintettel arra, hogy egy halmaz részei maguk is halmazok, a részek _összességét_ is célszerű halmaznak tekinteni. Bár az _elemhalmaz_ (értsd: elemek halmaza), _számhalmaz_  (értsd: számok halmaza), _ponthalmaz_ (értsd: pontok halmaza) szóösszetételek mintájára következetes volna egy halmaz részeinek összességét _részhalmaz_-nak (értsd: részek halmaza) nevezni, azonban ez utóbbi fogalmat magukra a halmazrészekre alkalmazzuk. Egy halmaz részeinek halmazára a _hatványhalmaz_ megnevezést használjuk, és létezését a __hatványhalmaz-axióma__ biztosítja:
∀A ∃B ∀x ( x∈B ⇔ x⊆A )

Egy A halmaz hatványhalmazát általában így jelöljük: 𝒫(A)

𝒫(A) ≝ { x | x⊆A }

### Halmazok leképezése

Míg az előző halmazműveletek a már rendelkezésre álló halmazok _saját_ elemeiből vagy részeiből álló új halmazokat állítanak elő, egy halmaz _leképezése_ egy tőle teljesen független másik halmaz megjelenítését célozza. A kiinduló halmaz és az eredmény között mindössze a leképezési reláció teremt kapcsolatot - lehetséges ugyan, de nem követelmény a két halmaz elemei közötti más összefüggés.

A halmazok leképezésének elve szerint egy halmaz elemeinek bármely egyértelmű leképezése szintén halmazt eredményez. A leképezés egyértelműsége révén az eredmény halmaz is egyértelműen meghatározott. Ezt az elvet rögzíti a __helyettesítési axiómaséma__:
∀𝜚 ( ∀x ∃!y 𝜚(x,y) ⟹ ∀A ∃!B ∀y ( y∈B ⇔ ∃x∈A 𝜚(x,y) ) )

Az axiómaséma által garantált egyedi halmaz definitív leírásához, a relációs összefüggés y = 𝜚(x) függvényszerű átírásával, használjuk a B = { 𝜚(x) | x∈A } jelölést.

Amennyiben egy reláció nem egyértelmű (tehát nem leképezés), akkor egy halmaz elemeivel relációban álló minden más dolgot elemként tartalmazó halmaz létezése nem garantált. A __határoltsági axiómaséma__ szerint azonban olyan halmaz biztosan létezik, amely tartalmazza az eredeti halmaz relációban álló elemeinek legalább egy relációs párját:
∀𝜚 ( ∀A ∃B ∀x∈A ( ∃y 𝜚(x,y) ⟹ ∃y∈B 𝜚(x,y) )

Ha tehát az eredeti halmaz minden elemének van relációs párja, akkor az __összegyűjtési axiómaséma__ szerint létezik olyan másik halmaz, amelyben az eredeti halmaz mindegyik elemének van relációs párja:
∀𝜚 ( ∀x ∃y 𝜚(x,y) ⟹ ∀A ∃B ∀x∈A ∃y∈B 𝜚(x,y) )

A körbenforgó okoskodás elkerülése végett, a részhalmaz-axiómasémához hasonló módon, a fenti esetekben sem engedhetjük meg, hogy a 𝜚 reláció meghatározásakor a B eredmény halmazra hivatkozzunk.

Az üres halmaz posztulátumát felhasználva a helyettesítési axiómasémából levezethető az elkülönítési axiómaséma!
Ha ugyanis a 𝜗 tulajdonság egy A halmaz egyik elemére sem igaz, akkor B = { x∈A | 𝜗(x) } = ∅, az üres halmaz. Máskülönben legyen y olyan eleme az A halmaznak, amelyre 𝜗(y) fennáll, és definiáljuk a 𝜚 relációt a következőképpen:
- 𝜚(x) = x, ha 𝜗(x)
- máskülönben 𝜚(x) = y

A helyettesítési axiómasémát felhasználva: létezik a
B = { 𝜚(x) | x∈A } = { x∈A | 𝜗(x) } halmaz, ami éppen az A halmaznak a 𝜗 tulajdonság által meghatározott része, amit az elkülönítési axiómaséma is garantál.

## Halmazok halmozása

### Végtelenek sokasága

A tiszta halmazelméletben, az üres halmazra mint végső alapelemre építve, a halmazműveletek következetes alkalmazása révén előállítható bármely véges elemszámú halmaz. Egyedül a hatványhalmaz művelettel is tetszőlegesen nagy elemszámú halmazokat állíthatunk elő. Az eddig bevezetett axiómák közül azonban egyik sem garantálja, hogy _végtelen_ halmaz is létezik: olyan halmaz, amely _bármely_ véges számnál több elemet tartalmaz.

A matematikai gyakorlatban persze ismerünk végtelen halmazokat: a számok halmazát, a térbeli pontok halmazát, a valós függvények halmazát stb. Ezeknek a tiszta halmazelméleti modellezéséhez azonban _halmazokból álló_ végtelen halmazokra van szükség.

Szemléletünk "legegyszerűbb" végtelenfogalma: a vég nélküli ismétlődés. Az örökös ismétlődés végtelenje a mindennapi gyakorlatból, tapasztalatból ismert periodikus események állandósítása: egyfajta elvonatkoztatás a változástól. Tipikus példája ennek az időmérés alapjául szolgáló napi és éves ciklus. A periódusok megkülönböztetésének és azonosításának praktikus módja a _számlálás_: a számok soha el nem fogyó sorának társítása az események szüntelenül ismétlődő sorához. Az egyértelmű azonosítást a számlálás következetessége biztosítja; nincs kihagyás: az egymás után következő periódusokhoz egymás után következő számokat társítunk. Amennyiben egy végtelen halmaz elemei a természetes számokhoz hasonló _hiánytalan_ sorba rendezhetők, akkor azt a halmazt _megszámlálhatóan végtelennek_ nevezzük.

Megszámlálhatóan végtelen halmazok létezésének posztulálásához a természetes számokhoz hasonlóan rendre egymásra következő, de egymástól garantáltan különböző elemek vég nélküli sorát kell biztosítani. Egy ilyen konstrukcióval már találkoztunk az elemek felsorolásával előállítható egyelemű halmazok tárgyalásakor, ez a rákövetkezés Zermelo-féle elve:
- a kezdőelem az üres halmaz;
- a rákövetkező halmazok rendre az utolsóként előállított halmaz "felsorolásával" adódnak.

Egy kis módosítással az egymásra következő halmazok _elemszámát_ is különbözővé tehetjük, ez a rákövetkezés Neumann-féle elve:
- a kezdőelem az üres halmaz;
- a rákövetkező halmazok rendre az összes addig előállított halmaz felsorolásával adódnak.

Természetesen más rákövetkezési elvek is konstruálhatók; a halmazelméletben mindenesetre Neumann javaslatát kanonizálták. Jelölje egy x halmaz (valamilyen elv szerinti) rákövetkezőjét: x⁺

A __végtelen halmaz posztulátuma__ azt mondja ki, hogy _létezik olyan halmaz, aminek eleme az üres halmaz, és minden elemének a rákövetkezője is eleme a halmaznak_:
∃A ( ∅∈A ∧ ∀x∈A ( x⁺∈A ) )  

A posztulátum nem zárja ki, hogy egy végtelen halmazban az üres halmazon kívül más "kezdőelem" is legyen, ezért a posztulált halmaz még a rákövetkezés elvének a rögzítésével sem egyértelmű. Az viszont bizonyos, hogy minden ilyen halmaz közös része csak az üres halmazt és annak rákövetkezőit tartalmazza: ezt a halmazt tekintjük a természetes számok halmazelméleti modelljének, és 𝜔-val jelöljük.
𝜔 ≝ ⋂ { A | ∅∈A ∧ ∀x∈A ( x⁺∈A ) }

Vegyük észre, hogy a végtelen halmaz posztulátuma az üres halmaz létezését is biztosítja: belőle az üres halmaz létezése levezethető, nem kell tehát azt axiómának rögzíteni!

A végtelen halmazok mint műveleti elemek révén a halmazok univerzumának végtelen számú, méretű és komplexitású tagjait állíthatjuk elő. Talán minden létező, vagy legalábbis minden elképzelhető halmazt. Vajon hogyan tudunk közöttük különbséget tenni? Nemcsak az elemeik összehasonlítása tűnik lehetetlennek, de az is megkérdőjelezhető, hogy bármely két halmazról eldönthetjük-e, hogy melyik eleme a másiknak! Vagy, ha minden halmaz eleme a halmazok univerzumának, akkor milyen halmazoknak lehet az eleme maga az univerzum? És ha az univerzum is halmaz, akkor vajon önmagának az eleme-e? És mekkora lehet ennek az univerzális halmaznak a mérete?

A tiszta halmazelmélet alapdilemmái tehát új kérdésekkel bővülnek:
- Melyek az _eleme_ reláció általános jellemzői?
- Lehet-e két halmaz kölcsönösen eleme egymásnak?
- Lehet-e egy halmaz önmagának az eleme?
- Mit tudhatunk az univerzális halmazról, amelynek minden halmaz az eleme?

## A formalizmus kísértése

Egy halmaz és az eleme közötti különbség akkor sem magától értetődő, ha különneműek, vagyis az elem maga nem halmaz. Jól érzékeltethető ez a tény egyelemű halmazokkal: magyarázzuk el, miben különbözik az egyetlen kavicsot tartalmazó halmaz magától a kavicstól!

Színesedik a helyzet, ha az egyelemű halmaz egyetlen eleme maga is egy halmaz. Tekintsük az üres halmazt és a rákövetkezőjét: mi közöttük a különbség? Mondhatjuk persze, hogy az egyiknek van egy eleme, a másiknak nincs. De ez az elem az üres halmaz, vagyis a semmi, tehát az egyik halmaz a semmit tartalmazza, a másik pedig semmit sem... nem ugyanaz?

A fenti helyzetekben jól bevált kiút a formalizmus: az elem ábrázolása önmagában és az elem ábrázolása a halmazban. A két formula közötti különbség alkalmas illusztráció a magyarázathoz: ∅ illetve { ∅ }. A formalizmus eredeti célja a gyakorlati ismeretszerzés eredményeinek rögzítése, a nyelvhasználatban rejlő kétértelműségek kiküszöbölése, az ismeretanyag tömörítése, az információközlés optimalizálása és hasonlók. Ám a gyakorlattól és a valóságtól elszakadó, öncélú formalizmus izgalmas kísérletekre csábít. Miért ne lehetne egy halmaz önmagának az eleme, hiszen formálisan ez könnyen leírható: A = { A } ?

Az elméleti ellenvetés az, hogy a halmazképzés harmadik megkülönböztetését ezzel a konstrukcióval teljesen lehetetlenné tesszük, de a negyedik is kétségessé válik: azonos-e vagy különbözik a fenti halmaz a B = { B } halmaztól? A gyakorlati ellenvetés az, hogy önmagát elemként tartalmazó _halmazra_ nem találunk példát. Természetesen ismerünk a gyakorlatban is számos olyan struktúrát, amelyben lehetséges az önreferencia, de vajon ez átvihető-e _puszta analógia_ révén a halmazokra csak azért, mert a formalizmus az önreferenciát lehetővé teszi?!

Az önmagukat is tartalmazó halmazok ötlete mindenesetre egy új végtelen-perspektívát is kínál: az üres halmazra mint alapelemre épülő végtelen terjedelmű halmaz konstrukciók mellett az önmagukat tartalmazó halmazok még véges elemszám esetén is kibonthatatlanok: mélységükben, vagy ha úgy tetszik, vertikálisan végtelenek...

### Antinómia és paradoxon

A formalizmus az univerzális halmaz leírását is "testközelbe hozza": legyen U = { x | x = x } minden dolgok halmaza, avagy - a tisza halmazelméletben - a halmazok halmaza. Minthogy U - fogalma szerint - maga is halmaz, ráadásul, mint minden dolog, önmagával azonos, ezért nyilvánvalóan eleme önmagának. Ezt a reflexív viszonyt a formalizmus is megengedi és most már példát is tudunk mondani rá, vezessünk hát be egy külön elnevezést a hasonló tulajdonságú halmazokra.

___Definíció___: Azokat a halmazokat, amelyek önmaguknak nem elemei, nevezzük _reguláris_ halmazoknak; azokat, amelyek önmaguknak az elemei, nevezzük _irreguláris_ halmazoknak.

Az elkülönítési axióma alapján létezik U-nak a reguláris része, amely tehát csak a reguláris halmazokat tartalmazza: R = { x∈U | x∉x }.
A kérdés az, hogy maga R vajon reguláris vagy irreguláris?
Ha reguláris, akkor maga is eleme az U reguláris részének, tehát önmagának - ha eleme önmagának, akkor viszont definíció szerint irreguláris! Ha irreguláris, akkor nem tartozhat U reguláris részében, tehát nem eleme önmagának - vagyis definíció szerint reguláris! Fogalmi önellentmondásba, mégpedig a nevezetes _Russell-antinómiába_ ütköztünk.

Az univerzális halmazzal más probléma is van. Cantor tétele szerint egy halmaz hatványhalmazának a mérete (számossága) mindig nagyobb, mint az eredeti halmazé. Az univerzális halmaznak azonban minden más halmaz eleme és része is egyben: mérete nem lehet tehát kisebb, mint hatványhalmazának a mérete. Az univerzális halmaz éppen ettől univerzális: voltaképpen azonos a saját hatványhalmazával! Ez a tételnek is és a szemléletnek is ellentmondó következtetés a _Cantor-paradoxon_.

A fentieken kívül még más logikai buktatók is azt jelzik, hogy _az univerzális halmaz fogalma önmagában ellentmondásos_; létezhetnek ugyan halmazokból álló halmazok, de 'minden halmaz halmaza' logikailag kezelhetetlen konstrukció, tehát halmazelméleti szempontból nem létezik. Ezt az antinómiára és a paradoxonokra hivatkozva szokás tételként is rögzíteni: ∄A ∀x ( x∈A )

## Az univerzum megmentése



### A logicista megoldás

### A formalista megoldás

### Az ontológiai megoldás
