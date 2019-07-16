void setup() {
 size(800, 800);
 pixelDensity(2);
 noLoop();
 colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
 bg();

 int c = 100;
 float s = width/c;
 for (int i = 0; i < c; i ++) {
   plant(i * s, height, s * 0.7);
 }
}

void plant(float x, float y, float s) {
 float h = random(width*0.1, width);
 float xx = random(x-s, x + s*2);
 float d = random(10, 60);

 //fill(random(88, 155), random(100), random(100));
 fill(0, 90);
 noStroke();
 triangle(x, y, x + s, y, xx, y - h);

 fill(getCol());
 myCircle(xx, y - h, d);
}

void myCircle(float x, float y, float d) {
 int c = int(d * 10);

 fill(getCol());
 circle(x, y, d);

 push();
 translate(x, y);
 for (int i = 0; i < c; i ++) {
   fill(getCol());
   rotate(random(TAU));
   circle(random(d/2), 0, random(random(2)));
 }
 pop();
}

void bg() {
 background(#F0F0FA);
 noStroke();
 for (int i = 0; i < 500; i ++) {

   float x = random(width);
   float y = random(height);
   float max = random(6);
   float min = random(6);
   float angle = random(TAU);
   float d = 0;
   float shift = random(10);

   fill(getCol());
   for (int j = 0; j < 20; j ++) {
     d = map(j, 0, 19, min, max);
     push();
     translate(x, y);
     rotate(angle);
     circle(0 + map(j, 0, 19, 0, shift), 0, d);
     pop();
   }
 }
}

void mousePressed() {
 redraw();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

//int[] colors = {#028ee0, #ffcf39, #D066E8, #e31608, #00A676};
int[] colors = {#eac435, #345995, #03cea4, #fb4d3d, #ca1551};
int getCol() {
 return colors[(int)random(colors.length)];
}
