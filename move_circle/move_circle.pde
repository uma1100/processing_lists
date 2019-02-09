float diameter;
float hue;
void setup(){
  size(800,500);
  noStroke();
  frameRate(60);
  colorMode(HSB,360,100,100,100);
}
void draw(){
  background(0);
  diameter = 400 + sin(frameCount * 0.1) * 200;
  hue = sin(frameCount * 0.1) * 120;
  fill(hue,100,100);
    ellipse(width/2,height/2,diameter,diameter);
}
