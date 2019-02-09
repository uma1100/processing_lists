import processing.video.*;
Capture cam;
float scanHeight;
float scanSpeed;

void setup(){
  size(853,480);
  frameRate(60);
  noStroke();
  cam = new Capture(this); // camera setup
  cam.start();
  
  scanHeight = 0.0;
  scanSpeed = 2.0;
  background(0);
}

void draw(){
  for(int i = 0; i < width; i++){
    color col = cam.get(i, int(scanHeight));
    fill(col);
    rect(i, scanHeight, 1, scanSpeed); // 四角形で色を設定
  }
  
  if(scanHeight > height){
    scanHeight = 0.0;
  }
}

void captureEvent(Capture C){
  cam.read();
  scanHeight += scanSpeed;
}
