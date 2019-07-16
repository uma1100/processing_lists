int count = 4;

void setup() {
 size(900, 900);
 pixelDensity(2);
 noLoop();
 rectMode(CENTER);
}

void draw() {
 background(#ffffff);
 squareRec(width/2, height/2, width-20, count);
 powder();
}

void powder() {
 for (int i = 0; i < 1000000; i ++) {
   stroke(random(100, 255), 30);
   strokeWeight(0.9);
   point(random(width), random(height));
 }
}

void squareRec(float x, float y, float s, int n) {
 strokeWeight(3);
 stroke(255);
 fill(getCol());
 square(x, y, s);

 fill(getCol());
 noStroke();
 circle(x, y, s * 0.95);

 form(x, y, s * 0.95);

 n--;

 if (n >= 0) {
   float probability = map(n, 0, count-1, 0.4, 0);
   float hs = s/2;

   if (random(1) > probability) {
     squareRec(x-hs/2, y-hs/2, hs, n);
     squareRec(x+hs/2, y-hs/2, hs, n);
     squareRec(x+hs/2, y+hs/2, hs, n);
     squareRec(x-hs/2, y+hs/2, hs, n);
   }
 }
}

void form(float x, float y, float s) {
 int b = int(random(3));
 float hs = s/2;
 float angle = random(TAU);
 float ps = s * 0.05;
 float l = hs*random(0.1, 1.0);
 float ll = sqrt(sq(hs) - sq(l/2));
 float d1 = random(s*0.5);
 float d2 = random(s*0.5, s*0.9);
 float a1 = random(TAU*0.15, TAU*0.5);
 float a2 = random(TAU*0.5, TAU);
 float aa = radians(108);

 stroke(0);
 strokeWeight(1);

 push();
 translate(x, y);
 rotate(angle);
 switch(b) {
 case 0:
   line(0, l, 0, 0);
   line(ll, l/2, -ll, l/2);

   strokeWeight(0.5);
   fill(getCol());
   circle(0, l, ps);
   fill(getCol());
   circle(0, 0, ps);
   fill(getCol());
   circle(ll, l/2, ps);
   fill(getCol());
   circle(-ll, l/2, ps);
   break;

 case 1:

   fill(getCol());
   arc(0, 0, d1, d1, 0, PI);
   fill(getCol());
   arc(0, 0, d2, d2, PI, TAU);
   line(-hs, 0, hs, 0);

   strokeWeight(0.5);
   fill(getCol());
   circle(-d1/2, 0, ps);
   fill(getCol());
   circle(d1/2, 0, ps);
   fill(getCol());
   circle(-d2/2, 0, ps);
   fill(getCol());
   circle(d2/2, 0, ps);
   fill(getCol());
   circle(-hs, 0, ps);
   fill(getCol());
   circle(hs, 0, ps);
   break;

 case 2:
   noFill();
   arc(0, 0, d1, d1, a1, a1+aa);
   arc(0, 0, d2, d2, a2, a2+aa);
   line(-hs, 0, l, 0);

   strokeWeight(0.5);
   fill(getCol());
   circle(-hs, 0, ps);
   fill(getCol());
   circle(l, 0, ps);

   fill(getCol());
   circle(d1/2 * cos(a1), d1/2 * sin(a1), ps);
   fill(getCol());
   circle(d1/2 * cos(a1+aa), d1/2 * sin(a1+aa), ps);

   fill(getCol());
   circle(d2/2 * cos(a2), d2/2 * sin(a2), ps);
   fill(getCol());
   circle(d2/2 * cos(a2+aa), d2/2 * sin(a2+aa), ps);

   break;
 }
 pop();
}


void mousePressed() {
 redraw();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#acbea3 ,#40476d ,#826754 ,#ad5d4e ,#eb6534, #ffffff};
//int[] colors = {#5BC3EB, #ef5d60, #ec4067, #a01a7d, #E07BE0, #ffffff};
int getCol() {
 return colors[(int)random(colors.length)];
}
