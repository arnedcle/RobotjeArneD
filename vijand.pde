class vijand{

  void lichaam(){
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
    //raak?
    if (yco + x + bulletY < vijandY + 75 && yco + x + bulletY > vijandY-75 && xco + 800 + bulletX < vijandX +75 && xco + 800 + bulletX > vijandX-75){
      vijandX = 2000;
      vijandY = random(100,900);
      vijand = true;
      schiet=false;
      bulletX = 0;
      score +=1;
    }
  }
}
