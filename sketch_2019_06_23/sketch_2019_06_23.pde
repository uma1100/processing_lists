 import java.util.*;
ArrayList<Particle> particles;
int n = 120;

void setup() {
 size(900, 900);
 pixelDensity(2);
 colorMode(HSB, 360, 100, 100, 100);
 rectMode(CENTER);
 newParticles();
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

void forms() {
 for (int j = 0; j < n; j ++) {
   float x = random(width), y = random(height);
   float s = random(20, 100);
   float hs = s/2;
   color c = getCol();
   noStroke();
   fill(c);
   if (random(1) > 0.5) {
     for (float i = -s/2; i < s/2; i ++) {
       particles.add(new Particle(x+i, y-hs, c));
       particles.add(new Particle(x+i, y+hs, c));
       particles.add(new Particle(x-hs, y+i, c));
       particles.add(new Particle(x+hs, y+i, c));
     }
     square(x, y, s);
   } else {
     for (float a = 0; a < TAU; a += TAU/360) {
       particles.add(new Particle(x+hs*cos(a), y+hs*sin(a), c));
     }
     circle(x, y, s);
   }
 }
}

void newParticles() {
 particles = new ArrayList<Particle>();
 background(#FCFCF0);
 forms();
 noiseSeed((int)random(100000));
}

void mousePressed() {
 newParticles();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#e4572e, #29335c, #f3a712, #a8c686, #669bbc, #efc2f0};
//int[] colors = {#880D1E, #DD2D4A, #F26A8D, #F49CBB, #CBEEF3};
int getCol() {
 return colors[(int)random(colors.length)];
}

//---------------------------------------------------------

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
   noiseScale = 800;
   noiseStrength = 90;
   this.col = col;
 }

 void show() {
   noStroke();
   fill(col, lifeSpan);
   circle(pos.x, pos.y, 0.5);
 }

 void move() {
   angle = noise(pos.x/noiseScale, pos.y/noiseScale) * noiseStrength;
   pos.x += cos(angle) * step;
   pos.y += sin(angle) * step;
   lifeSpan -= 0.1;
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
   move();
 }
}
