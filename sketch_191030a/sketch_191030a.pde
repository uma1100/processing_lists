ArrayList<PVector>points = new ArrayList<PVector>();

void setup() {
 size(900, 900);
 pixelDensity(2);
 noLoop();
}

void draw() {
 points = new ArrayList<PVector>();
 background(255);
 rectRec(10, 10, width-20, height-20, 6);
 node();
}

void rectRec(float x, float y, float w, float h, int n) { 
 float sep = random(10, 100);
 noFill();
 stroke(0);
 strokeWeight(0.5);
 rect(x, y, w, h);
 
 addPoints(x+w/2, y+h/2, w, h, sep);

 n--;

 if (n>=0) {
   if (w>=h) {
     float randomW = random(w*0.1, w*0.9);
     
     rectRec(x, y, randomW, h, n);
     rectRec(x+randomW, y, w-randomW, h, n);
   }
   if (w<h) {
     float randomH = random(h*0.1, h*0.9);
     
     rectRec(x, y, w, randomH, n);
     rectRec(x, y+randomH, w, h-randomH, n);
   }
 }
}

void addPoints(float x, float y, float w, float h, float sep) {
 float p = 0.5;
 
 for (float i=x-w/2; i<x+w/2; i+=sep) {    
   if(random(1) < p)points.add(new PVector(i, y+(h/2)));
   if(random(1) < p)points.add(new PVector(i, y-(h/2)));
 }
 
 for (float j=y-h/2; j<y+h/2; j+=sep) {
   if(random(1) < p)points.add(new PVector(x-(w/2), j));
   if(random(1) < p)points.add(new PVector(x+(w/2), j));
 }
}

void node() {
 for (PVector n : points) {
   for (PVector other : points) {
     float d = dist(other.x, other.y, n.x, n.y);
     if (n != other) {
       if (d <= 100) {
         stroke(0, 100);
         strokeWeight(0.1);
         line(other.x, other.y, n.x, n.y);
       }
     }
   }
 }
}

void mousePressed() {
 redraw();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

int[] colors = {};
int getCol() {
 return colors[(int)random(colors.length)];
}
