import processing.sound.*;
AudioIn in;
FFT fft;
int bands = 128;
float scale = 4000.0;

void setup(){
  size(1000,800,P2D);
  noStroke();
  blendMode(ADD);
  colorMode(HSB,360,100,100,100);
  in = new AudioIn(this, 0);
  in.start();
  fft = new FFT(this, bands);
  fft.input(in);
}

void draw(){
  background(0);
  fft.analyze();
  float w = width/float(bands)/2.0;
  
  for(int i = 0; i < bands; i++){
    // 色の明るさに変換
    float hue = 360/float(bands) * i;
    fill(hue,100,6);
    float diameter = fft.spectrum[i] * scale;
    ellipse(width/2.0 + i * w, height/2.0,diameter,diameter);
    ellipse(width/2.0 - i * w, height/2.0,diameter,diameter);
  }
}
