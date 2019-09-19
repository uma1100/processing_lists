ArrayList<PVector>circles; 

void setup() {
 size(900, 900);
 pixelDensity(2);
 noLoop();
 colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
 //background(#1B435D);
 background(#D5EEFF);
 addCircle();
 noStroke();
 for (PVector c : circles) {
   grCircle(c.x, c.y, c.z);
 }
 lines();

 //saveFrame("output/####.png");
 //if (frameCount > 50)exit();
}


void lines() {
 int c = 450;
 strokeWeight(0.6);
 stroke(#1B435D);
 noFill();
 for (int j=0; j<c; j++) {
   float x = map(j, 0, c-1, 0, width);
   float y = 0;
   float px = x;
   float py = y;

   for (int i=0; i<1000; i++) {
     line(x, y, px, py);
     px = x;
     py = y;
     for (int k=0; k<circles.size(); k++) {
       PVector e = circles.get(k);
       float d = dist(x, y, e.x, e.y);
       float ns = 0.0005;
       float angle = noise(x*ns, y*ns, i*ns)*100;

       if (d < e.z/2) {
         x += cos(angle)*2;
       }
     }
     y +=1 ;
   }
 }
}

void addCircle() {
 circles = new ArrayList<PVector>();
 while (circles.size() < 40) {
   float d = 300*(1-random(random(1)));
   PVector c = new PVector(random(width), height*(1-random(random(random(1)))), d);
   boolean overlapping = false;

   for (PVector p : circles) {
     if (dist(c.x, c.y, p.x, p.y) < (c.z + p.z/2)) {
       overlapping = true;
       break;
     }
   }
   if (!overlapping) {
     circles.add(c);
   }
 }
}

void grCircle(float x, float y, float d) {
 int c = 100;
 color col = getCol();
 for (int i=0; i<c; i++) {
   float sat = map(i, 0, c-1, saturation(col), 50);
   float dd = map(i, 0, c-1, d, d*0.4);
   fill(hue(col), sat, brightness(col));
   circle(x, y, dd);
 }
}

void mousePressed() {
 redraw();
 saveFrame("output/####.png");
}

int[] colors = {#DFEFED, #DBDBDB, #BFE9DB, #77AF9C, #5B5B5B, #4072B3};
int getCol() {
 return colors[(int)random(colors.length)];
}
