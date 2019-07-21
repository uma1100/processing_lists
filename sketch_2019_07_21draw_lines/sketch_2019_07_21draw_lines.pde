import java.util.*;
ArrayList<Particle> particles;

void setup() {
 size(900, 900);
 pixelDensity(2);
 newParticle();
}

void draw() {
 Iterator<Particle> it = particles.iterator();
 while (it.hasNext()) {
   Particle p = it.next();
   p.run();
   if (p.isDead()) {
     it.remove();
   }
 }
}

void newParticle() {
 particles = new ArrayList<Particle>();
 background(#F0F0FA);
 lines();
 noiseSeed((int)random(10000000));
}

void lines() {
 for (int i = 0; i < 100; i ++) {
   float x = width * 0.05 * (int)random(1, 20);
   float y = height * 0.05 * (int)random(1, 20);
   float l = random(50, 500);
   float s = random(3, 10);
   int b = (int)random(2);
   color c = getCol();

   push();
   stroke(c);
   fill(c);
   translate(x, y);
   switch(b) {
   case 0:
     line(-l/2, 0, l/2, 0);
     addP(x-l/2, y, x+l/2, y, c);
     circle(-l/2, 0, s);
     circle(l/2, 0, s);
     break;

   case 1:
     line(0, -l/2, 0, l/2);
     addP(x, y-l/2, x, y+l/2, c);
     circle(0, -l/2, s);
     circle(0, l/2, s);
     break;
   }
   pop();
 }
}

void addP(float x1, float y1, float x2, float y2, color c) {
 if (x1 == x2) {
   for (float i = y1; i <= y2; i ++) {
     particles.add(new Particle(x1, i, c));
   }
 }

 if (y1 == y2) {
   for (float i = x1; i <= x2; i ++) {
     particles.add(new Particle(i, y1, c));
   }
 }
}


void mousePressed() {
 newParticle();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#028ee0, #ffcf39, #d066e8, #e31608, #00a676};
//int[] colors = {#000000};
int getCol() {
 return colors[(int)random(colors.length)];
}

class Particle {
 PVector pos;
 float step;
 float lifeSpan;
 color col ;
 float angle;
 float noiseScale, noiseStrength;
 Particle(float x, float y, color col) {
   pos = new PVector(x, y);
   step = 1;
   angle = random(10);
   lifeSpan = 100;
   noiseScale = 100;
   noiseStrength = 200;
   //noiseScale = 300;
   //noiseStrength = 10;
   this.col = col;
 }

 void show() {
   noStroke();
   fill(col, lifeSpan);
   circle(pos.x, pos.y, 0.7);
 }

 void move() {
   angle = noise(pos.x/noiseScale, pos.y/noiseScale) * noiseStrength;
   pos.x += cos(angle) * step;
   pos.y += sin(angle) * step;
   lifeSpan -= 0.5;
 }

 boolean isDead() {
   if (lifeSpan < 0.0) {
     return true;
   } else {
     return false;
   }
 }

 void run() {
   show();
   //move();
 }
}
