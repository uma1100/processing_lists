
PVector velocity;
PVector velocity_be;
PVector location;
PVector location_be;
void setup() {
  size(800, 600);
  frameRate(60);
  location = new PVector(width/2, height/2);
  velocity = new PVector();
  location_be = new PVector(width/2, height/2);
  velocity_be = new PVector();
  background(0);
}
 
void draw() {
  velocity.x = random(-1, 1);
  velocity.y = random(-1, 1);
  location.add(velocity);
  noStroke();
  strokeWeight(10);
  fill(0, 127, 255);
  ellipse(location.x, location.y, 2, 2);
  
  location_be = location;
  //fill(255,0,0);
  ellipse(location_be.x, location_be.y,3,3);
}
//void draw() {
//  //velocity.x = random(-1, 1);
//  //velocity.y = random(-1, 1);
//  //location.add(velocity);
//  //noStroke();
//  //fill(0, 127, 255);

//}
