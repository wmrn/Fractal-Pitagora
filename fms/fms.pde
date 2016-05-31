//fms
PFont myfont;
void setup() {
  size(500, 500);
  myfont = createFont("MS Gothic", 48, true);
  textFont(myfont);
  textAlign(LEFT, TOP);
}

void draw() {
  background(255);
  pushMatrix();
  translate(30, height/4);
  rotate(radians(-90));
  fill(0);
  int put=0;
  for (int i=0; i<4; i++) {
    textSize(200-17*i);
    text("F", i, 5*(put));
    put=put+(13-i);
  }
  popMatrix();

  pushMatrix();
  translate(30, height/2);
  rotate(radians(-90));
  textSize(100);
  for (int i=0; i<6; i++) {
    text("M", 0, 40*i);
  }
  popMatrix();

  pushMatrix();
  translate(30, height*3/4);
  rotate(radians(-90));
  for (int i=0; i<8; i++) {
    text("S", 0, 30*i);
  }
  popMatrix();
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "fms.png" );
  }
}

