import processing.net.*; 
import java.net.InetAddress;
import java.net.UnknownHostException;

Client player;
lobby lobby;
InetAddress localhost;
dice dice;

game_piece gp11, gp12, gp13, gp14;
game_piece gp21, gp22, gp23, gp24;
game_piece gp31, gp32, gp33, gp34;
game_piece gp41, gp42, gp43, gp44;

int players = 0;
int playerNumber = 0;
int hey = 0;

boolean newGame;
boolean start;

int timer = 0;
boolean timerBoolean;

int gp11X = 93, gp11Y = 130;
int gp12X = 130, gp12Y = 93;
int gp13X = 168, gp13Y = 130;
int gp14X = 130, gp14Y = 168;

int gp21X = 432, gp21Y = 130;
int gp22X = 469, gp22Y = 93;
int gp23X = 507, gp23Y = 130;
int gp24X = 469, gp24Y = 168;

int gp31X = 93, gp31Y = 468;
int gp32X = 130, gp32Y = 430;
int gp33X = 168, gp33Y = 468;
int gp34X = 130, gp34Y = 506;

int gp41X = 432, gp41Y = 468;
int gp42X = 469, gp42Y = 430;
int gp43X = 507, gp43Y = 468;
int gp44X = 469, gp44Y = 506;

int diceRoll;
boolean isDiceRolled;
boolean green1;

PImage board;
PImage dice1;
PImage dice2;
PImage dice3;
PImage dice4;
PImage dice5;
PImage dice6;

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

  lobby = new lobby();

  dice = new dice();

  gp11 = new game_piece();
  gp12 = new game_piece();
  gp13 = new game_piece();
  gp14 = new game_piece();
  gp21 = new game_piece();
  gp22 = new game_piece();
  gp23 = new game_piece();
  gp24 = new game_piece();
  gp31 = new game_piece();
  gp32 = new game_piece();
  gp33 = new game_piece();
  gp34 = new game_piece();
  gp41 = new game_piece();
  gp42 = new game_piece();
  gp43 = new game_piece();
  gp44 = new game_piece();

  try {
    localhost = InetAddress.getLocalHost();
    //println(localhost.getHostAddress());
  } 
  catch (UnknownHostException e) {
  }

  // If client is run from another computer, then write the server's IP address instead of localhost.getHostAddress(), e.g. "192.168.0.7"
  player = new Client(this, localhost.getHostAddress(), 5255);
}

void draw() {
  if (!newGame && !start) {
    lobby.startScreen();
  } else if (newGame && !start) {
    lobby.makeLobby(players);

    players = player.read();

    playerNumber = lobby.getPlayerNumber();

    textSize(width/10);
    text(str(players), 325, 425);
  } else {
    image(board, 0, 0);

    gp11.place(gp11X, gp11Y, 1);
    gp12.place(gp12X, gp12Y, 1);
    gp13.place(gp13X, gp13Y, 1);
    gp14.place(gp14X, gp14Y, 1);

    gp21.place(gp21X, gp21Y, 2);
    gp22.place(gp22X, gp22Y, 2);
    gp23.place(gp23X, gp23Y, 2);
    gp24.place(gp24X, gp24Y, 2);

    if (players == 3) {
      gp31.place(gp31X, gp31Y, players);
      gp32.place(gp32X, gp32Y, players);
      gp33.place(gp33X, gp33Y, players);
      gp34.place(gp34X, gp34Y, players);
    }

    if (players == 4) {
      gp31.place(gp31X, gp31Y, players-1);
      gp32.place(gp32X, gp32Y, players-1);
      gp33.place(gp33X, gp33Y, players-1);
      gp34.place(gp34X, gp34Y, players-1);

      gp41.place(gp41X, gp41Y, players);
      gp42.place(gp42X, gp42Y, players);
      gp43.place(gp43X, gp43Y, players);
      gp44.place(gp44X, gp44Y, players);
    }

    fill(255);
    rect(600, 200, 250, 120);
    fill(0);
    textSize(width/20);
    text("Roll dice", 620, 275);
  }
}

void mousePressed() {
  if (mouseButton == LEFT && start == true) {
    if (mouseX > 600 && mouseX < 850 && mouseY > 200 && mouseY < 320) {
      diceRoll = dice.roll();
      isDiceRolled = true;

      player.write(diceRoll);

      if (diceRoll == 1) {
        image(dice1, 675, 50);
      } else if (diceRoll == 2) {
        image(dice2, 675, 50);
      } else if (diceRoll == 3) {
        image(dice3, 675, 50);
      } else if (diceRoll == 4) {
        image(dice4, 675, 50);
      } else if (diceRoll == 5) {
        image(dice5, 675, 50);
      } else if (diceRoll == 6) {
        image(dice6, 675, 50);
      }
    }
  }

  if (mouseButton == LEFT && isDiceRolled && playerNumber == 1) {
    if (mouseX > gp11X-15 && mouseX < gp11X+15 && mouseY > gp11Y-15 && mouseY < gp11Y+15) {
      gp11X += diceRoll*10;
      gp11Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp12X-15 && mouseX < gp12X+15 && mouseY > gp12Y-15 && mouseY < gp12Y+15) {
      gp12X += diceRoll*10;
      gp12Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp13X-15 && mouseX < gp13X+15 && mouseY > gp13Y-15 && mouseY < gp13Y+15) {
      gp13X += diceRoll*10;
      gp13Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp14X-15 && mouseX < gp14X+15 && mouseY > gp14Y-15 && mouseY < gp14Y+15) {
      gp14X += diceRoll*10;
      gp14Y += diceRoll*10;
      isDiceRolled = false;
    }
  }

  if (mouseButton == LEFT && isDiceRolled == true && playerNumber == 2) {
    if (mouseX > gp21X-15 && mouseX < gp21X+15 && mouseY > gp21Y-15 && mouseY < gp21Y+15) {
      gp21X += diceRoll*10;
      gp21Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp22X-15 && mouseX < gp22X+15 && mouseY > gp22Y-15 && mouseY < gp22Y+15) {
      gp22X += diceRoll*10;
      gp22Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp23X-15 && mouseX < gp23X+15 && mouseY > gp23Y-15 && mouseY < gp23Y+15) {
      gp23X += diceRoll*10;
      gp23Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp24X-15 && mouseX < gp24X+15 && mouseY > gp24Y-15 && mouseY < gp24Y+15) {
      gp24X += diceRoll*10;
      gp24Y += diceRoll*10;
      isDiceRolled = false;
    }
  }

  if (mouseButton == LEFT && isDiceRolled == true && playerNumber == 3) {
    if (mouseX > gp31X-15 && mouseX < gp31X+15 && mouseY > gp31Y-15 && mouseY < gp31Y+15) {
      gp31X += diceRoll*10;
      gp31Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp32X-15 && mouseX < gp32X+15 && mouseY > gp32Y-15 && mouseY < gp32Y+15) {
      gp32X += diceRoll*10;
      gp32Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp33X-15 && mouseX < gp33X+15 && mouseY > gp33Y-15 && mouseY < gp33Y+15) {
      gp33X += diceRoll*10;
      gp33Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp34X-15 && mouseX < gp34X+15 && mouseY > gp34Y-15 && mouseY < gp34Y+15) {
      gp34X += diceRoll*10;
      gp34Y += diceRoll*10;
      isDiceRolled = false;
    }
  }

  if (mouseButton == LEFT && isDiceRolled == true && playerNumber == 4) {
    if (mouseX > gp41X-15 && mouseX < gp41X+15 && mouseY > gp41Y-15 && mouseY < gp41Y+15) {
      gp41X += diceRoll*10;
      gp41Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp42X-15 && mouseX < gp42X+15 && mouseY > gp42Y-15 && mouseY < gp42Y+15) {
      gp42X += diceRoll*10;
      gp42Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp43X-15 && mouseX < gp43X+15 && mouseY > gp43Y-15 && mouseY < gp43Y+15) {
      gp43X += diceRoll*10;
      gp43Y += diceRoll*10;
      isDiceRolled = false;
    } else if (mouseX > gp44X-15 && mouseX < gp44X+15 && mouseY > gp44Y-15 && mouseY < gp44Y+15) {
      gp44X += diceRoll*10;
      gp44Y += diceRoll*10;
      isDiceRolled = false;
    }
  }
}
