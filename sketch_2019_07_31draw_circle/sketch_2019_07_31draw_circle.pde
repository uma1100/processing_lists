void setup() {
 size(840, 840);
 pixelDensity(2);
 noLoop();
}

void draw() {
 background(#404040);
 tileRec(10, 10, width-20, height-20);
}

void tileRec(float x_, float y_, float w_, float h_) {
 int tileCountW = (int)random(2, 4);
 int tileCountH = (int)random(2, 4);
 float tileW = w_/tileCountW;
 float tileH = h_/tileCountH;

 for (float x = x_; x < x_ + w_ -1; x += tileW) {
   for (float y = y_; y < y_ + h_ - 1; y += tileH) {
     if (random(1) < 0.5 && tileW > 100) {
       tileRec(x, y, tileW, tileH);
     } else {
       form(x, y, tileW, tileH);
     }
   }
 }
}

void form(float x_, float y_, float w_, float h_) {
 noFill();
 fill(getCol());
 strokeWeight(3);
 stroke(#404040);
 rect(x_, y_, w_, h_);

 float off = 0.8;
 fill(getCol());
 noStroke();
 rect(x_+(w_*(1-off))/2, y_+(h_*(1-off))/2, w_*off, h_*off, random(20));


 fill(getCol());
 circle(x_+w_/2, y_+h_/2, 10);
}

void mousePressed() {
 redraw();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}

//int[] colors = {#FF7079, #5EB9FF, #ffffff, #404040};
int[] colors = {#ffffff, #404040};
int getCol() {
 return colors[(int)random(colors.length)];
}
