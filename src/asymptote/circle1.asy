import graph;
import geometry;

size(400);

// Define circle center and radius
pair O = (0, 0);
real r = 3;

// Draw circle
draw(circle(O, r), linewidth(1.2) + blue);

// Draw regular hexagon
path hexagon;
pair[] hexPoints;
for (int i = 0; i < 6; ++i) {
    hexPoints.push(r * dir(90 + i * 60));
}
hexagon = hexPoints[0];
for (int i = 1; i < 6; ++i) {
    hexagon = hexagon -- hexPoints[i];
}
hexagon = hexagon -- cycle;
draw(hexagon, linewidth(0.8) + gray(0.3));

// Mark center
dot(O, linewidth(4));
label("$O$", O, SW);

// Select one side of hexagon
pair A = hexPoints[0];  
pair B = hexPoints[1];
Label label_circle=Label("$r=1$");
draw(O -- A, L=  label_circle, linewidth(1) + red);
draw(O -- B, linewidth(1) + red);
draw(A -- B, linewidth(1.2) + red);

// Mark triangle vertices
dot(A, linewidth(4) + red);
dot(B, linewidth(4) + red);
label("$A$", A, dir(90));
label("$B$", B, dir(180));

// Draw height (median) of isosceles triangle OAB
pair M = (A + B) / 2;
draw(O -- M, linewidth(1) + deepgreen + dashed);
dot(M, linewidth(4) + deepgreen);
label("$M$", M, dir(260));

// Mark apothem
label("$h$", O + 0.6*(M-O), E + 0.2*N);

// Draw right angle mark at M
real marksize = 0.2;
pair dir1 = unit(O - M);
pair dir2 = unit(A - M);
draw(M + marksize*dir1 -- M + marksize*dir1 + marksize*dir2 -- M + marksize*dir2, linewidth(0.6) + deepgreen);

// Draw dodecagon segment
pair C = r * dir(90 + 30); // New vertex of regular 12-gon
draw(O -- C, linewidth(0.8) + orange + dashed);
draw(A -- C, linewidth(0.8) + orange + dashed);
dot(C, linewidth(3) + orange);
label("$C$", C, dir(90));

// Fill dodecagon segment (triangle OAC)
fill(O -- A -- C -- cycle, orange + opacity(0.15));

// Add angle mark at O between OA and OB
draw("$60^\circ$",arc(O, 0.6, degrees(A-O), degrees(B-O)), linewidth(0.6) + red, Arrow(4));
shipout(bbox(0.5cm));
