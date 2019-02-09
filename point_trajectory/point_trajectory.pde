final int AMOUNT = 100;

int[] x = new int[AMOUNT];
int[] y = new int[AMOUNT];
int[] z = new int[AMOUNT];

void setup() {
  size(600, 600, P3D);
  background(0);
  noFill();
  stroke(255,50);
  strokeWeight(2);

  for (int i = 0; i < AMOUNT; i++) {
    //x[i] = int(random(-150, 150));
    x[i] = i;
    //y[i] = int(random(-150, 150));
    y[i] = AMOUNT - i;
    z[i] = int(random(-150, 150));
  }

}

void draw() {
  //background(0);

  translate(width/2, height/2);
  rotateY(frameCount / 200.0);

  //box(300);

  for (int i = 0; i < AMOUNT; i++) {
    point(x[i], y[i], z[i]);
  }
}
