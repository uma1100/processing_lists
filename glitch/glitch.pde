//画像を壊す

PImage myImage;
String sourceImageName = "test.JPG";
String glitchedImageName = "glitchTest6.jpg";

void settings() {
  myImage = loadImage(sourceImageName);
    size(myImage.width, myImage.height, P2D);
    //結果をみるために画面サイズを小さくしてメモリへの負荷を減らす。
}

void setup() {
  background(0);
}

void draw() {
  byte[] data = loadBytes(sourceImageName);

  for(int i = 0; i < frameCount*10; i++) { //iの回数処理をする。回数文バイナリデータを改変する。
    int loc = (int)random(0, data.length); //バイナリデータのうち、ランダムでどれかを選択する
    data[loc] = (byte)120;   //バイナリデータを置き換える
  }
  
  // グリッチ画像を保存。バイナリで保存しているので本来のサイズ。
  saveBytes(glitchedImageName, data);
  // グリッチ画像を読み込んで表示
  myImage = loadImage(glitchedImageName);
  image(myImage, 0, 0, width,height);
  
  saveFrame("frame/gritch-######.png");
}
