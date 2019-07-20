int actRandomSeed = 0;
int num = 22;
float[] x = new float[num]; 
float[] y = new float[num];
float rectSize;

void setup() {
  size(800, 800);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);

  for (int i = 0; i < num; i ++) {
    x[i] = map(i, 0, num, 0, width);
    y[i] = map(i, 0, num, 0, height);
  }

  rectSize = (width/num) - 5;
}

void draw() {
  randomSeed(actRandomSeed);
  background(210, 100, 70);
  drawCircles();
  drawRects();
  tile();
  drawCircles();
}

void drawCircles() {
  beginShape(QUAD_STRIP);
  for (int i = 0; i < 10; i ++) {
    float d = random(150);
    int iX = (int)random(0, num-1);
    int iY = (int)random(0, num-1);
    stroke(360);
    fill(randomColor());
    ellipse(x[iX] + rectSize/2, y[iY] + rectSize/2, d, d);
    fill(randomColor(), 80);
    ellipse(x[iX] + rectSize/2, y[iY] + rectSize/2, d*0.8, d*0.8);

    if (random(1) > 0.5) {
      noFill();
      vertex(x[iX] + rectSize/2, y[iY]+ rectSize/2);
    }
  }
  endShape();
}

void drawRects() {
  float side = 5;
  for (int i = 0; i < 50; i ++) {
    int iX = (int)random(0, num-1);
    int iY = (int)random(0, num-1);
    noFill();
    fill(randomColor(), 80);
    stroke(360);
    rect(x[iX] + rectSize/2, y[iY]+ rectSize/2, (rectSize+5) * (int)random(-side, side), (rectSize + 5) * (int)random(-side, side));
  }
}

void tile() {
  for (int j = 0; j < num; j ++) {
    for (int i = 0; i < num; i ++) {
      if (random(1) > 0.5) {
        fill(randomColor(), 10);
        stroke(360);
        rect(x[i], y[j], rectSize, rectSize);
      }
      fill(randomColor());
      noStroke();
      if (random(1) > 0.5) {
        fill(360);
        ellipse(x[i] + rectSize/2, y[j] + rectSize/2, 5, 5);
      }
    }
  }
}

void drawShape(float posX, float posY, float size) {
  float halfSize = size/2;
  pushMatrix();
  translate(posX + halfSize, posY + halfSize);
  popMatrix();
}

color randomColor() {
  float r = random(1);

  if (r > 0.83) return color(0, 0, 0);
  else if (r > 0.66) return color(255, 255, 255);
  else if (r > 0.50) return color(98, 100, 100);
  else if (r > 0.34) return color(186, 100, 100);
  else if (r > 0.18) return color(308, 100, 100);
  else return color(0, 0);
}

void mousePressed() {
  actRandomSeed = (int)random(100000);

  for (int i = 0; i < num; i ++) {
    x[i] = map(i, 0, num, 0, width);
    y[i] = map(i, 0, num, 0, height);
  }
}

void keyPressed() {
  if (key == 's')saveFrame("####.png");
}
