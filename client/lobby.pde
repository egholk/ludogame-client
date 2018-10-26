import processing.net.*; 

class lobby {

  int fadeValue = 255;
  boolean fade = false;
  int rect = 700;
  String message = "";

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

    if (mouseX > 375 && mouseX < 625 && mouseY > 400 && mouseY < 500) {
      if (mousePressed) {
        exit();
      }
    }

    if (mouseX > 375 && mouseX < 625 && mouseY > 250 && mouseY < 350) {
      if (mousePressed) {
        newGame = true;
        fill(255);
        rect(0, 0, width, height);
      }
    }
  }

  void makeLobby () {
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

    if (mouseX > 700 && mouseX < 950 && mouseY > 200 && mouseY < 320) {
      if (mousePressed) {
        message = Player.readString();
      }
    }
    
    textSize(width/30);
    text(message, 100, 275);

    if (players > 1) {
      fill(255, 255, 255, fadeValue);
      rect(700, 375, 250, 120);
      textSize(width/30);
      fill(0, 0, 0, fadeValue);
      text("START GAME", 720, 450);
      if (mouseX > 700 && mouseX < 950 && mouseY > 375 && mouseY < 500) {
        if (mousePressed) {
          fade = true;
        }
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
}