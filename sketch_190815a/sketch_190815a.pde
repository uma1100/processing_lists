void setup() {
 size(900, 900);
 //noLoop();
}

void draw() {
 background(255);
 form();
 save("generation.png");

 PImage img = loadImage("generation.png");

 ArrayList<PImage> piece = new ArrayList<PImage>();
 int wCount = int(random(2, 10));
 int hCount = int(random(2, 10));
 float w = width/wCount;
 float h = height/hCount;

 for (int j = 0; j < hCount; j++) {
   for (int i = 0; i < wCount; i++) {
     int x = int(i*w);
     int y = int(j*h);
     int ww = int(w);
     int hh = int(h);
     PImage pimg = img.get(x, y, ww, hh);

     piece.add(pimg);
   }
 }

 int c = 0;
 int toggle = 0;
 for (int j = 0; j < hCount; j++) {
   for (int i = 0; i < wCount; i++) {
     PImage p = piece.get(c);
     
     if (toggle == 0) {
       p.filter(INVERT);
     }

     image(p, i*w, j*h, w, h);
     
     c++;
     if (toggle == 0)toggle = 1;
     else toggle = 0;
   }
 }
 
 
 
 if(frameCount == 100)exit();
 saveFrame("output/####.png");
}

void form() {
 for (int i=0; i<300; i++) {
   fill(getCol());
   noStroke();
   circle(random(width), random(height), random(random(random(500))));
 }
}

void mousePressed() {
 redraw();
}

int[] colors = {#390099 ,#9e0059 ,#ff0054 ,#ff5400 ,#ffbd00};
int getCol() {
 return colors[(int)random(colors.length)];
}
