void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  
  int sc = second();
  int mn = minute();
  int hr = hour();
  
  textSize(30);
  strokeWeight(1);
  fill(255);
  textAlign(CENTER, CENTER);
  text(hr + ":" + mn + ":" + sc, 300, 30);
  strokeWeight(4);
  noFill();
  stroke(255);
  ellipse(300, 300, 450, 450);
  
  pushMatrix();
  translate(300, 300);
  fill(255, 100, 255);
  strokeWeight(30);
  noFill();
  stroke(186, 222, 252);
  arc(0, 0, 380, 380, -HALF_PI, radians(sc * 6 + 1) - HALF_PI);
  stroke(102, 237, 255);
  arc(0, 0, 240, 240, -HALF_PI, radians(mn * 6 + 1) - HALF_PI);
  stroke(230, 255, 183);
  arc(0, 0, 100, 100, -HALF_PI, radians(hr * 15 + 1) - HALF_PI);
  popMatrix();
  saveFrame("frames/####.png");
  if (frameCount >= 200) {
    exit();
  }
}
