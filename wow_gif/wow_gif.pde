//wow.gif.ver
import gifAnimation.*;
GifMaker gifMaker;
int a;
void setup() {
  size(500, 500);
  a=width*2;
  gifMaker = new GifMaker(this, "wow.gif");
  gifMaker.setRepeat(0);
  gifMaker.setDelay(20);
}

void draw() {
  background(255, 255, 0);
  //fill(255,0,0);
  wow(a, 0);
  a+=5;
  gifMaker.addFrame();
  if (width<=a*0.7*0.7*0.7*0.7+10) {
    gifMaker.finish();
    exit();
  }
}

void wow(float s, float num) {
  if (s<1) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  stroke(255, 0, 0);
  //noFill();
  rotate(radians(20*num));
  for (int i=0; i<9; i++) {
    pushMatrix();
    translate(cos(radians(i*360/9))*s/2, sin(radians(i*360/9))*s/2);
    rotate(radians(40*i));
    arc(0, 0, s/3, s/3, PI*2/3, PI*4/3);
    popMatrix();
  }
  popMatrix();
  wow(s-s*0.3, num+1);
}

