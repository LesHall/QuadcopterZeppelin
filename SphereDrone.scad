
$fn = 32;

// lift factor
liftFactor = pow(33/14, 1/3);

//lifting power is 14 grams for a 12 inch helium balloon
balloonDiameter = 12 * liftFactor * 25.4;  // twelve inch balloon
echo("balloon diameter = ",balloonDiameter / 25.4," inches");

bladeDiameter = 2 * 25.4;  // two inch propellers

standoffDistance = sqrt(2) * bladeDiameter;

motorHeight = 0.5 * bladeDiameter;

numBlades = 4;


sphere(r=balloonDiameter/2);

// mounts
for (i=[0:numBlades-1])
rotate(360*i/numBlades, [0, 0, 1])
translate([balloonDiameter/2, 0, 0])
minkowski()
{
    cube([4, 40, 40], center=true);
    sphere(r=4);
}

// standoffs
for (i=[0:numBlades-1])
rotate(360*i/numBlades, [0, 0, 1])
translate([balloonDiameter/2+standoffDistance/2, 0, 0])
cube([standoffDistance, 2, 4], center=true);

// engines
for (i=[0:numBlades-1])
rotate(360*i/numBlades, [0, 0, 1])
translate([balloonDiameter/2+standoffDistance, 0, 0])
cylinder(r=5, h=20, center=true);

// blades
for (i=[0:numBlades-1])
rotate(360*i/numBlades, [0, 0, 1])
translate([balloonDiameter/2+standoffDistance, 0, 10])
cylinder(r=bladeDiameter, h=4, center=true);

// strap
difference()
{
    cylinder(r=balloonDiameter/2 + 8, h = 30, center=true);

    cylinder(r=balloonDiameter/2 + 6, h = 32, center=true);
}

// gondola
translate([0, 0, -balloonDiameter/2])
minkowski()
{
    cylinder(r=bladeDiameter, h=20, center=true);

    sphere(d=20);
}




