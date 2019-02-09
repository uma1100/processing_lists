float t;
int r=1;
float temp_t;
float start_y;
float save_t;
float sec_save=second();
float min_save=minute();
float hour_save=hour();
void setup() {
  size(800, 600);
}
void draw() {
  background(51);
  if((mousePressed)&&(r==1)){
    start_y=mouseY;
    r=0;
    save_t=t;
  } else if(mousePressed){
    temp_t=map(mouseY,start_y,height,0,180);
    t=save_t+temp_t;
  }
  rotate(radians(t));
  //second
  sec_save=sec_save%60;
  float save=map(sec_save, 0, 60, 0, 360);
  rotate(radians(save));
  if(floor(sec_save)!=second()){
    if(sec_save>second()){
      sec_save-=0.1;
    } else {
      sec_save+=0.1;
    }
    if(second()==0){
      sec_save+=0.2;
    }
  }
  if((floor(sec_save)==second())&&(sec_save>second())){
    sec_save=second();
  }
  for (int i=59; i>-1; i--) {
    rotate(radians(360/60));
    textSize(50);
    if (i==second()) {
      fill(255);
    } else {
      fill(150);
    }
    if (i/10<1) {
      text(i, 750, 50);
    } else {
      text(i, 725, 50);
    }
  }
  rotate(radians(-(save)));
  //minute
  min_save=min_save%60;
  save=map(min_save, 0, 60, 0, 360);
  if(floor(min_save)!=minute()){
    if(min_save>minute()){
      min_save-=0.1;
    } else {
      min_save+=0.1;
    }
    if(minute()==0){
      min_save+=0.2;
    }
  }
  if((floor(min_save)==minute())&&(min_save>minute())){
    min_save=minute();
  }
  rotate(radians(save));
  for (int i=59; i>-1; i--) {
    rotate(radians(360/60));
    textSize(50);
    if (i==minute()) {
      fill(255);
    } else {
      fill(150);
    }
    if (i/10<1) {
      text(i, 675, 50);
    } else {
      text(i, 650, 50);
    }
  }
  rotate(radians(-(save)));
  fill(255);
  text(":", 712, 45);
  //hour
  hour_save=hour_save%24;
  save=map(hour_save, 0, 24, 0, 360);
  if(floor(hour_save)!=hour()){
    if(hour_save>hour()){
      hour_save-=0.1;
    } else {
      hour_save+=0.1;
    }
    if(hour()==0){
      hour_save+=0.2;
    }
  }
  if((floor(hour_save)==hour())&&(hour_save>hour())){
    hour_save=hour();
  }
  rotate(radians(save));
  for (int i=23; i>-1; i--) {
    rotate(radians(360/24));
    textSize(50);
    if (i==hour()) {
      fill(255);
    } else {
      fill(150);
    }
    if (i/10<1) {
      text(i, 600, 50);
    } else {
      text(i, 575, 50);
    }
  }
  rotate(radians(-(save)));
  fill(255);
  text(":", 637, 45);
  rotate(radians(-t));
  //normal clock
  stroke(255);
  fill(51);
  strokeWeight(2);
  ellipse(200,200,400,400);
  strokeWeight(1);
  float second_turn=map(second(),0,60,0,360);
  translate(200,200);
  rotate(radians(second_turn));
  line(0,0,0,-180);
  rotate(radians(-second_turn));
  translate(-200,-200);
  strokeWeight(2);
  float temp_sec=second();
  float minute_turn=map(minute()+(temp_sec/60),0,60,0,360);
  translate(200,200);
  rotate(radians(minute_turn));
  line(0,0,0,-160);
  rotate(radians(-minute_turn));
  translate(-200,-200);
  strokeWeight(3);
  float temp_min=minute();
  float hour_turn=map(hour()%12+(temp_min/60),0,12,0,360);
  translate(200,200);
  rotate(radians(hour_turn));
  line(0,0,0,-120);
  rotate(radians(-hour_turn));
  strokeWeight(1);
  //edges
  for(int i=0;i<60;i++){
    rotate(radians(i*(360/60)));
    if(i%15==0){strokeWeight(3);line(0,-200,0,-170);}
    if(i%5==0){strokeWeight(2);line(0,-200,0,-180);}
    strokeWeight(1);
    line(0,-200,0,-190);
    rotate(radians(-(i*(360/60))));
  }
  strokeWeight(1);
  rotate(radians(0));
  translate(-200,-200);
  //saveFrame("frames/####.png");
}
void mouseReleased() {
  r=1;
}
