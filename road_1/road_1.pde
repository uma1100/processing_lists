void setup() {
  size(600,1000);
  int max = 600;
  float m = 200;
  noStroke();
  background(255);
  rectMode(CENTER);
  for(int i=0; i<1000;i++){
    float x=random(0,max); 
    float y=random(height);
    float rectsize=random(y/10);
    fill(random(0,200),random(0,127),random(0,255),50);
    ellipse(x,y,rectsize, rectsize);
  }
  //  for(int i=0; i<1000;i++){
  //    float x=random(0,max/2);
  //    float y=random(0,height);
  //    float ellipsesize=random(y/10);
  //    fill(random(0,200),random(0,127),random(0,255),127);
  //    ellipse(x,y,ellipsesize,ellipsesize);
      
  //}
}

void mousePressed(){
  saveFrame("frames/###.png");
}
