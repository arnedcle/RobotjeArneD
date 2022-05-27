// bewegen met de pijltjes
// schieten met spatie of met de knop van de arduino
// 10 levens

robot myrobot;
vijand myvijand;
Timer myTimer;

import processing.sound.*;
import processing.serial.*;
SoundFile gunshot;
SoundFile muziekje;

PImage achtergrond;
PImage vrouw;

Serial myPort;
char val;

  int b;
  float bx;
  float by;
  float angle = 0.0;
  int boxSize = 200;
  boolean overBox = false;
  boolean locked = false;
  float xOffset = 0.0; 
  float yOffset = 0.0; 
  int radius = 10;
  int radius2 = 40;
  float x = 375;
  float speed = 1;
  int direction = 1;
  float xco =0;
  float yco =0;
  int s = 1;
  int score = 0;
  int levens = 9;
  float bulletX = 0;
  float bulletY = 0;
  boolean schiet = false;
  boolean bullet = true;
  float vijandX = 2000;
  float vijandY= 500;
  boolean vijand = true;
  float temperatuur;

void setup() {
  size(2000, 1000);
  achtergrond = loadImage("hangaar.jpg");
  vrouw = loadImage("vrouw.jpg");
  
  println(Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  
  gunshot = new SoundFile(this, "gunshot.wav");
  muziekje = new SoundFile(this, "muziekje.wav");
  muziekje.play();
  
  myrobot = new robot ();
  myvijand = new vijand ();
  myTimer = new Timer(100);
  
  String url = "http://api.openweathermap.org/data/2.5/weather?q=Antwerpen,be&appid=80bb45745fad93410447e2ac0b16c781";
  JSONObject json = loadJSONObject(url);
  JSONObject main = json.getJSONObject("main");
  temperatuur = main.getInt("temp") -272.15;
}

void draw() {
  image (achtergrond, 0, 0);
  myrobot.tekening();
  myrobot.muisgedrukt();
  myrobot.loslaten();
  myrobot.bewegenschieten();
  myvijand.lichaam();
  myTimer.countDown();
  
  //text
  fill(0, 0, 255);
  textAlign(RIGHT);
  textSize(50);
  fill(0, 0, 255);
  text("Tijd: " + int(myTimer.getTime()), 1900, 50);
  fill(0, 255, 127);
  text("Score: " + score , 1900, 100);
  fill(255, 0, 0);
  text("Levens: " + levens , 1900, 150);
  fill(255,255,0);
  text("temperatuur Antwerpen:  "+ round(temperatuur)+"°C",1900,200);
  
  //kogel
  push();
  fill(230);
  stroke(230);
  ellipse(xco + 800 + bulletX ,yco + x + bulletY, 15 , 15 );
  pop();
  
  //als je dood gaat
  if (myTimer.getTime() <=0 || levens <= 0){
    background(250,0,0);
    textSize(300);
    fill(0);
    textAlign(CENTER);
    text("Game Over",1000,400);
    text("jouw score: " +  score,1000,800);
    vijand = false;
  }
  //schieten
  if (keyPressed == true && key ==' '){
    schiet = true;
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
  }
  //arduino
   if ( myPort.available() > 0) {
    val = myPort.readChar();
    if(val=='a'){
      schiet = true;
    }
   }
}  
