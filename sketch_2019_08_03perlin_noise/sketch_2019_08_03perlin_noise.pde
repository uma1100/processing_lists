ArrayList<Particle> particles;
int n = 2000;

void setup() {
 size(800, 800);
 pixelDensity(2);
 colorMode(HSB, 360, 100, 100, 100);
 
 newParticles();
}

void draw() {
 for(Particle p: particles){
   p.run();
 }
}

void newParticles() {
 particles = new ArrayList<Particle>();
 
 blendMode(ADD);
 
 background(0);
 for (int i = 0; i < n; i ++) {
   particles.add(new Particle());
 }
 
 noiseSeed((int)random(100000));
}

void mousePressed() {
 newParticles();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

//---------------------------------------------------------

class Particle {
 PVector pos;
 float step;
 color col ;
 float angle;
 float noiseScale, noiseStrength;
 float noiseZ;
 float radius = 250;
 Particle() {
   pos = new PVector(random(width), random(height));
   step = 1;
   angle = random(10);
   noiseScale = 800;
   noiseStrength = 90;
   noiseZ = 0;
 }

 void show() {
   noStroke();
   //fill(map(noise(angle), 0, 1, 140, 300), 60, 60, 15);
   fill(map(noise(angle), 0, 1, 0, 300), 60, 60, 15);
   //fill(map(noise(angle), 0, 1, 0, 100), 60, 60, 15);
   //fill(map(noise(angle), 0, 1, 210, 360), 60, 60, 15);
   circle(pos.x, pos.y, 1);
 }

 void move() {
   if (inCircle()) {
     angle = noise(pos.x/noiseScale, pos.y/noiseScale, noiseZ) * noiseStrength;
   } else {
     angle = noise(pos.x/noiseScale, pos.y/noiseScale) * noiseStrength;
   }
   pos.x += cos(angle) * step;
   pos.y += sin(angle) * step;
   noiseZ += 0.001;
 }

 boolean inCircle() {
   if (dist(pos.x, pos.y, width/2, height/2) < radius) {
     return true;
   } else {
     return false;
   }

   //if (dist(pos.x, pos.y, width/2, height/2) < radius) {
   //  return false;
   //} else {
   //  return true;
   //}
 }

 void hitWall() {
   if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
     pos = new PVector(random(width), random(height));
   }
 }

 void run() {
   show();
   move();
   hitWall();
 }
}
