class dice {

  int randomNumber;
  
  dice() {
  }

  int roll() {
    randomNumber = int(random(1, 7));
    return randomNumber;
  }
}
