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

  int score = 0;
  int levens = 9;
  int textx = 0;
  
  float temperatuur;
  PImage[] images;
  PImage theekop;
  PImage theelepel;
  PImage bord;
  int nummer;
  

void setup() {
  size(2000, 1000);
  achtergrond = loadImage("interieur.jpg");
  vrouw = loadImage("vrouw.jpg");
  images = new PImage[3];
  images[0]=loadImage("theekop.jpg");
  images[1]=loadImage("theelepel.jpg");
  images[2]=loadImage("bord.jpg");
  nummer = int(random(0,3));
  
  //println(Serial.list());
  //String portName = Serial.list()[2];
  //myPort = new Serial(this, portName, 9600);
  
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
  myvijand.schiet();
  myvijand.raak();
  
  push();
    textSize(40);
    fill(255);
    text("Je hebt de taart van de boze oma opgegeten. Gelukkig ligt haar oud servies op tafel om te je beschermen.",1800,800+textx);
    text("Je moet haar 75 keer raken voor ze dood is. Doe dit voor de tijd uitloopt of voor ze 10 keer te dichtbij komt.",1800,850+textx);
    text("bewegen doe je met de pijltjes en schieten doe je met spatiebalk of de drukknop op de arduino.",1700,900+textx);
    text("good luck, press 'spacebar' to start",1200,950+textx);
  pop();
  
  if (textx==5000){
    myTimer = new Timer(100);
  }
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
  
  //als je dood gaat
  if (myTimer.getTime() <=0 || levens <= 0){
    background(250,0,0);
    textSize(300);
    fill(0);
    textAlign(CENTER);
    text("Game Over",1000,400);
    text("jouw score: " +  score,1000,800);
    myvijand.vijand = false;
  }
  if (score >= 70){
    background(0,0,255);
    textSize(100);
    fill(0);
    textAlign(CENTER);
    text("Proficiat, je hebt de oma verslagen!",1000,400);
  }
  //arduino
  // if ( myPort.available() > 0) {
    //val = myPort.readChar();
    //if(val=='a'){
      //schiet = true;
    //}
   //}
}  
