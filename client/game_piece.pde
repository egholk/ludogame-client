class game_piece {
  int playerNumber;

  game_piece (int playerNumber) {
    this.playerNumber = playerNumber;
  }

  boolean isAtStart (int field) {
    if (field > 0 && field < 5) {
      return true;
    } else {
      return false;
    }
  }
  
  String playerColour() {
    if(playerNumber == 1) {
      return "Yellow";
    } else if(playerNumber == 2) {
      return "Green";
    } else if(playerNumber == 3) {
      return "Red";
    } else {
      return "Blue";
    }
  }
}
