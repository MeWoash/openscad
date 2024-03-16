use <Getriebe.scad>;
// CR200b
// gestosc = 20-30%
// MAKS 1h

module platforma(dlugosc, szerokosc, wysokosc) {
    // Platforma
    translate([-dlugosc/2, -szerokosc/2, 0]) cube([dlugosc, szerokosc, wysokosc]);
}

module slupki() {
    // Słupek dla większego koła
    translate([0, 0, 0]) cylinder(h=20, r=2.3, $fn=50);
    // Słupek dla mniejszego koła
    translate([50, 0, 0]) cylinder(h=20, r=2.3, $fn=50);
}


module przekladnia(modul = 2, liczba_zebow_1 = 15, przekladnia = 4)
{

liczba_zebow_2 = liczba_zebow_1 * przekladnia;

d1 = modul*liczba_zebow_1;
d2 = modul*liczba_zebow_2;
odleglosc_srodkow = (d1/2 + d2/2)*1.0;

//kolo 2
translate([odleglosc_srodkow, 0, 0])
stirnrad(modul=modul, zahnzahl=liczba_zebow_2, breite=10, bohrung=5);

//kolo 1
translate([0, 0, 0])
stirnrad(modul=modul, zahnzahl=liczba_zebow_1, breite=10, bohrung=5);

// platforma(100, 100, 5);
// slupki();
// przekladnia();
}

przekladnia(modul = 2, liczba_zebow_1 = 10, przekladnia = 4);
