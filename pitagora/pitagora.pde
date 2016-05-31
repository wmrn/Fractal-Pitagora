//pitagora
import gifAnimation.*;
GifMaker gifMaker;
import fisica.*;
FWorld world;
FBox go;//1.go
FCircle ball;//2.ball
FBox [] arrow = new FBox [3];//←→
int aflag=0;
FBox [] next = new FBox [3];//swit
FBox [] tile = new FBox [3];//タイル
int [] tc = new int [3];
int mrad;
FBox [] mtile = new FBox [2];//monokuro
FPoly y = new FPoly();//y of you
FBox [] ou = new FBox [5];//ou of you
int ouflag;
FPoly stripe = new FPoly();//stripe
FBox fooled;//fooled
float frad=0;
FCircle [] b = new FCircle [25];//sball
FBox [] tall = new FBox [2];//tall
int th=100;
int [] num= new int [300];
int tflag;
float facerad;
int faceradup=4;
int springup=1;
int spring=10;
int backnum;//back
int fin;
PFont font;
PImage  [] img = new PImage [3];


void setup() {
  size(768, 432);
  Fisica.init(this);
  world = new FWorld();
  world.setEdges(LEFT);
  font =loadFont("HGPSoeiPresenceEB-48.vlw");
  img[0] = loadImage("b.png");
  img[1] = loadImage("3Dball_l.png");
  img[2] = loadImage("3Dball_r.png");
  img[0].resize(51, 51);
  img[1].resize(110, 110);
  img[2].resize(110, 110);
  textFont(font);
  textAlign(LEFT, TOP);
  gifMaker = new GifMaker(this, "pitagora.gif");
  gifMaker.setRepeat(0); 
  gifMaker.setDelay(20);


  ball = new FCircle(50);//2.ball   
  ball.setPosition( 42, -26 );
  ball.setRestitution(1.0);
  ball.setStatic(true);
  world.add(ball);

  for (int i=0; i<2; i++) {//←→
    arrow[i]=new FBox(120, 5);
    arrow[i].setStatic(true);
    arrow[i].setPosition(130, 77.5-5-30*i);
    arrow[i].setFill(255);
    world.add(arrow[i]);
  }
  arrow[2]=new FBox(120, 5);
  arrow[2].setStatic(true);
  arrow[2].setPosition(130, 132.5-5);
  arrow[2].setFill(255);
  world.add(arrow[2]);

  next[0]= new FBox(10, 5);//next
  next[0].setPosition(130, 122.5);
  next[0].setStatic(true);
  next[0].setFill(76);
  next[1] = new FBox(10, 5);
  next[1].setPosition(370-65+25, 145+165-2.5 ); 
  next[1].setStatic(true);
  next[1].setFill(76);
  next[2] = new FBox(5, 10);
  next[2].setPosition(370-65+40+2.5, 145+165-5-20);
  next[2].setStatic(true);
  next[2].setFill(76);
  world.add(next[0]);
  world.add(next[1]);
  world.add(next[2]);

  tile[0]= new FBox(30, 5);//Did
  tile[0].setStatic(true);
  tile[0].setRotation(radians(13));
  tile[0].setStroke(255);
  tile[0].setPosition(42-15, 255+20+5+2.5);
  tile[1]= new FBox(20, 5);
  tile[1].setStatic(true);
  tile[1].setRotation(radians(7));
  tile[1].setStroke(255);
  tile[1].setPosition(159-7, 310+25+2.5);
  tile[2]= new FBox(50, 5);
  tile[2].setStatic(true);
  tile[2].setRotation(radians(16));
  tile[2].setStroke(255);
  tile[2].setPosition(254-20, 281-4);
  for (int i=0; i<3; i++) {
    tc[i]=255;
  }
  world.add(tile[0]);
  world.add(tile[1]);
  world.add(tile[2]);

  mtile[0] = new FBox(2, 110);//monokuro
  mtile[0].setStatic(true);
  mtile[0].setPosition(420+55, 65+55);
  mtile[1] = new FBox(2, 110);
  mtile[1].setStatic(true);
  mtile[1].setPosition(420+55, 65+55);
  world.add(mtile[0]);
  world.add(mtile[1]);

  for (int i=0; i<25; i++) {//sball
    b[i] = new FCircle(15);
    b[i].setStatic(true);  
    b[i].setPosition(390+15*(i%5), 35+15*(i/5) );
    b[i].setRestitution(0.5);
    world.add(b[i]);
  }

  y.vertex(0, 0);//y
  y.vertex(0, 50);
  y.vertex(45, 50);
  y.vertex(45, 165);//
  y.vertex(5, 165);
  y.vertex(5, 160);
  y.vertex(0, 160);
  y.vertex(0, 170);
  y.vertex(50, 170);//
  y.vertex(50, 0);
  y.vertex(45, 0);
  y.vertex(45, 45);
  y.vertex(5, 45);
  y.vertex(5, 0);
  y.vertex(0, 0);
  y.setStatic(true);
  y.setPosition(370-65, 145);
  world.add(y);


  ou[0]= new FBox(35, 35);//ou
  ou[0].setStatic(true);
  ou[0].setPosition(370+20, 145+20+5);
  ou[1]= new FBox(5, 50);
  ou[1].setStatic(true);
  ou[1].setPosition(370+50+5, 145+20+5);
  ou[2]= new FBox(35, 40);
  ou[2].setStatic(true);
  ou[2].setPosition(370+80+10+2.5, 145+20);
  ou[3]= new FBox(5, 60);
  ou[3].setStatic(true);
  ou[3].setPosition(370+130, 145+20+10);
  world.add(ou[0]);
  world.add(ou[1]);
  world.add(ou[2]);
  world.add(ou[3]);

  stripe.vertex(0, 25/3);//stripe
  stripe.vertex(120.5, 10.5);
  stripe.vertex(120.5, 25*2/3);
  stripe.vertex(0, 25*2/3);
  stripe.vertex(0, 25/3);
  stripe.setStatic(true);
  stripe.setPosition(width-410, height-225);
  world.add(stripe);

  fooled = new FBox(200, 120);//fooled
  fooled.setStatic(true);
  fooled.setPosition(width-200, height-120);
  fooled.setFill(125);
  world.add(fooled);

  tall[0] = new FBox(20, 100);//tall
  tall[0].setStatic(true);
  tall[0].setPosition(width-80+10, height-50);
  tall[1] = new FBox(20, 100);
  tall[1].setStatic(true);
  tall[1].setPosition(width-80+60, height-50);
  world.add(tall[0]);
  world.add(tall[1]);
  for (int i=0; i<300; i++) {
    if (i<100) {
      num[i]=100-i;
    } else {
      num[i]=0;
    }
  }
}

void draw() {
  background(255);
  if (fin!=0) {
    for (int i=height*4; i>0; i-=100) {
      star(width-45, 70, i, backnum);
      backnum++;
    }
    if (frameCount%70==0) {
      backnum++;
    }
  }
  back(fin);
  if (ouflag!=0) {//ou
    if (frameCount%70<=15) {
      if (fin==0) {
        fill(45);
        y.setFill(0);
      } else {
        fill(20, 20, 255);
        y.setFill(20, 20, 255);
      }
      rect(370-15+3, 145, 145/2-5-3, 60);
      rect(370-15+72, 145, 145/2-5, 60);
      rect(500-20, 205, 20, 5);
    }
  }
  world.step();
  world.draw();

  if (go!=null) {//go
    textSize(30);
    if (fin!=0) {
      fill(255, 0, 0);
    } else {
      fill(0);
    }
    text("go!", go.getX()-18, go.getY()-11);
    if (arrow[1].getY()-go.getY()<=17.5) {
      arrow[1].setStatic(false);
    }
    if (arrow[0].getY()-arrow[1].getY()<=5) {
      arrow[0].setStatic(false);
    }
  }
  arrow[2].setPosition(130, 132.5-5);

  if (ball!=null) {
    bfill(ball.getX(), ball.getY());//ballfill

    if (ball.isTouchingBody(tile[0])==true) {
      aflag=1;
    }
    if (ball.isTouchingBody(tile[1])==true) {      
      aflag=2;
    }
    if (ball.isTouchingBody(tile[2])==true) {      
      aflag=3;
    }
  }

  for (int i=1; i<4; i++) {//Did
    if (aflag==i) {
      tc[i-1]-=30;
      tile[i-1].setStroke(tc[i-1]);
    }
  }
  tile[0].setRotation(radians(13));
  tile[0].setPosition(42-15, 255+20+5+2.5);
  tile[1].setRotation(radians(7));
  tile[1].setPosition(159-7, 310+25+2.5);
  tile[2].setRotation(radians(5));
  tile[2].setPosition(254-20, 281-4);

  next[0].setPosition(130, 122.5);//next
  next[1].setPosition(370-65+25, 145+165-2.5 );
  next[2].setPosition(370-65+40+2.5, 145+165-5-20);
  if (next[0].isTouchingBody(arrow[0])==true) {
    next[0].setHeight(2);
    ball.setStatic(false);
  }
  if (next[1].isTouchingBody(ball)==true && next[2].isTouchingBody(ball)==true) {
    next[1].setHeight(2);
    next[2].setWidth(2);
    aflag=4;
  }
  if (fin!=0) {
    for (int i=0; i<3; i++) {
      next[i].setFill(255, 0, 0);
    }
  }

  mtile[0].setPosition(420, 65);//monokuro
  mtile[1].setPosition(420, 65);
  mtile[0].setRotation(radians(mrad));
  mtile[1].setRotation(radians(-1*(mrad)));
  pushMatrix();
  translate(420, 65);  
  rotate(radians(45+mrad));  
  image(img[1], -55, -55);
  rotate(radians(-2*mrad)); 
  image(img[2], -55, -55);
  popMatrix();
  if (aflag==4) {
    if (mrad<90) {
      mrad++;
    }
    for (int i=0; i< 25; i++) {
      b[i].setStatic(false);
      ouflag=1;
    } 
    if (frad<195) { 
      frad+=2.5;
    }
  }

  y.setPosition(370-65, 145);//you
  y.setFill(255);
  ou[0].setPosition(370+20, 145+20+5);
  ou[1].setPosition(370+50+5, 145+20+5);
  ou[2].setPosition(370+80+10+2.5, 145+20);
  ou[3].setPosition(370+130, 145+20+10);

  stripe.setPosition(width-410, height-225);//stripe
  pushMatrix();
  translate(stripe.getX(), stripe.getY());
  fill(0);
  noStroke();
  for (int i=0; i<6; i++) {
    if (i==0) {
      beginShape();
      vertex(0, 25/3+0.2*i);
      vertex(i*22+11-4, 25/3+0.2*i+0.6);
      vertex(i*22+11-4, 25*2/3);
      vertex(0, 25*2/3);
      endShape();
    } else {
      beginShape();
      vertex(i*22-4, 25/3+0.2*i);
      vertex(i*22+11-4, 25/3+0.2*i+0.6);
      vertex(i*22+11-4, 25*2/3);
      vertex(i*22-4, 25*2/3);
      endShape();
    }
  }
  popMatrix();

  fooled.setPosition(width-200, height-120);//fooled
  fooled.setRotation(radians(frad));
  pushMatrix();
  translate(width-200, height-120);
  rotate(radians(frad));
  fool(0, 0);
  popMatrix();


  tall[0].setPosition(width-80+10, height-th/2);//tall
  tall[1].setPosition(width-80+60, height-th/2);
  tall[0].setHeight(th);
  tall[1].setHeight(th);
  pushMatrix();
  translate(width-80, height);
  if (tflag!=0) {
    if (th<300) {
      if (num[th-1]!=0) {
        num[th]=num[th-1]-1;
      }
      th++;
    } else if (th==300) {
      tflag=2;
      fin=1;
      face(35, -th+70, facerad, spring);
      if (facerad>45) {
        faceradup=-faceradup;
      } else if (facerad<-45) {
        faceradup=-faceradup;
      }
      if (spring>40) {
        springup=-springup;
      } else if (spring<10) {
        springup=-springup;
      }
      facerad+=faceradup;
      spring+=springup;
    }
  } 
  stroke(0);
  fill(255);
  rect(0, 0, 70, -th);
  for (int i=0; i<th; i++) {
    tallloop(-i, num[i], fin);
    if (num[i]>280) {
      num[i]=0;
    } else {
      if (tflag==0) {
        num[i]++;
      } else if (tflag==1) {
        num[i]+=2;
      } else if (tflag==2) {
        num[i]++;
      }
    }
  }
  popMatrix();
  int count=0;
  for (int i=0; i<25; i++) {
    if (width-80+26<=b[i].getX() && b[i].getX()<width-80+44) {
      count++;
    }
  }
  if (count>10) {
    tflag=1;
  }
  /*gifMaker.addFrame();
   if (fin!=0 && frameCount>3000) {
   println(frameCount);
   gifMaker.finish(); 
   exit();
   }*/
}


void keyPressed() {
  if (go==null && key==' ') {
    go = new FBox(50, 30);
    go.setPosition(130, 0);
    world.add(go);
  }
}

void bfill(float posx, float posy) {
  noFill();
  stroke(0);
  image(img[0], posx-25, posy-25);
  ellipse(posx, posy, 50, 50);
}

void back(int fin) {//背景  
  stroke(0);//←→
  strokeWeight(4);
  arrow2(70, 77.5-5-2.5-30);
  arrow1(70, 77.5-5-2.5);
  arrow2(70, 130-5);

  textSize(200);//Did
  fill(0);
  text("Did", 30, height-180);
  if (fin==0) {
    fill(255);
  } else {
    noFill();
  }
  noStroke();
  ellipse(42, 255, 50, 50);
  ellipse(159, 310, 50, 50);
  ellipse(254, 253, 50, 50);

  strokeWeight(1);//monokuro
  pushMatrix();
  translate(420, 65);
  for (int i=0; i<10; i++) {
    for (int j=0; j<26; j++) {
      if ((j+13*i)%2==0) {
        fill(0);
      } else {
        noFill();
      }
      rect(-65+i*13, -65+j*5, 13, 5);
    }
  }  
  popMatrix();

  pushMatrix();//stripe
  translate(width-410, height-225);
  for (int i=0; i<11; i++) {
    if (i%2==0) {
      fill(0);
    } else {
      noFill();
    }
    rect(i*11, 0, 11, 25);
  }
  popMatrix();
}

void arrow1(float posx, float posy) {
  pushMatrix();
  translate(posx, posy);
  line(0, 2.5, 15, -15+2.5);
  line(0, 2.5, 15, 15+2.5);
  line(120, 2.5, 120-15, -15+2.5);
  line(120, 2.5, 120-15, 15+2.5);
  popMatrix();
}

void arrow2(float posx, float posy) {
  pushMatrix();
  translate(posx, posy);
  line(0, 2.5, -15, -15+2.5);
  line(0, 2.5, -15, 15+2.5);
  line(120, 2.5, 120+15, -15+2.5);
  line(120, 2.5, 120+15, 15+2.5);
  popMatrix();
}

void fool(float posx, float posy) {
  pushMatrix();
  //-100,-60
  //translate(+47, +62);
  translate(posx, posy);
  rotate(radians(180));
  scale(0.5);
  //noFill();
  //rect(0,0,306,116);
  stroke(0);
  line(10+47-200, 2-60, 10+47-200, 48+2-60);//f
  stroke(255);
  line(10+47-200, 48+2-60, 47-200, 48+2-60);
  stroke(0);
  line(47-200, 48+2-60, 47-200, 68+2-60);
  line(47-200, 68+2-60, 10+47-200, 68+2-60);
  line(10+47-200, 68+2-60, 10+47-200, 116+2-60);
  line(10+47-200, 116+2-60, 23+47-200, 116+2-60);
  stroke(255);
  line(23+47-200, 116+2-60, 23+47-200, 68+2-60);
  stroke(0);
  line(23+47-200, 68+2-60, 33+47-200, 68+2-60);
  stroke(255);
  line(33+47-200, 68+2-60, 33+47-200, 48+2-60);
  line(33+47-200, 48+2-60, 23+47-200, 48+2-60);
  line(23+47-200, 48+2-60, 23+47-200, 15+2-60);
  stroke(0);
  line(23+47-200, 15+2-60, 40+47-200, 15+2-60);
  stroke(255);
  line(40+47-200, 15+2-60, 40+47-200, 2-60);
  line(40+47-200, 0+2-60, 10+47-200, 2-60);

  stroke(255);
  line(43+47-200, 58+2-60, 83+47-200, 58+2-60);//o
  line(83+47-200, 58+2-60, 83+47-200, 116+2-60);
  stroke(0);
  line(83+47-200, 116+2-60, 43+47-200, 116+2-60);
  line(43+47-200, 116+2-60, 43+47-200, 58+2-60);
  line(56+47-200, 71+2-60, 70+47-200, 71+2-60);
  line(70+47-200, 71+2-60, 70+47-200, 103+2-60);
  stroke(255);
  line(70+47-200, 103+2-60, 56+47-200, 103+2-60);
  line(56+47-200, 103+2-60, 56+47-200, 71+2-60);
  stroke(255);
  line(93+47-200, 58+2-60, 133+47-200, 58+2-60);//o
  line(133+47-200, 58+2-60, 133+47-200, 116+2-60);
  stroke(0);
  line(133+47-200, 116+2-60, 93+47-200, 116+2-60);
  line(93+47-200, 116+2-60, 93+47-200, 58+2-60);
  line(106+47-200, 71+2-60, 120+47-200, 71+2-60);
  line(120+47-200, 71+2-60, 120+47-200, 103+2-60);
  stroke(255);
  line(120+47-200, 103+2-60, 106+47-200, 103+2-60);
  line(106+47-200, 103+2-60, 106+47-200, 71+2-60);

  stroke(255);
  line(143+47-200, 0+2-60, 156+47-200, 2-60);//l
  line(156+47-200, 0+2-60, 156+47-200, 116+2-60);
  stroke(0);
  line(156+47-200, 116+2-60, 143+47-200, 116+2-60);
  line(143+47-200, 116+2-60, 143+47-200, 2-60);

  stroke(0);
  line(166+47-200, 58+2-60, 166+47-200, 116+2-60);//e
  line(166+47-200, 116+2-60, 206+47-200, 116+2-60);
  stroke(255);
  line(206+47-200, 116+2-60, 206+47-200, 106+2-60);
  line(206+47-200, 106+2-60, 179+47-200, 106+2-60);
  line(179+47-200, 106+2-60, 179+47-200, 93+2-60);
  stroke(0);
  line(179+47-200, 93+2-60, 206+47-200, 93+2-60);
  stroke(255);
  line(206+47-200, 93+2-60, 206+47-200, 58+2-60);
  line(206+47-200, 58+2-60, 166+47-200, 58+2-60);
  stroke(0);
  line(179+47-200, 71+2-60, 197+47-200, 71+2-60);//□
  line(197+47-200, 71+2-60, 197+47-200, 80+2-60);
  stroke(255);
  line(197+47-200, 80+2-60, 179+47-200, 80+2-60);
  line(179+47-200, 80+2-60, 179+47-200, 71+2-60);

  stroke(0);
  line(216+47-200, 58+2-60, 216+47-200, 116+2-60);//d
  line(216+47-200, 116+2-60, 256+47-200, 116+2-60);
  stroke(255);
  line(256+47-200, 116+2-60, 256+47-200, 2-60);
  line(256+47-200, 2-60, 243+47-200, 2-60);
  stroke(0);
  line(243+47-200, 2-60, 243+47-200, 58+2-60);
  stroke(255);
  line(243+47-200, 58+2-60, 216+47-200, 58+2-60);
  stroke(255);
  line(227+47-200, 71+2-60, 227+47-200, 103+2-60);//
  line(227+47-200, 103+2-60, 243+47-200, 103+2-60);
  stroke(0);
  line(243+47-200, 103+2-60, 243+47-200, 71+2-60);
  line(243+47-200, 71+2-60, 227+47-200, 71+2-60);

  stroke(0);
  line(266+47-200, 0+2-60, 266+47-200, 14+2-60);//?
  line(266+47-200, 14+2-60, 292+47-200, 14+2-60);
  line(292+47-200, 14+2-60, 292+47-200, 44+2-60);
  stroke(255);
  line(292+47-200, 44+2-60, 279+47-200, 44+2-60);
  stroke(0);
  line(279+47-200, 44+2-60, 279+47-200, 89+2-60);//44.5
  line(279+47-200, 89+2-60, 293+47-200, 89+2-60);//
  stroke(255);
  line(293+47-200, 89+2-60, 293+47-200, 58+2-60);
  stroke(0);
  line(293+47-200, 58+2-60, 306+47-200, 58+2-60);
  stroke(255);
  line(306+47-200, 58+2-60, 306+47-200, 2-60);//58
  line(306+47-200, 0+2-60, 266+47-200, 2-60);
  stroke(0);  
  line(279+47-200, 102+2-60, 279+47-200, 116+2-60);//□
  line(279+47-200, 116+2-60, 293+47-200, 116+2-60);
  stroke(255);
  line(293+47-200, 116+2-60, 293+47-200, 102+2-60);
  line(293+47-200, 102+2-60, 279+47-200, 102+2-60);
  popMatrix();
}

void tallloop(int posy, int num, int fin) {//tall
  if (num/70==0) {
    if (fin==0) {
      stroke(76);
    } else {
      stroke(255, 0, 0);
    }
    line(0, posy, num%70, posy);
  } else if (num/70==1) {
    if (fin==0) {
      stroke(76);
    } else {
      stroke(255, 0, 0);
    }
    line(num%70, posy, 70, posy);
  } else if (num/70==2) {
    if (fin==0) {
      stroke(28);
    } else {
      stroke(0, 0, 255);
    }
    line(0, posy, num%70, posy);
  } else if (num/70==3) {
    if (fin==0) {
      stroke(28);
    } else {
      stroke(0, 0, 255);
    }
    line(num%70, posy, 70, posy);
  }
}

void face(int posx, int posy, float rad, int spring) {
  stroke(0);
  noFill();
  for (int i=0; i<7; i++) {
    arc(posx, posy-(spring/2)*i, 50, spring, PI*7/6, PI*17/6);
  }
  fill(255, 255, 0);
  ellipse(posx, posy-(spring/2)*7, 60, 60);
  pushMatrix();
  translate(posx, posy-(spring/2)*7);
  rotate(radians(rad));
  tongue(0, 10);
  popMatrix();
  fill(255, 255, 0);
  arc(posx, posy-(spring/2)*7, 50, 30, radians(10), radians(170));  
  fill(255);
  ellipse(posx-15, posy-5-(spring/2)*7, 15, 15);
  ellipse(posx+15, posy-5-(spring/2)*7, 15, 15);
  fill(0);
  ellipse(posx-15, posy-5-(spring/2)*7, 5, 5);
  ellipse(posx+15, posy-5-(spring/2)*7, 5, 5);
}

void tongue(int posx, int posy) {
  fill(230, 10, 30);
  rect(posx-10, posy, 20, 20);
  arc(posx, posy+19, 20, 20, 0, PI);
  line(posx, posy, posx, posy+25);
}

void star(int posx, int posy, int R_out, int num) {//back
  float R, x, y;
  pushMatrix();
  translate(posx, posy);
  beginShape();
  noStroke();
  strokeWeight(3);
  if (num%2==0) {
    fill(255, 0, 0);
  } else {
    fill(255, 255, 0);
  }
  for (int i = 0; i < 20; i++) {
    if (i%2 == 0) {
      R = R_out;
    } else {
      R = R_out/2;
    }
    x = R * cos(radians(360/20 * i));
    y = R * sin(radians(360/20 * i));
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}

