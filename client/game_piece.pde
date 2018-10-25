class game_piece {
  int dimensions = 30;

  game_piece () {
  }

  void place(int xPos, int yPos, int playerNumber) {
    strokeWeight(2);

    if (playerNumber == 1) {
      fill(0, 255, 0);
    } else if (playerNumber == 2) {
      fill(255, 0, 0);
    } else if (playerNumber == 3) {
      fill(255, 255, 0);
    } else if (playerNumber == 4) {
      fill(0, 0, 255);
    } else {
      fill(0, 0, 0);
    }

    ellipse(xPos, yPos, dimensions, dimensions);
  }
}
