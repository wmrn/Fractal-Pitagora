//tiintikkz
import gifAnimation.*;
GifMaker gifMaker;
float x, y, r;
void setup() {
  size(500, 500);
  x=width/2.0;
  y=height/2.0;
  r=500.0;
  gifMaker = new GifMaker(this, "tiintikkz.gif");
  gifMaker.setRepeat(0);
  gifMaker.setDelay(20);
}

void draw() {
  background(0);
  pushMatrix();
  translate(x, y); 
  mark(0, 0, r);
  popMatrix();
  y-=5.0;
  r+=15.0;
  gifMaker.addFrame();
  if (r/4>width) {
    gifMaker.finish();
    exit();
  }
}

void mark(float posx, float posy, float r) {
  if (r<1) {
    return;
  }
  pushMatrix();
  translate(posx, posy);
  stroke(255-r/4);
  fill(255);
  ellipse(0, 0, r, r);
  fill(255-r/2);
  arc(0, 0, r, r, PI/2, PI*3/2);
  arc(0, r/4, r/2, r/2, -PI/2, PI/2);
  fill(255);
  arc(0, -r/4, r/2, r/2, PI/2, PI*3/2);
  ellipse(0, -r/4, r/4, r/4);
  ellipse(0, r/4, r/4, r/4);
  popMatrix();
  mark(posx, posy-r/4, r/4);
  mark(posx, posy+r/4, r/4);
}

