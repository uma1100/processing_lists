Form[] form = new Form[50];
//int[] colors = {#540d6e, #ee4266, #ffd23f, #3bceac, #0ead69};
int[] colors = {#f61067 ,#3626a7 ,#657ed4 ,#ff331f ,#fbfbff};

void setup() {
 size(900, 900);
 pixelDensity(2);
 newForm();
}

void draw() {
 for (int i = 0; i < form.length; i ++) {
   form[i].run();
 }
}

void newForm() {
 background(#000000);
 for (int i = 0; i < form.length; i ++) {
   form[i] = new Form();
 }
}

void drawCircles() {
 for (int j = 0; j < 20; j ++) {
   float x = random(width);
   float y = random(height);
   float d = random(10, 300);
   int col = getCol();

   for (int i = 0; i < 100; i ++) {
     float dd = map(i, 0, 99, d, d * 1.5);
     float a = map(i, 0, 99, 255, 0);
     stroke(col, a);
     circle(x, y, dd);
   }
 }
}

void keyPressed() {
 if (key == ' ') {
   drawCircles();
   noLoop();
 }
 if (key == 's')saveFrame("####.png");
}

int getCol() {
 return colors[(int)random(colors.length)];
}

class Form {
 float x, y;
 float l1, l2, a;
 float xStep, yStep;
 float aStep;
 int col;

 Form() {
   x = random(width);
   y = random(height);
   l1 = random(500);
   l2 = random(500);

   a = random(PI);
   xStep = random(-1, 1);
   yStep = random(-1, 1);
   aStep = random(0.01);
   col = getCol();
 }

 void show() {
   noFill();
   stroke(col);
   strokeWeight(0.1);

   push();
   translate(x, y);
   rotate(a);
   line(-l1, 0, l2, 0);
   pop();
 }

 void move() {
   x += xStep;
   y += yStep;
   a += aStep;
 }

 void run() {
   for(int i = 0; i < 10; i ++){
   show();
   move();
   }
 }
}
