ArrayList<Particle> particles;
ArrayList <PVector> points;

void setup() {
 size(840, 840);
 pixelDensity(2);
 
 newParticles();
}

void draw() {
 background(20);
 for (Particle p : particles) {
   p.run();
 }
}

void circles() {
 stroke(0);
 points = new ArrayList <PVector>();
 addCircle();
 for (int i = 0; i < points.size(); i++) {
   PVector p = points.get(i);
   int n = (int)p.z * 100;
   color c = getCol();
   for (int j = 0; j < n; j ++) {
     float a = random(TAU);
     float r = sqrt(random(1));
     float xx = p.x + p.z/2*r*cos(a);
     float yy = p.y + p.z/2*r*sin(a);
     particles.add(new Particle(xx, yy, c));
   }
 }
}


void addCircle() {
 while (points.size() < 500) {
   float d = random(100);
   PVector c = new PVector(random(width), random(height), d);
   boolean overlapping = false;

   for (PVector p : points) {
     if (dist(c.x, c.y, p.x, p.y) < (c.z + p.z/2)) {
       overlapping = true;
       break;
     }
   }
   if (!overlapping) {
     points.add(c);
   }
 }
}

void newParticles() {
 particles = new ArrayList<Particle>();
 noiseSeed((int)random(100000));
 circles();
}


void mousePressed() {
 newParticles();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {#25283d ,#8f3985 ,#98dfea ,#07beb8 ,#F8FF40};
//int[] colors = {#fb3640, #605f5e, #1d3461, #1f487e, #247ba0};

int getCol() {
 return colors[(int)random(colors.length)];
}

//---------------------------------------------------------

class Particle {
 PVector pos;
 float step;
 color col ;
 float angle;
 float noiseScale, noiseStrength;
 float noiseZ, noiseStep;
 float radius = 250;

 Particle(float x, float y, color col) {
   pos = new PVector(x, y);
   step = 1;
   angle = random(10);
   noiseScale = 800;
   noiseStrength = 90;
   noiseZ = 0;
   noiseStep = 0.0005;
   this.col = col;
 }

 void show() {
   noStroke();
   fill(col);
   circle(pos.x, pos.y, 0.5);
 }

 void move() {
   angle = noise(pos.x/noiseScale, pos.y/noiseScale) * noiseStrength;

   pos.x += cos(angle) * step;
   pos.y += sin(angle) * step;
   noiseZ += noiseStep;
 }

 void run() {
   show();
   move();
 }
}
