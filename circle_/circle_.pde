Form[] form = new Form[1000];
int[] colors = {#b8b8d1, #5b5f97, #ffc145, #fffffb, #ff6b6c};
//int[] colors = {#586ba4, #324376, #f5dd90, #f68e5f, #f76c5e};
float minS = 5, maxS = 40;

void setup() {
 size(900, 900);
 pixelDensity(2);
 noLoop();
 rectMode(CENTER);

 newForm();
}

void draw() {
 bg();

 for (int i = 0; i < form.length; i ++) {
   form[i].show();
 }

}

void bg(){
 int c = 450;
 float w = width/c;
 float noiseS = 0.09;
 
 //background(#343C89);
 background(#f0f8ff);
 

 for (int j = 0; j < c+1; j ++) {
   for (int i = 0; i < c+1; i ++) {
     float alph = map(noise(i * noiseS, j * noiseS), 0, 1, 0, 255);

     push();
     translate(i * w, j * w);
     stroke(#ffffff, alph);
     point(0, 0);
     pop();
   }
 }
}

void mousePressed() {
 redraw();
 newForm();
 noiseSeed((int)random(100000));
}

void newForm() {
 for (int i = 0; i < form.length; i ++) {
   form[i] = new Form(random(width), random(height), random(minS, maxS));
 }
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int getCol() {
 return colors[(int)random(colors.length)];
}

class Form {
 float x, y, s;
 float hs;
 int n;
 float angle ;
 int toggle;
 Form(float x, float y, float s) {
   this.x = x;
   this.y = y;
   this.s = s;
   hs = s/2;
   n = (int)random(5);
   angle = (int)random(4) * QUARTER_PI;
   toggle = int(random(2));
   strokeWeight(1);
 }

 void show() {
   fill(getCol());
   if (toggle == 1) noFill();
   stroke(getCol());

   push();
   translate(x, y);
   rotate(angle);

   switch(n) {
   case 0:
     line(-hs, -hs, hs, hs);
     break;

   case 1:
     line(hs, -hs, -hs, hs);
     line(-hs, -hs, hs, hs);
     break;

   case 2:
     square(0, 0, s);
     break;

   case 3:
     circle(0, 0, s);
     break;
   }

   pop();
 }
}
