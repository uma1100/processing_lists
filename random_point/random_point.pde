float x;
float y;

void setup(){
  size(800,600,P2D);
  frameRate(100);
  background(0);
  
  x = width/2.0;
  y = height/2.0;
  
}

void draw(){
  stroke(255); //point color
  noFill();
  blendMode(ADD);
  point(x,y);
  line(width/2.0,height/2.0,x,y);
  x = x + random(-10,10);
  y = y + random(-10,10);
  //saveFrame("frames/######.tif");
}
