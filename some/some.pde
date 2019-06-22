float noiseStep = 0.03;
int[] colors = {#292F36, #4ECDC4, #F7FFF7, #FF6B6B, #FFE66D, #1470DE, #FA4444};
//int[] colors = {#44af69, #f8333c, #fcab10, #2b9eb3, #db2bc9, #ffffff};

void setup() {
 size(840, 840);
 pixelDensity(2);
 noLoop();
}

void draw() {
 background(#8388C4);
 forms();
 divideRect(10, 10, width - 20, height - 20, 6);
}

void divideRect(float x, float y, float w, float h, int n) { 
 if (n == 0) {
   stroke(0);
   strokeWeight(1);
   noFill();
   rect(x, y, w, h);

   float shift = 10;
   if (random(1) > 0.2) {
     fill(getCol());
     noStroke();
     rect(x + shift/2, y + shift/2, w - shift, h - shift);
     myRect(x + shift/2, y + shift/2, w - shift, h - shift);
   }
 }

 n--;

 if (n>=0) {
   float r = int(random(1, 10)) * 0.1;
   if (w>=h) {
     float randomW = w*r;
     divideRect(x, y, randomW, h, n);
     divideRect(x+randomW, y, w-randomW, h, n);
   }
   if (w<h) {
     float randomH = h*r;
     divideRect(x, y, w, randomH, n);
     divideRect(x, y+randomH, w, h-randomH, n);
   }
 }
}

void myRect(float x, float y, float w, float h) {
 float noiseS = random(0.001, 0.1);
 color col1 = getCol(), col2 = getCol();

 for (float i = x; i <= x+w; i += 1) {
   for (float j = y; j <= y+h; j += 1) {
     float alph = map(noise(i * noiseS, j * noiseS), 0, 1, 0, 255);
     color col = lerpColor(col1, col2, noise(i * noiseS, j * noiseS));
     //stroke(col);
     stroke(col1, alph);
     strokeWeight(2);
     point(i, j);
   }
 }
}

void forms() {
 for (int i = 0; i < 500; i ++) {
   noStroke();
   fill(getCol());
   circle(random(width), random(width), random(5));
 }

 for (int i = 0; i < 40; i ++) {
   float x = random(width), y = random(height);
   float d = random(10, 70);
   float angle = (int)random(8) * QUARTER_PI;

   push();
   translate(x, y);
   rotate(angle);

   if (random(1) > 0.4) {
     for (float j = d; j > 0; j -= d/4) {
       fill(getCol());
       circle(0, 0, j - 1);
     }
     fill(getCol());
     arc(0, 0, d, d, 0, (int)random(9) * QUARTER_PI);
   } else {
     fill(getCol());
     square(0, 0, d);
   }
   pop();
 }
}

int getCol() {
 return colors[(int)random(colors.length)];
}

void mousePressed() {
 redraw();
 noiseSeed((int)random(1000));
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}
