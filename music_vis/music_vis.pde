import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup()
{
size(640,480,P2D);
minim=new Minim(this);
player=minim.loadFile("music.mp3");
player.play();
}

void draw()
{
background(0);
stroke(255);
for(int i =0; i < player.bufferSize()-1; i++)
{
float x1 = map(i,0,player.bufferSize(),0,width);
float x2 = map(i+1, 0,player.bufferSize(),0,width);
float y1 = height / 3;
float y2 = height / 3 * 2;
line( x1,y1+player.left.get(i)*100,x2,y1+player.left.get(i+1)*100);
line( x1,y2+player.right.get(i)*100,x2,y2+player.right.get(i+1)*100);
}
}
