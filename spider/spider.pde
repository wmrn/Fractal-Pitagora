//spider
void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  stroke(125);
  draw_tri(width/2, 0);
}

void draw_tri(float l, float num) {
  if (l<0) {
    return;
  }
  if (num%2==0) {
    for (int i=0; i<8; i++) {
      if (i%2==0) {
        pushMatrix();
        translate(width/2, height/2);
        fill(0);
        rotate(radians(45*i));
        triangle(0, 0, 0, -l, l, -l);
        popMatrix();
      } else {
        pushMatrix();
        translate(width/2, height/2);
        fill(255, 0, 0);
        rotate(radians(45*(i+1)));
        triangle(0, 0, 0, -l, -l, -l);
        popMatrix();
      }
    }
  } else {
    for (int i=0; i<8; i++) {
      if (i%2==0) {
        pushMatrix();
        translate(width/2, height/2);
        fill(255, 0, 0);
        rotate(radians(45*i));
        triangle(0, 0, 0, -l, l, -l);
        popMatrix();
      } else {
        pushMatrix();
        translate(width/2, height/2);
        fill(0);
        rotate(radians(45*(i+1)));
        triangle(0, 0, 0, -l, -l, -l);
        popMatrix();
      }
    }
  }
  draw_tri(l-30.0, num+1);
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "spider.png" );
  }
}

