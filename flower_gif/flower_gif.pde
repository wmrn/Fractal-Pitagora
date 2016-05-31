//flower.gif.ver
import gifAnimation.*;
GifMaker gifMaker;
int a;
void setup() {
  size(500, 500);
  a=width;
  gifMaker = new GifMaker(this, "flower.gif");
  gifMaker.setRepeat(0);
  gifMaker.setDelay(20);
}

void draw() {
  background(255);
  flower(a, 0);
  a+=5;
  gifMaker.addFrame();
  if (width<=a*0.7*0.7*0.7*0.7) {
    gifMaker.finish();
    exit();
  }
}

void flower(float s, float num) {
  if (s<1) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(10*num));
  for (int i=0; i<9; i++) {
    ellipse(cos(radians(i*360/9))*s/2, sin(radians(i*360/9))*s/2, s/3, s/3);
  }
  ellipse(0, 0, s, s);
  popMatrix();
  flower(s-s*0.3, num+1);
}

