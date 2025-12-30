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
for (int i = 0; i < 12; ++i) {
    hexPoints.push(r * dir(90 + i * 30));
}
hexagon = hexPoints[0];
for (int i = 1; i < 12; ++i) {
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

line l1=line(B,O);
point P=projection(l1)*A;
dot("$P$",P,2W);
draw(A -- P, linewidth(1) + deepgreen + dashed);
markrightangle(A,P,O);


// Add angle mark at O between OA and OB
draw("$\theta$",arc(O, 0.3, degrees(A-O), degrees(B-O)), linewidth(0.6) + red, Arrow(4));
shipout(bbox(0.5cm));
