
void setup() {
  size(750, 600);
  noFill();
  noLoop();
}

void draw() {
  background(250);
  strokeWeight(5);
  rect(25, 25, width-50, height-50);
  divideRect(25, 25, width-50, height-50, 15);
}

//クリックで新しく描画する
void mousePressed() {
  redraw();
}

//スペースキーで保存
void keyPressed() {
  if (key == 's') {
    saveFrame("####.png");
  }
}

//(x座標, y座標, 幅, 高さ, 再帰回数)
void divideRect(float x, float y, float w, float h, int n) {
  float randw = random(w); 
  float randh = random(h); 
  strokeWeight(1);
  strokeCap(SQUARE);
  if (n>0) {
    n--;
    //幅が高さよりも大きい場合
    if (w>h) {
      line(x+randw, y, x+randw, y+h);    //縦に線を引く
      //再帰
      divideRect(x, y, randw, h, n-1);    //左側の四角形
      divideRect(x+randw, y, w-randw, h, n-1);    //右側の四角形
    }

    //幅が高さよりも小さい場合
    if (w<h) {
      line(x, y+randh, x+w, y+randh);    //横に線を引く
      divideRect(x, y, w, randh, n-1);    //上側の四角形
      divideRect(x, y+randh, w, h-randh, n-1);    //下側の四角形
    }
  }
}
