import graph;
import geometry;

size(400);

// Define circle center and radius
pair O = (0, 0);
real r = 3;

// Draw circle
draw(circle(O, r), linewidth(1.2) + blue);

// Draw regular 12-gon
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

// Select one side of 12-gon (inscribed triangle)
pair A = hexPoints[0];  
pair B = hexPoints[1];
Label label_circle = Label("$r=1$");
draw(O -- A, L=label_circle, linewidth(1) + red);
draw(O -- B, linewidth(1) + red);
draw(A -- B, linewidth(1) + red);

// Mark triangle vertices
dot(A, linewidth(4) + red);
dot(B, linewidth(4) + red);
label("$A$", A, dir(60));
label("$B$", B, dir(120));

// Add angle mark at O between OA and OB
draw("$\theta$", arc(O, 0.3, degrees(A-O), degrees(B-O)), linewidth(0.6) + red, Arrow(4));

// Draw tangent at point B
// Tangent direction is perpendicular to OB
pair tangent_dir = rotate(90) * unit(B - O);

// Find intersection of tangent line at B with extension of line OA
// Parametric form: B + t * tangent_dir = O + s * (A - O)
// We need to solve for t and s
pair OA_dir = unit(A - O);
real s = dot(B - O, rotate(90) * tangent_dir) / dot(OA_dir, rotate(90) * tangent_dir);
pair C = O + s * OA_dir;

// Draw the circumscribed triangle
draw(O -- C, linewidth(1) + red);
draw(B -- C, linewidth(1.2) + red);
markrightangle(C, B, O);

// Mark vertex C
dot(C, linewidth(4) + orange);
label("$C$", C, dir(degrees(C - O)));

shipout(bbox(0.5cm));
