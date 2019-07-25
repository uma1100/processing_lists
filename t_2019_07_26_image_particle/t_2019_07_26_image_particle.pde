
void setup(){
  size(600,600);
  noStroke();
  fill(0);
  
}

void draw(){
  background(255);
  
  for(int y = 0; y<= width; y += 10){
    for(int x = 0; x<= height; x += 10){
      //// カーソル位置と対象の円との距離を計算
      float d = dist(x,y,mouseX,mouseY);
      //// adjust size
      float sz = d * 0.05;
      
      ellipse(x,y,sz,sz);
    }
  }
}

// save image
void keyPressed() {
 if (key == 's')saveFrame("####.png");
}
