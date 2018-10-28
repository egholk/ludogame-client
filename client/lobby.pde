import processing.net.*; 

class lobby {

  int fadeValue = 255;
  boolean fade = false;
  int rect = 700;
  int connection = 1;
  boolean connected;
  boolean playerLock;
  int playerNumber = 0;
  int player = 0;

  lobby() {
  }

  void startScreen () {
    fill(255, 255, 255, fadeValue);
    rect(0, 0, width, height);
    fill(0, 0, 0, fadeValue);
    textSize(width/15);
    text("LUDO GAME", 300, 150);

    fill(255, 255, 255, fadeValue);
    rectMode(CENTER);
    rect(width/2, height/2, 250, 100);
    rect(width/2, 450, 250, 100);
    fill(0, 0, 0, fadeValue);
    textSize(width/25);
    text("NEW GAME", 395, 315); //375 250 625 350
    text("QUIT GAME", 390, 465); //375 400 625 500
    rectMode(CORNER);
    //sets up the lobby screen

    if (mouseX > 375 && mouseX < 625 && mouseY > 400 && mouseY < 500) {
      if (mousePressed) {
        exit();
      } //if quit game is pressed it quits the game
    }

    if (mouseX > 375 && mouseX < 625 && mouseY > 250 && mouseY < 350) {
      if (mousePressed) {
        newGame = true;
        fill(255);
        rect(0, 0, width, height);
      } //starts the game 
    }
  }

  void makeLobby (int playerss) {
    fill(255, 255, 255, fadeValue);
    rect(0, 0, width, height);
    fill(0, 0, 0, fadeValue);
    textSize(width/15);
    text("LUDO GAME", 300, 150);

    fill(255, 255, 255, fadeValue);
    rect(100, 200, 500, 300);
    rect(rect, 200, 250, 120);
    textSize(width/25);
    fill(0, 0, 0, fadeValue);
    text("CONNECT", 725, 275);
    textSize(width/40);
    text("PLAYERS CONNECTED TO THE SERVER: ", 120, 275);
    
    //Also set up the lobby

    String value = Player.readString();
    if (dataIn.length() == 1) { 
      players = Integer.parseInt(dataIn);
    } //defines players as the converted dataIn

    if (mouseX > 700 && mouseX < 950 && mouseY > 200 && mouseY < 320 && !connected && !playerLock) {
      if (mousePressed) {

          playerNumber = players;

      Player.write(players + ""); //sends the amount of players + a string to the server
      //the string is to make it not convert the number into a string 
      connected = true;
      playerLock = true;
    }
    }
  

  if (players > 1) {
    fill(255, 255, 255, fadeValue);
    rect(700, 375, 250, 120);
    textSize(width/30);
    fill(0, 0, 0, fadeValue);
    text("START GAME", 720, 450);
    if (mouseX > 700 && mouseX < 950 && mouseY > 375 && mouseY < 500) {
      if (mousePressed) {
        fade = true;
      } //If there is more than one player, the start button is visable 
    }
  }

  if (fade) {
    fadeValue = 0;
    if (fadeValue <= 0) {
      start = true;
      fade = false;
      fadeValue = 255;
      fill(255);
      rect(0, 0, width, height);
    }
  }
}

int getPlayerNumber () {
  return playerNumber;
}
int getPlayerAmount () {
  return players;
}
}
