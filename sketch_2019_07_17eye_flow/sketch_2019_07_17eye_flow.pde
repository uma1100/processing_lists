int sAlph = 150;
int col_pub = 0;

void setup() {
 size(900, 900);
 pixelDensity(2);
 noLoop();
}

void draw() {
 background(#FFFFFF);
 circles();
}

void circles() {
 int cx = width/2; 
 int cy = height/2;

 ArrayList<PVector> points = new ArrayList<PVector>();
 int count = 1;

 for (int i = 0; i < count; i++) {
   float s = random(40, 500);
   float d = random(cx*1.5-s);
   float a = random(TWO_PI);
   float x = cx + cos(a) * d;
   float y = cy + sin(a) * d;
   boolean add = true;

   for (int j = 0; j < points.size(); j++) {
     PVector p = points.get(j); 
     if (dist(x, y, p.x, p.y) < (s+p.z)*0.5) {
       add = false; 
       break;
     }
   }
   if (add) points.add(new PVector(x, y, s));
 }

 for (int i = 0; i < points.size(); i++) {
   PVector p = points.get(i);
   float s = p.z*0.55;
   float l = p.z *0.5;

   push();
   fill(#414246);
   noStroke();
   translate(p.x, p.y);
   circle(0, 0, s*2);
   rotate((int)random(4) * HALF_PI);
   triangle(-s, 0, 0, s, l, -l);
   triangle(-s, 0, 0, s, l, -l*0.8);
   triangle(-s, 0, 0, s, l*0.8, -l);
   pop();
 }

 for (int i = 0; i < points.size(); i++) {
   PVector p = points.get(i);
   eye(p.x, p.y, p.z);
 }
} 

void eye(float x, float y, float s) {
 float l = s*0.4;
 float rnd = random(1);

 stroke(0, sAlph);
 strokeWeight(1);
 fill(#ffffff);
 ellipse(x, y, s, s);
 circleRec(x, y, s * 0.9);

 //if (rnd < 0.33) {
 //  stroke(0, sAlph);
 //  arc(x, y, s, s, PI, TAU, PIE);
 //} else if (rnd < 0.66) {
   
 //} 

 noStroke();
 fill(#ffffff);
 circle(x-s*0.25, y+s*0.25, s * 0.15);
 
 fill(col_pub);
 stroke(0, sAlph);
 arc(x, y, s, s, PI+radians(30), TAU-radians(30), CHORD);
}

void circleRec(float x, float y, float d) {
 float min = 30;
 
 col_pub = getCol();
 fill(col_pub);
 ellipse(x, y, d, d);
 noStroke();

 if (d > min) {
   float rd = random(d*0.2, d*0.8);
   float a = random(TAU);
   float x1 = x - ((d-rd)/2) * cos(a);
   float y1 = y - ((d-rd)/2) * sin(a); 
   float x2 = x + ((d/2)-(d-rd)/2) * cos(a);
   float y2 = y + ((d/2)-(d-rd)/2) * sin(a); 

   circleRec(x1, y1, rd);
   circleRec(x2, y2, d-rd);
 }
}

void mousePressed() {
 redraw();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#eac435, #345995, #e40066, #03cea4, #fb4d3d};
int getCol() {
 return colors[(int)random(colors.length)];
}
