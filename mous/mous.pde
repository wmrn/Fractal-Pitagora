//mous
void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  mous(width/2, height/2+100, 150);
}

void mous(float posx, float posy, float l) {
  if (l<50) {
    return;
  } 
  noFill();
  ellipse(posx, posy, l-10, l-10);
  ellipse(posx+(l*3/4)*pow(2, -0.5), posy-(l*3/4)/pow(2, 0.5), l/2+10, l/2+10);
  ellipse(posx-(l*3/4)*pow(2, -0.5), posy-(l*3/4)*pow(2, -0.5), l/2+10, l/2+10);
  mous(posx+(l*3/4)*pow(2, -0.5), posy-(l*3/4)/pow(2, 0.5), l/2+20);
  mous(posx-(l*3/4)*pow(2, -0.5), posy-(l*3/4)/pow(2, 0.5), l/2+20);
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "mous.png" );
  }
}
