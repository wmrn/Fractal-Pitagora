//ta
PFont myfont;
void setup() {
  size(500, 500);
  myfont = createFont("MS Gothic", 48, true);
  textFont(myfont);
  textAlign(LEFT, TOP);
}

void draw() {
  background(255);
  ta(0, 0, 0);
  stroke(255, 0, 0);
  strokeWeight(8);
  point(width/2, height/2);
}

void ta(float posx, float posy, float num) {
  if (num>11) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(30*num));
  fill(0);
  textSize(100-num);
  text("タ", posx, posy);
  popMatrix();
  ta(posx+5, posy, num+1);
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "ta.png" );
  }
}

