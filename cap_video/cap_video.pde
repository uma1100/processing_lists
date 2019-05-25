import processing.video.*;
Capture cam;
float scale = 1.0;

public void setup(){
  size(800,500,P3D);
  frameRate(60);
  blendMode(ADD);
  noFill();
  cam = new Capture(this,800,500);
  cam.start();
}

public void draw(){
  background(0);
  strokeWeight(2.0);
  float hStep = 4.0;
  float wStep = 4.0;
  for(float j=0;j<height;j+=hStep){
    beginShape();
    for(float i=0;i<width;i+=wStep){
      color col = cam.get(int(i),int(j));
      float br = brightness(col);
      stroke(col);
      vertex(i,j,br*scale);
    }
    endShape();
  }
}

void captureEvent(Capture c){
  cam.read();
}

void mousePressed(){
  saveFrame("frames/###.png");
}
