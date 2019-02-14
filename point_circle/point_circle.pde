ArrayList<Circle> pCircles = new ArrayList<Circle>();

void setup(){
  size(500, 500);
}

float a = 0;
float s = 0.02;
float r = 200;
float x;
float y;
float circles = 5;

void draw(){
  background(#1f3134);
  
  noFill();
  stroke(#eb6ea5);
  strokeWeight(10);
  ellipse(150, width/2, r, r);
  
  for (Circle c : pCircles){
    c.display(1, 0); 
  }
  
  x = 150;
  y = 250;
  for (int n = 1; n <= circles; n += 2){
    x = x + (r/2.5) * fourierX(a, n);
    y = y + (r/2.5) * fourierY(a, n);
  
    noFill();
    strokeWeight(5);
    stroke(#ebf6f7);
    ellipse(x, y, r/(n+2), r/(n+2));
    
    if (n == circles){
      Circle newCircle = new Circle();
      newCircle.x = x;
      newCircle.y = y;
      pCircles.add(newCircle);
      if (pCircles.size() - 1 == 200){
        pCircles.remove(0); 
      }
    }
  }
  
  for (int i = pCircles.size() - 1; i >= 0; i--){
      pCircles.get(i).display(2, 500 - i);
  }
  
  stroke(255);
  strokeWeight(2);
  line(pCircles.get(pCircles.size() - 1).x, pCircles.get(pCircles.size() - 1).y, 500 - pCircles.size(), pCircles.get(pCircles.size() - 1).y);
  
  a = a + s;
}

float fourierX(float number, float n){
  return ((4 * sin(n * number) / (n * PI)));
}
float fourierY(float number, float n){
  return ((4 * cos(n * number) / (n * PI)));
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP){
      pCircles = new ArrayList<Circle>();
      circles += 2; 
    } else if (keyCode == DOWN){
      if (circles > 1){
        pCircles = new ArrayList<Circle>();
        circles -= 2; 
      }
    }
  }
}

class Circle {
  float x;
  float y;
  void display(int type, int pos){
   noStroke();
   fill(#FFC300);
   if (type == 1){
     ellipse(x, y, 5, 5);
   } else if (type == 2){
     ellipse(pos, y, 5, 5); 
   }
  }
}
