//circle_cross
void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  en_draw(0, 130, 255);
}

void en(float posx, float posy, float r) {
  noFill();
  ellipse(posx, posy, r, r);
}

void en_draw(float num, float r, float c) {
  if (r<1) {
    return;
  }
  for (int i=0; i<6; i++) {
    stroke(c);
    en(width/2+cos(radians(i*360/6-30*num))*r, height/2+sin(radians(i*360/6-30*num))*r, r*2);
  }
  en_draw(num+1, r*pow(3, 0.5)/2, c-10);
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "circle_cross.png" );
  }
}

