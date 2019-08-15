void setup() {
 size(840, 840);
 pixelDensity(2);
 noLoop();
}

void draw() {
 background(#5160A7);
 generate();
 powder();
}

void generate() {
 align(width/2, height*0.1, width);
 push();
 translate(width/2, height*0.5);
 rotate(-radians(12));
 align(0, 0, width * 1.5);
 pop();
 align(width/2, height*0.9, width);
}

void powder() {
 for (int i = 0; i < 800000; i ++) {
   stroke(random(100, 255), 30);
   strokeWeight(0.8);
   point(random(width), random(height));
 }
 
}

void align(float x, float y, float l) {
 float hl = l/2;
 float posX = -hl;

 push();
 translate(x, y);
 
 noStroke();
 for (int i = 0; i < 12; i ++) {
   float d = random(10, 200);

   posX += d/2;
   
   fill(getCol());
   lackingCirlce(posX, 0, d);

   rotate(PI);
   lackingCirlce(posX, 0, d);
   
   posX += d/2;
 }
 stroke(#ffffff);
 strokeWeight(2);
 line(hl, 0, -hl, 0);
 pop();
}

void lackingCirlce(float x, float y, float d) {
 float r = d/2.0;
 float sr = random(r);
 float start = acos(sr/r);
 float end = TAU - start;

 arc(x, y - sr, d, d, start  + PI/2, end  + PI/2, OPEN);
}

void mousePressed() {
 redraw();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#6699cc, #fff275, #ff8c42, #ff3c38, #a23e48};
int getCol() {
 return colors[(int)random(colors.length)];
}
