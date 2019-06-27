# A halmaz fogalma

Halmazok vagy halmazképzés útján, vagy más halmazokkal végzett műveletek révén keletkeznek.

A halmazképzés négy megkülönböztetésből áll:

1. Néhány dolgot megkülönböztetünk minden mástól.

   Ennek a megkülönböztetésnek nem a módja a lényeges, hanem az eredménye: ugyanazokat a dolgokat többféleképpen is megkülönböztethetjük a többitől.
   A másoktól egyértelműen megkülönböztetett dolgokat a halmaz _elemeinek_ nevezzük.

   __A halmazelmélet alapelve__ szerint ___minden elem___, azaz bármely egyértelműen azonosítható dolog elemként halmazba foglalható:
   ∀x ∃A ( x∈A )

2. Egy halmaz elemeit nemcsak minden mástól, hanem egymástól is megkülönböztetjük.

   Ez a második megkülönböztetés azt jelenti, hogy a halmaz elemei nem azonosak egymással, és minden egyes elem csak önmagával azonos:
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

Az üres halmaz fogalma olyan (mennyiségi) elvonatkoztatás a halmazokat meghatározó elemektől, amely logikailag összeegyeztethető a halmazképzés négy megkülönböztetésével azzal a következtetéssel, hogy - az extenzionalitási axióma alapján - csak egyetlen üres halmaz létezik.

Az elemektől való elvonatkoztatás tovább folytatható.  
Miután a fenti szemlélet megalapozta a halmazok _dologiságát_, a halmazelmélet teljes formalizálása végett elvonatkoztathatunk _az elemek_ dologiságától.
Ennek első lépése, hogy a halmazok dologiságát halmazelméleti szempontból teljessé tesszük azzal a megállapítással, hogy mivel a halmazok egymástól egyértelműen megkülönböztethetők, ezért maguk is lehetnek elemek: elemei _más_ halmazoknak.  
Az üres halmaz léte garantálja, hogy legalább egy halmaz tőle különnemű elemek nélkül is létezik; az üres halmazt elemként felfogva pedig további halmazokat képezhetünk további különnemű elemek nélkül. Teljesen eltekinthetünk tehát a halmazoktól különböző dolgoktól, és ezzel az elemektől való (minőségi) elvonatkoztatással megalapozhatjuk a tiszta halmazelméletet, amelyben minden dolog halmaz és más halmazoknak az eleme is egyben.  
Ez __a tiszta halmazelmélet elve__: ___minden halmaz___.

A tiszta halmazelmélet elve _egyneműsíti_ a halmazokat és az elemeket, ezáltal megszünteti a lényegi különbséget a halmazok és elemeik között. Egyszerre szünteti meg az elemek dologiságát és a halmaz definiálható fogalmát. A halmaz fogalma _alapfogalommá_, az elem fogalma pedig a halmazok közötti _relációvá_ változik. A halmazképzés négy eredeti megkülönböztetése részint összemosódik, részint problematikussá válik. Az elemek megkülönböztetése egymástól a halmazok egymástól való megkülönböztetésévé lesz, amelyeket viszont éppen az elemeik alapján kellene megkülönböztetnünk. Az ördögi kört az üres halmaz unicitása töri meg, amelynek köszönhetően az üres halmaz univerzális alapelemmé léphet elő.

A tiszta halmazelméletben változatlanul megőrizhetjük:
- a halmazelmélet alapelvét;
- az elemek egyediségének elvét;
- a halmazok elemeik általi meghatározottságának elvét (extenzionalitási axióma);
- valamint az üres halmaz egzisztenciáját és unicitását.

A 3. megkülönböztetéssel azonban komoly problémák adódnak!
- Hogyan tehetünk különbséget a halmaz és vele egynemű elemei között?
- Létezhet-e egy halmaz anélkül, hogy az elemeit _tőle függetlenül_ meghatároztuk volna, avagy meghatározhatjuk-e egy halmaz elemeit a halmaz _saját meghatározása által_?
- Melyek az _eleme_ reláció jellemzői?
- Lehet-e egy halmaz önmagának az eleme?
- Lehet-e két halmaz kölcsönösen eleme egymásnak?
- Létezhet-e halmaz, amelynek eleme minden (más) halmaz?

Mi történik, ha a halmazképzési eljárás csődöt mond? Kiutat jelenthetnek-e a halmazműveletek? Ahhoz, hogy egy halmazt más halmazokkal végzett műveletek útján előállítsunk, a műveletek tagjainak már rendelkezésre kell állniuk. Ámde hogyan állítsuk elő azokat a halmazokat, amelyeken majd a műveleteket elvégezhetjük?  
A tiszta halmazelmélet egyik kulcskérdése, hogy létezik-e benne a halmazképzésnek más módja is, mint halmazoknak más halmazokon végzett műveletek révén történő előállítása.  
Egyáltalán és mindenekelőtt: miféle műveletekkel állíthatunk elő adott halmazokból más halmazokat?

## Halmazműveletek

- elemek (=halmazok) felsorolása
- közös rész, metszet
- egyesítés, unió
- hatványhalmaz
