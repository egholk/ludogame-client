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

//Checks if clients are available and locates which game piece is playing
if (Player.available() > 0) { 
     dataIn = Player.readString(); 
     println(dataIn);

    if(dataIn.indexOf("gp11") >= 0){
      gp11X = Integer.parseInt(dataIn.split(",")[1]);
      gp11Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp12") >= 0){
      gp12X = Integer.parseInt(dataIn.split(",")[1]);
      gp12Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp13") >= 0){
      gp13X = Integer.parseInt(dataIn.split(",")[1]);
      gp13Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp14") >= 0){
      gp14X = Integer.parseInt(dataIn.split(",")[1]);
      gp14Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    
    //Yellow
    else if(dataIn.indexOf("gp21") >= 0){
      gp21X = Integer.parseInt(dataIn.split(",")[1]);
      gp21Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp22") >= 0){
      gp22X = Integer.parseInt(dataIn.split(",")[1]);
      gp22Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp23") >= 0){
      gp23X = Integer.parseInt(dataIn.split(",")[1]);
      gp23Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp24") >= 0){
      gp24X = Integer.parseInt(dataIn.split(",")[1]);
      gp24Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    
    //Blue
    else if(dataIn.indexOf("gp31") >= 0){
      gp31X = Integer.parseInt(dataIn.split(",")[1]);
      gp31Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp32") >= 0){
      gp32X = Integer.parseInt(dataIn.split(",")[1]);
      gp32Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp33") >= 0){
      gp33X = Integer.parseInt(dataIn.split(",")[1]);
      gp33Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp34") >= 0){
      gp34X = Integer.parseInt(dataIn.split(",")[1]);
      gp34Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    
    //Red
    else if(dataIn.indexOf("gp41") >= 0){
      gp41X = Integer.parseInt(dataIn.split(",")[1]);
      gp41Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp42") >= 0){
      gp42X = Integer.parseInt(dataIn.split(",")[1]);
      gp42Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp43") >= 0){
      gp43X = Integer.parseInt(dataIn.split(",")[1]);
      gp43Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
    else if(dataIn.indexOf("gp44") >= 0){
      gp44X = Integer.parseInt(dataIn.split(",")[1]);
      gp44Y = Integer.parseInt(dataIn.split(",")[2]);
    } 
     
   } 

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
      Player.write(diceRoll+""); //sends the data from the diceRoll plus an empty string (so it doesn't change it to a string)
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
      Player.write(11+"");
      isDiceRolled = false;
    } else if (mouseX > gp12X-15 && mouseX < gp12X+15 && mouseY > gp12Y-15 && mouseY < gp12Y+15) {
      Player.write(12+"");
      isDiceRolled = false;
    } else if (mouseX > gp13X-15 && mouseX < gp13X+15 && mouseY > gp13Y-15 && mouseY < gp13Y+15) {
      Player.write(13+"");
      isDiceRolled = false;
    } else if (mouseX > gp14X-15 && mouseX < gp14X+15 && mouseY > gp14Y-15 && mouseY < gp14Y+15) {
      Player.write(14+"");
      isDiceRolled = false;
    }
  }


  if (mouseButton == LEFT && isDiceRolled == true && playerNumber == 2) {
    if (mouseX > gp21X-15 && mouseX < gp21X+15 && mouseY > gp21Y-15 && mouseY < gp21Y+15) {
      Player.write(21+"");
      isDiceRolled = false;
    } else if (mouseX > gp22X-15 && mouseX < gp22X+15 && mouseY > gp22Y-15 && mouseY < gp22Y+15) {
      Player.write(22+"");
      isDiceRolled = false;
    } else if (mouseX > gp23X-15 && mouseX < gp23X+15 && mouseY > gp23Y-15 && mouseY < gp23Y+15) {
      Player.write(23+"");
      isDiceRolled = false;
    } else if (mouseX > gp24X-15 && mouseX < gp24X+15 && mouseY > gp24Y-15 && mouseY < gp24Y+15) {
      Player.write(24+"");
      isDiceRolled = false;
    }
  }

  if (mouseButton == LEFT && isDiceRolled == true && playerNumber == 3) {
    if (mouseX > gp31X-15 && mouseX < gp31X+15 && mouseY > gp31Y-15 && mouseY < gp31Y+15) {
      Player.write(31+"");
      isDiceRolled = false;
    } else if (mouseX > gp32X-15 && mouseX < gp32X+15 && mouseY > gp32Y-15 && mouseY < gp32Y+15) {
      Player.write(32+"");
      isDiceRolled = false;
    } else if (mouseX > gp33X-15 && mouseX < gp33X+15 && mouseY > gp33Y-15 && mouseY < gp33Y+15) {
      Player.write(33+"");
      isDiceRolled = false;
    } else if (mouseX > gp34X-15 && mouseX < gp34X+15 && mouseY > gp34Y-15 && mouseY < gp34Y+15) {
      Player.write(34+"");
      isDiceRolled = false;
    }
  }

  if (mouseButton == LEFT && isDiceRolled == true && playerNumber == 4) {
    if (mouseX > gp41X-15 && mouseX < gp41X+15 && mouseY > gp41Y-15 && mouseY < gp41Y+15) {
      Player.write(41+"");
      isDiceRolled = false;
    } else if (mouseX > gp42X-15 && mouseX < gp42X+15 && mouseY > gp42Y-15 && mouseY < gp42Y+15) {
      Player.write(42+"");
      isDiceRolled = false;
    } else if (mouseX > gp43X-15 && mouseX < gp43X+15 && mouseY > gp43Y-15 && mouseY < gp43Y+15) {
      Player.write(43+"");
      isDiceRolled = false;
    } else if (mouseX > gp44X-15 && mouseX < gp44X+15 && mouseY > gp44Y-15 && mouseY < gp44Y+15) {
      Player.write(44+"");
      isDiceRolled = false;
    }
  }
  
}
