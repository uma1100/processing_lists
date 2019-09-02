void setup() {
 size(840, 840);
 pixelDensity(2);
 rectMode(CENTER);
 noLoop();
}

void draw() {
 tile();
}

void tile() {
 int count = 8;
 float w = width/count;
 int toggle = 0;

 noFill();
 noStroke();

 for (int j = 0; j < count; j++) {
   for (int i = 0; i < count; i++) {
     if (toggle == 0) {
       fill(#FFD464);
     } else {
       fill(#1253A4);
     }

     square(i*w + w/2, j*w + w/2, w);

     if (toggle == 0) {
       stroke(#1253A4);
       fill(#F26964);
       //fill(#F1F0EE);
     } else {
       stroke(#FFD464);
       fill(255);
       //fill(#F26964);
     }

     randomShape(i*w + w/2, j*w + w/2, w);

     if (toggle == 0)toggle = 1;
     else toggle = 0;
   }
 }
}

void randomShape(float x, float y, float s) {
 float hs = s * 0.5;
 float cs = s * 0.1;
 float angle = (int)random(4) * HALF_PI;
 int b = (int)random(7);
 push();
 translate(x, y);
 rotate(angle);
 if (b == 0) {
   for (int i = 0; i < 4; i ++) {
     rotate(HALF_PI);
     line(cs, cs, hs, hs);
   }
   circle(0, 0, cs);
 } else if (b == 1) {
   circle(0, 0, cs);

   line(0, cs, 0, hs);

   noFill();
   arc(0, 0, hs, hs, radians(110), TAU + radians(70));
 } else if (b == 2) {
   circle(0, 0, cs);

   noFill();
   beginShape();
   vertex(0, hs);
   vertex(0, hs/2);
   vertex(hs/2, 0);
   vertex(0, -hs/2);
   vertex(-hs/2, 0);
   vertex(-cs, 0);
   endShape();
 } else if (b == 3) {
   line(-hs + cs, -hs, hs, hs - cs);
   line(-hs, -hs + cs, hs - cs, hs);

   circle(hs/2*cos(-PI/4), hs/2*sin(-PI/4), cs);

   noFill();
   arc(0, 0, hs, hs, - radians(25), TAU - radians(65));
 } else if (b == 4) {
   circle(-hs/2, 0, cs);
   circle(hs/2, 0, cs);

   noFill();
   arc(-hs/2, 0, hs, hs, -PI, 0);
   arc(hs/2, 0, hs, hs, 0, PI);
 } else if (b == 5) {
   for (float i = -hs + s/5; i < hs; i += s/5) {
     float l = random(-hs+cs);
     line(i, hs, i, l);
     circle(i, l, cs);
   }
 } else {
   float ss = hs * 0.5;
   float sss = ss - cs;
   for (int i = 0; i < 4; i ++) {
     rotate(HALF_PI);
     line(-ss + cs, -ss, ss - cs, -ss);
     circle(-ss, -ss, cs);
   }
   line(-sss, -sss, sss, sss);
   line(sss, -sss, -sss, sss);
 }
 pop();
}


void mousePressed() {
 redraw();
}

void keyPressed() {
 if (key == 's')saveFrame("####.png");
}
