class robot{
  
  float xco;
  float yco;
  color lichaamkleur;
  color vierkant;
  float size;
  float x;
  float bx;
  float by;
  float angle;
  int direction;
  int boxSize;
  int radius;
  
  
  robot(){ // default constructor
    xco = 0;
    yco = 0;
    lichaamkleur = color(230);
    vierkant = color(255,0,0);
    size = 1;
    x = 375;
    bx = 400;
    by = 100;
    angle = 0.0;
    direction = 1;
    boxSize = 200;
    radius = 10;
  }
  
void tekening() {
  ellipseMode(CENTER);
  strokeWeight(4);
  fill(230);
  
  //bewegende armen
  x += 1.5 * direction;
  if ((x > 450) || (x < 375)) {
    direction = -direction;
  }

  
  
  //lichaam
  rect(185+xco,x-40+yco,150,80);
  rect(665+xco,x-40+yco,150,80);
  rect(325+xco,x-50+yco,60,100);
  rect(615+xco,x-50+yco,60,100);
  rect(400+xco,545+yco,60,200);
  rect(540+xco,545+yco,60,200);
  rect(375+xco,300+yco,250,250);

  ellipse(170+xco,x+yco,50,100);
  ellipse(800+xco,x+yco,50,100);

  arc(430+xco,760+yco,100,100,-PI,0);
  arc(570+xco,760+yco,100,100,-PI,0);
  
  //draaiend vierkant
  push();
  translate(1000/2+xco,430+yco);
  rotate(angle);
  strokeWeight(10);
  fill(vierkant);
  rect(-70,-70,140,140);
  angle+=0.1;
  pop();
  
  line(380+xco,760+yco,480+xco,760+yco);
  line(520+xco,760+yco,620+xco,760+yco);
  
  //ogen
  ellipseMode(RADIUS);
    fill(230);
    rect(bx+xco, by+yco, boxSize, boxSize);
    fill(255);
  ellipse(bx+xco+50,yco+by+50,20,20);
  ellipse(bx+xco+150,yco+by+50,20,20);
    fill(0);
  ellipse(bx+xco+50,yco+by+50,radius,radius);
  ellipse(bx+xco+150,yco+by+50,radius,radius);
    fill(0,0,255);

  //kogel
  push();
  image(images[nummer],xco + 800 + myvijand.bulletX-25, yco + x -25 ,50,50);
  pop();

}
void muisgedrukt() { //ogen groter worden
  if (mousePressed == true ){
    radius++;
  
  if (radius == 100){
    radius = 10;
    }
  }
}

void loslaten() { //ogen verkleinen
  if (mousePressed == false ) {
  radius = 10;
  }
}

void bewegenschieten() { //bewegen
  if ((keyPressed == true) && (key == CODED)) {
    if (keyCode == UP){
     yco = yco-10;
     if ( yco < -300){
       yco = -300;
     }
    } 
    else if (keyCode == DOWN ) {
      yco = yco+10;
       if ( yco > 450){
       yco = 450;
     }
    } 
    else if (keyCode == LEFT ){
      xco = xco-10;
       if ( xco < -350){
       xco = -350;
     }
    } 
    else if (keyCode == RIGHT) {
      xco = xco+10;
       if (xco > 200){
       xco = 200;
        }
      }
    }
  }
}
