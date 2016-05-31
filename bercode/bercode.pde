//bercode
void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  draw_bercode(0, 0);
}

void draw_bercode(int flag, int num) {
  if (num>40) {
    return;
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(-90*(num/10)));
  if (num%10==0) {
    noFill();
  } else if (num%2==0) {
    fill(255);
  } else {
    fill(0);
  }
  stroke(125);
  rect((-1)*width/2, (-1)*height/2, width*pow(0.5, num%10), height/2);
  popMatrix();
  draw_bercode(num/10, num+1);
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "bercode.png" );
  }
}

