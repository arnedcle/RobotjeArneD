class vijand{
  
  float vijandX;
  float vijandY;
  boolean vijand;
  float vijandsize;
  float bulletX;
  boolean schiet;
  boolean bullet;
  robot myRobot;

  vijand(){ //default constructor
    vijandX = 2000;
    vijandY= 400;
    vijand = false;
    vijandsize = 1;
    bulletX = 0;
    bullet = true;
    schiet = false;
  }
  
  void lichaam(){
    myRobot = new robot();
    //vijand
    fill(255,150,0);
    image(vrouw,vijandX-75, vijandY-75, 150,150);
    if (vijand == true){
      vijandX= vijandX - (0.3*(score+5));
    }
    
    //vijand die te dicht bijkomt
    if (vijandX < 801){
      vijandX = 2000;
      vijandY = random(100,900);
      vijand = true;
      levens-=1;
    }
  }
  
  void schiet(){ //schieten
      if (keyPressed == true && key ==' '){
    schiet = true;
    textx = textx + 5000;
    vijand = true;
  }
  if (schiet == true){
    bulletX = bulletX + 30;
  }
  if (bulletX == 30 ){
    gunshot.play();
  }
  if (bulletX > 1200){
    bulletX = 0;
    schiet = false;
    nummer = int(random(0,3));
    }
  }
  
  void raak(){ //raak?
    if (myrobot.yco + myrobot.x < vijandY + 75 && myrobot.yco + myrobot.x > vijandY-75 && myrobot.xco + 800 + bulletX < vijandX +75 && myrobot.xco + 800 + bulletX > vijandX-75){
    vijandX = 2000;
    vijandY = random(100,900);
    vijand = true;
    schiet = false;
    bulletX = 0;
    score +=1;
    nummer = int(random(0,3));
    }
  }
}
