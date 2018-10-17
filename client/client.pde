import processing.net.*; 

Client myClient;
PImage board;

void setup() {
  board = loadImage("LudoBoard.png");
  
  size(1000,800);
  
  background(board);
  //myClient = new Client(this, "127.0.0.1", 8000);
}

void draw() {

}
