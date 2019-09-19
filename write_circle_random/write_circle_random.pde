void setup(){
  size(600,800,JAVA2D);
  background(206,204,204);
  noFill();
  smooth();
}

int N = 0;
int s_v = 100;
int x_start = s_v;
int y_start = s_v;
int plus = 100;
float x_axis;
float y_axis;

void draw(){
  while(true){
    N = (int)random(1,5);
    N = 2;
    for(int i=0; i< N; i++){
      if(N==1){
        fill(234,244,252,random(100,200));
      }
      //float rand = random(90,100);
      int rand = 95;
      float x_center = x_start;
      float y_center = y_start;
      if(i==0){
        x_axis = x_center;
        y_axis = y_center;
      }else{
        float x_rand = random(-10,10);
        float y_rand = random(-10,10);
        x_axis = x_center + x_rand;
        y_axis = y_center + y_rand;
      }
      stroke(random(200,255),random(0,255),random(0,255));
      ellipse(x_axis,y_axis,rand,rand);
    }
    noFill();
    x_start += plus;
    if(x_start > width-100){
      x_start = s_v;
      y_start += plus;
    }
    if(y_start > height-100){
     //if(y_start > 0){
      break;
    }
  }
  noLoop();
}

void mousePressed(){
  //saveFrame("frames/red.png");
  //draw();
}
