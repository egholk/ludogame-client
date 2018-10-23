import processing.net.*; 

Client Player; 
int dataIn; 

void setup() {
  board = loadImage("LudoBoard.png");
  
  size(1000,800);
  
  background(board);
  //Player = new Client(this, "127.0.0.1", 5204); 
}

void draw() {
  if (Player.available() > 0) { 
    dataIn = Player.read(); 
  } 
  background(dataIn); 

}
