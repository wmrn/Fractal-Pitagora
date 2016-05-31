//cateye
void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  draw_cateye(width, 0);
}

void draw_cateye(float r, int num) {
  if (r<1) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  if (num%2==0) {
    fill(255);
    stroke(0);
    ellipse(0, 0, r, r/2);
  } else {
    fill(0);
    stroke(255);
    ellipse(0, 0, r/2, r);
  }
  popMatrix();
  draw_cateye(r/2, num+1);
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "cateye.png" );
  }
}

