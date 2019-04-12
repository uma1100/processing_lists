var nmobiles=4000;
var mobiles=[];
var noisescale;
var a1, a2, a3, a4, a5, amax;
var bw=true;
function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  noFill();  
  colorMode(HSB, 360, 255, 255, 255);
  strokeWeight(.1);
  reset();
}
function reset() {
  noisescale=random(.01, .1);
  noiseDetail(int(random(1,5)));
  amax=random(5);
  a1=random(1, amax);
  a2=random(1, amax);
  a3=random(1, amax);
  a4=random(1, amax);
  a5=50;
  for (var i = 0; i < nmobiles; i++) {
    mobiles[i] = new Mobile(i);
  }
}
function draw() {
  //noiseSeed(millis()*.00004);
  for (var i = 0; i < nmobiles; i++) {
    mobiles[i].run();
  }
}
function keyReleased() {
  //if (key=="s" || key=="S")saveCanvas("svimg" + day() + "_" + month() + "_" + hour() + "_" + minute() + "_" + second() + ".jpg");
   if (key=="s" || key=="S")saveCanvas("POSTHELIOS_NOISE3_" + day() + "_" + month() + "_" + hour() + "_" + minute() + "_" + second() + ".png");
 
  if (keyCode==32) reset();
  if(key=="r" || key=="R")setup();
  if(key=="b" || key=="B")bw=!bw;
}

function Mobile(index) {
  this.index=index;
  this.velocity=createVector(0, 0, 0);
  this.acceleration=createVector(0, 0, 0);
  this.position0=createVector(random(0, width), random(0, height), random(0, sin(height)));
  this.position=this.position0.copy();
  this.trans=random(50, 100);
//  this.hu=(noise(a1*sin(PI*this.position.x/width), a1*cos(PI*this.position.y/height))*720)%360;//random(360);
  this.hu=(noise(a1*cos(PI*this.position.x/width), a1*sin(PI*this.position.y/height))*720)%random(360);
  this.sat=noise(a2*sin(PI*this.position.x/width), a2*sin(PI*this.position.y/height))*255;
  this.bri=noise(a3*cos(PI*this.position.x/width), a3*cos(PI*this.position.y/height))*255;
}

Mobile.prototype.run = function() {
  this.update();
  this.display();
};

// Method to update position
Mobile.prototype.update = function() {
  this.velocity=createVector( 1-2*noise(a4+a2*sin(TAU*this.position.x/width), 
                                        a4+a2*sin(TAU*this.position.y/height)), 
                              1-2*noise(a2+a3*cos(TAU*this.position.x/width), 
                                        a4+a3*cos(TAU*this.position.y/height)));
  
  this.velocity.mult(a5);
  //100*fbm(this.position);
  this.velocity.rotate(sin(100)*noise(a4+a3*sin(TAU*this.position.x/width)));
  this.position0=this.position.copy();
  this.position.add(this.velocity);
};

// Method to display
Mobile.prototype.display = function() {
  if(bw)stroke(255,this.trans); else stroke((frameCount*1.8)%360, (millis()%360), (frameCount)%360, this.trans%255);
  //  if(bw)stroke(0,this.trans); else stroke(this.hu,this.sat,this.bri,this.trans);
  
  line(this.position0.x, this.position0.y, this.position.x, this.position.y);
  
  
  if (this.position.x>width || this.position.x<0||this.position.y>height||this.position.y<0) {
    this.position0=createVector(random(0, width), random(0, height),random(0, height*width));
    this.position=this.position0.copy();
  }
};
