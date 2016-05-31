//leaf
import gifAnimation.*;
GifMaker gifMaker;
float r, rad;
void setup() {
  size(500, 500);
  r=width;
  gifMaker = new GifMaker(this, "leaf.gif");
  gifMaker.setRepeat(0);
  gifMaker.setDelay(20);
}

void draw() {
  background(255, 0, 0);
  draw_eye(r, rad);
  r+=3;
  rad+=(360+45)/(708.0/3);
  gifMaker.addFrame();
  if (r*(1-pow(2, -0.5))*2>width*pow(2, 0.5)) {
    println(frameCount);
    gifMaker.finish();
    exit();
  }
}

void draw_eye(float r, float rad) {
  if (r<1) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(rad));
  fill(0);
  stroke(r/3);
  beginShape();
  vertex(-r/2, r/2);
  bezierVertex(-r/2, -r/16, -r/16, -r/2, r/2, -r/2);
  bezierVertex(r/2, r/16, r/16, r/2, -r/2, r/2);  
  endShape();
  fill((r+50)/3, 0, 0);
  ellipse(0, 0, r*(1-pow(2, -0.5))*2, r*(1-pow(2, -0.5))*2);
  popMatrix();
  draw_eye(r*(1-pow(2, -0.5))*2*pow(2, -0.5), rad-45.0);
}

