void setup(){
  size(800,800);
  frameRate(60);
  background(0);
  noStroke();
}

void draw(){
  float x = random(0,width);
  float y = random(0,height);
  float dist = dist(x,y,width/2,height/2);
  float diameter = 30 - dist/10.0;
  
  if(diameter > 0){
    fill(63,127,255);
    ellipse(x,y,diameter,diameter);
  }
  //saveFrame("frames/######.tif");
}
