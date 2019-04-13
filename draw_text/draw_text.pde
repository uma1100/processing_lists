import http.requests.*;

String URL = "https://script.google.com/macros/s/AKfycbwgxWGLVp1RHV-1PLjer2xAPLfwVE0mY-I8fCXOTmjJbVZBEJ7e/exec";
String lineData[] = null;
String result = null;
String before = null;
void setup(){
  size(500,200);
  background(255);
  
  PFont font = createFont("Menlo",64,true);
  textFont(font);
  
  textSize(32);
  
  fill(0);

}

void draw(){
  delay(1000);
  background(255);
  fill(0);
  GetRequest get = new GetRequest(URL);
  get.send();
  result = get.getContent();
  println(before);
  if(result == null){
    result = " ";
  }
  if(result.equals(before)){
    result = "同じ";
    println(result);
  }
  text(result, 10, height/2);
  before = result;
}
