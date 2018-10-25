import processing.net.*; 

Client myClient;

PImage board;
PImage dice1;
PImage dice2;
PImage dice3;
PImage dice4;
PImage dice5;
PImage dice6;

int dimensions = 30;
dice dice;
int diceRoll;
boolean start;
int fadeValue = 255;
boolean fade = false;
String diceNumber;

void setup() {
  board = loadImage("LudoBoard.png");
  dice1 = loadImage("dice1.JPG");
  dice2 = loadImage("dice2.JPG");
  dice3 = loadImage("dice3.JPG");
  dice4 = loadImage("dice4.JPG");
  dice5 = loadImage("dice5.JPG");
  dice6 = loadImage("dice6.JPG");

  size(1000, 600);

  background(255);
  dice = new dice();
  textSize(width/20);
  //myClient = new Client(this, "127.0.0.1", 8000);
}

void draw() {
  if (!start) {
    fill(255, 255, 255, fadeValue);
    rect(0, 0, width, height);

    if (mouseX < width) {
      if (mousePressed) {
        fade = true;
      }
    }

    if (fade) {
      fadeValue = 0;
      if (fadeValue <= 0) {
        start = true;
        fade = false;
        fadeValue = 255;
      }
    }
  } else {
    image(board, 0, 0);
    strokeWeight(2);
    fill(0, 255, 0);
    ellipse(93, 130, dimensions, dimensions); //Green1
    ellipse(130, 92, dimensions, dimensions); //Green2
    ellipse(168, 130, dimensions, dimensions); //Green3
    ellipse(130, 168, dimensions, dimensions); //Green4

    fill(255, 0, 0);
    ellipse(432, 130, dimensions, dimensions); //Red1
    ellipse(469, 92, dimensions, dimensions); //Red2
    ellipse(507, 130, dimensions, dimensions); //Red3
    ellipse(469, 168, dimensions, dimensions); //Red4

    fill(255, 255, 0);
    ellipse(93, 468, dimensions, dimensions); //Yellow1
    ellipse(130, 430, dimensions, dimensions); //Yellow2
    ellipse(168, 468, dimensions, dimensions); //Yellow3
    ellipse(130, 506, dimensions, dimensions); //Yellow4

    fill(0, 0, 255);
    ellipse(432, 468, dimensions, dimensions); //Blue1
    ellipse(469, 430, dimensions, dimensions); //Blue2
    ellipse(507, 468, dimensions, dimensions); //Blue3
    ellipse(469, 506, dimensions, dimensions); //Blue4

    fill(255);
    rect(600, 200, 250, 120);
    fill(0);
    text("Roll dice", 620, 275);
  }
}

void mousePressed() {
  if (mouseButton == LEFT && start == true) {
    if (mouseX > 600 && mouseX < 850 && mouseY > 200 && mouseY < 320) {
      diceRoll = dice.roll();
      diceNumber = str(diceRoll);
      
      if(diceRoll == 1) {
       image(dice1, 675, 50); 
      } else if(diceRoll == 2) {
        image(dice2, 675, 50);
      } else if(diceRoll == 3) {
        image(dice3, 675, 50);
      } else if(diceRoll == 4) {
        image(dice4, 675, 50);
      } else if(diceRoll == 5) {
        image(dice5, 675, 50);
      } else if(diceRoll == 6) {
        image(dice6, 675, 50);
      }
    }
  }
}
