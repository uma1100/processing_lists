PImage img;
PImage copy_img;

int copy_x;
int copy_y;
int copy_w = 1000; //元画像の横幅
int copy_h = 1;
float copy_d;

void setup() {
  size(1000,1000);

  img = loadImage("test.png");
  image(img, 0, 0);

  for (int i = 0; i < height / copy_h; i++) {
    copy_y = i * copy_h;
    copy_d = random(-30, 30);

    copy_img = img.get(copy_x, copy_y, copy_w, copy_h);

    fill(0);
    noStroke();
    rect(0, copy_y, width, copy_h);
    image(copy_img, copy_x + copy_d, copy_y);
  }
}
