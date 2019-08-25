void setup() {
 size(900, 900);
 pixelDensity(2);
 noLoop();
}

void draw() {
 background(255);
 tile();
 for (int i=0; i<20; i++) {
   fill(getCol());
   circle(random(width), random(height), random(1, 12));
   myCurve();
 }
}

void tile() {
 int count = 50;
 float w = width/count;
 strokeWeight(0.1);
 for (int j = 0; j < count; j++) {
   for (int i = 0; i < count; i++) {
     if (random(1) < 0.3) {
       noFill();
       stroke(0);
       rect(i*w, j*w, w, w);
     } 
     if (random(1) < 0.3) {
       fill(0);
       circle(i*w+w/2, j*w+w/2, w*0.1);
     }
   }
 }
}

void myCurve() {
 int c = 900;
 float x = random(width);
 float y = random(height);
 float xstep = 1;
 float ystep = 1;
 float a = random(TAU);
 float astep = random(-1, 1) * 0.001;
 float aacc = random(-1, 1) * 0.0001;
 float maxs = 10;
 float mins = 0;
 color col1 = getCol(), col2 = getCol();

 noStroke();
 fill(getCol());
 for (int i=0; i<c; i++) {
   float s = map(sin(i*0.01), -1, 1, mins, maxs);
   fill(lerpColor(col1, col2, float(i)/float(c)));
   circle(x, y, s);
   x += xstep*sin(a);
   y += ystep*cos(a);
   a += astep;
   astep += aacc;
   noiseSeed(int(random(1000000)));
 }
}

void mousePressed() {
 redraw();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#f8ffe5, #06d6a0, #1b9aaa, #ef476f, #ffc43d};
int getCol() {
 return colors[(int)random(colors.length)];
}
