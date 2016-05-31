//octps
PFont myfont;
void setup() {
  size(500, 500);
  myfont = createFont("MS Gothic", 48, true);
  textFont(myfont);
}

void draw() {
  background(255);
  face(width/2, height/3, width/2, 0);
}

void face(float posx, float posy, float r, float num) {
  if (5-num<3) {
    return;
  }
  noFill();
  strokeWeight(5-num);
  arc(posx, posy, r, r, PI*3/4, PI*9/4);
  ko(posx-r/4, posy, 0, num+1);
  ko(posx+r/4, posy, 0, num+1);
  ta_l(posx-r/2, posy+r/4, 0, 5, num+1);
  ta_l(posx-r/2+(50/(num+1)), posy+r/4, 0, 1, num+1);
  ta_l(posx-r/2+(100/(num+1)), posy+r/4, 0, 1, num+1);
  ta_r(posx+r/3, posy+r/4, 0, 6, num+1);
  ta_r(posx+r/3, posy+r/4, 5, 6, num+1);
  noFill();
  strokeWeight(4-num);
  arc(posx, posy+r/5, r/4, r/4, PI*3/4, PI*9/4);
  face(posx, posy+r/5, r/4, num+1);
}

void ta_l(float posx, float posy, float num, float fin, float s) {
  if (num>fin) {
    return;
  }
  pushMatrix();
  translate(posx, posy);
  rotate(radians(30*num));
  textAlign(LEFT, TOP);
  fill(0);
  textSize((400-4*num)/(4*s));
  text("タ", 0, 0);
  popMatrix();
  ta_l(posx+5, posy, num+1, fin, s);
}

void ta_r(float posx, float posy, float num, float fin, float s) {
  if (num>fin) {
    return;
  }
  pushMatrix();
  translate(posx, posy);
  rotate(radians(30*num-180));
  textAlign(LEFT, TOP);
  fill(0);
  textSize((400-4*num)/(4*s));
  scale(-1, 1);
  text("タ", 0, 0);
  popMatrix();
  ta_r(posx+5, posy, num+1, fin, s);
}

void ko(float posx, float posy, float num, float s) {
  if (num>4) {
    return;
  }
  pushMatrix();
  translate(posx, posy);
  rotate(radians(90*num));
  textAlign(RIGHT, BOTTOM);
  fill(0);
  textSize((40-2*num)/(s*2));
  text("コ", 0, 0);
  popMatrix();
  if (num%4==0) {
    ko(posx-(36/(s*2)), posy, num+1, s);
  } else if (num%4==1) {
    ko(posx, posy-(36/(s*2)), num+1, s);
  } else if (num%4==2) {
    ko(posx+(36/(s*2)), posy, num+1, s);
  } else if (num%4==3) {
    ko(posx, posy+(34/(s*2)), num+1, s);
  }
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "octps.png" );
  }
}

