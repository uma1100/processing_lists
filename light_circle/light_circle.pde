void setup(){
  size(600,800,JAVA2D);
  background(0);
  noFill();
 blendMode(SCREEN);
  smooth();
}

int N = 0;
int s_v = 100;
float x_center;
float y_center;
int plus = 100;
float x_axis;
float y_axis;

void draw(){
  x_center = width/2;
  y_center = height/2;
    N = (int)random(4,5);
    for(int i=0; i< N; i++){
      //float rand = random(90,100);
      int rand = 200;
 
      float x_rand = random(-10,10);
      float y_rand = random(-10,10);
      x_axis = x_center + x_rand;
      y_axis = y_center + y_rand;
      stroke(random(200,255),random(0,255),random(0,255));
      for (int j = 1; j < 100; j++) {
   strokeWeight(i);
   stroke(
          map(j, 1, 50, 180, 360),
          80,
          map(j, 1, 50, 15, 1),
          100
          );
   ellipse(x_axis,y_axis,rand,rand);
 }
      //ellipse(x_axis,y_axis,rand,rand);
    };
  noLoop();
}

void mousePressed(){
  saveFrame("frames/red.png");
}
