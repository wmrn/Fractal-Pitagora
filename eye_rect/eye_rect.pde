//eye_rect
void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  draw_eye(width, 0);
}

void draw_eye(float r, float rad) {
  if (r<1) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(rad));
  noFill();
  rect(-r/2, -r/2, r, r);
  arc(r/2, r/2, r*2, r*2, PI, PI*3/2);
  arc(-r/2, -r/2, r*2, r*2, 0, PI/2);
  ellipse(0, 0, r*(1-pow(2, -0.5))*2, r*(1-pow(2, -0.5))*2);
  popMatrix();
  draw_eye(r*(1-pow(2, -0.5))*2*pow(2, -0.5), rad+45.0);
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "eye_rect .png" );
  }
}

