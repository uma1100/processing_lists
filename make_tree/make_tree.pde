//分岐回数
int step = 10;

float tr_scale;
float tr_angle;
float tr_length;
float tr_startd;
float tr_startx;
float tr_starty;
float triangle;
float offset = -90;

void setup () {

    size (1200, 1000);
    colorMode (RGB, 256);
    background (255);

    tr_scale = 0.99;
    tr_angle = 24.0;
    tr_length = 180.0;
    tr_startd = 0.0;
    tr_startx = width / 2;
    tr_starty = height;
    triangle = 45;

    createTree (tr_startx, tr_starty, tr_length, tr_startd, step);

}

void draw () {

    fade ();

        //createTree (random (0, width), tr_starty, random (tr_length), tr_startd, step);

    noLoop();

}

void mousePressed(){
  saveFrame("frames/######.png");
}
void createTree (float x01, float y01, float len, float deg, int n) {

    stroke (int (200 / (n + 1)));
    strokeWeight (int ((n + 1) / 4));

    //枝の始点（x01,y01）から枝の終点（x02,y02)を計算
    float x02 = x01 + len * cos (radians (deg + offset));
    float y02 = y01 + len * sin (radians (deg + offset));

    line (x01, y01, x02, y02);

    if (n > 0) {

        //枝1本につき新しい枝が2本作られる

        //1本目
        //次に伸びる枝の角度をランダムに
        float deg01 = random (-tr_angle, triangle);
        //次に伸びる枝の長さをランダムに（だんだん短く）
        float scl01 = random (random (10, 20), len * tr_scale);
        //現在の終点を次の始点として、新しい角度、長さで自分を再実行
        createTree (x02, y02, scl01, deg + deg01, n - 1);

         //2本目
        //次に伸びる枝の角度をランダムに
        float deg02 = random (-tr_angle, triangle);
        //次に伸びる枝の長さをランダムに（だんだん短く）
        //現在の終点を次の始点として、新しい角度、長さで自分を再実行
        float scl02 = random (random (10, 20), len * tr_scale);
        createTree (x02, y02, scl02, deg + deg02, n - 1);

    }

    //count = n;

}

void fade () {

    noStroke ();
    fill (255, 2);
    rectMode (CORNER);

    rect (0, 0, width, height);

}
