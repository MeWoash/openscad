use <Getriebe.scad>;
// CR200b
// gestosc = 20-30%
// MAKS 1h


module base(diameter, height, cross_thickness) {
    union() {
        // Create the main cylinder (the base)
        
        difference(){
        cylinder(d = diameter, h = height, $fn = 100);

        translate([0, 0, -1])
        cylinder(d = diameter-cross_thickness*2, h = height+2, $fn = 100);
        }
        
        // Add the vertical part of the cross
        translate([-cross_thickness / 2, -diameter / 2, 0])
            cube([cross_thickness, diameter, height]);
        
        // Add the horizontal part of the cross
        translate([-diameter / 2, -cross_thickness / 2, 0])
            cube([diameter, cross_thickness, height]);
    }
}

module przekladnia(modul = 2,
                    liczba_zebow_1 = 15,
                    przekladnia = 4,
                    wysokosc_kola=10,
                    luz_slupka = 1,
                    stosunek_otworu_srednicy_kola1 = 0.5,
                    stosunek_otworu_srednicy_kola2 = 0.25,
                    wysokosc_podstawki = 5,
                    promien_otworu = 8,
                    grubosc_krzyza = 5)
{

wysokosc_slupkow = wysokosc_podstawki + 2*wysokosc_kola;

liczba_zebow_2 = liczba_zebow_1 * przekladnia;

d1 = modul*liczba_zebow_1; // Srednica podzialowa 1
d2 = modul*liczba_zebow_2; // Srednica podzialowa 2

srednica_otworu1 = d1*stosunek_otworu_srednicy_kola1;
srednica_slupka1 = srednica_otworu1-luz_slupka;

srednica_otworu2 = d2*stosunek_otworu_srednicy_kola2;
srednica_slupka2 = srednica_otworu2-luz_slupka;

odleglosc_srodkow = d1/2 + d2/2+0.5;
promien_podstawki = odleglosc_srodkow + srednica_slupka1/2 + 2;

echo("Srednica slupa1",srednica_slupka1)
echo("Srednica slupa2",srednica_slupka2)

//kolo 2
// translate([0, 0, wysokosc_podstawki+1])rotate(4.5)
translate([0, 5, 0])
stirnrad(modul=modul, zahnzahl=liczba_zebow_2, breite=wysokosc_kola, bohrung=srednica_otworu2, $fn=100);

//kolo 1
// translate([odleglosc_srodkow, 0, wysokosc_podstawki+1])
translate([7, -25, 0])
stirnrad(modul=modul, zahnzahl=liczba_zebow_1, breite=wysokosc_kola, bohrung=srednica_otworu1, $fn=100);

// translate([0, 0, 0])
translate([-30, -40, 0])
{
// slupek1
translate([odleglosc_srodkow, 0, 0]) cylinder(h=wysokosc_slupkow, r=srednica_slupka1/2, $fn=100);

// slupek2
translate([0, 0, 0]) cylinder(h=wysokosc_slupkow, r=srednica_slupka2/2, $fn=100);

base(promien_podstawki*2, wysokosc_podstawki, grubosc_krzyza);
}
}


przekladnia(modul = 1,
            liczba_zebow_1 = 10,
            przekladnia = 4,
            wysokosc_kola = 3,
            luz_slupka = 1,
            stosunek_otworu_srednicy_kola1 = 0.4,
            stosunek_otworu_srednicy_kola2 = 0.2,
            wysokosc_podstawki = 4,
            grubosc_krzyza = 4);