class Printer {
  PVector loc = new PVector();
  int blueTeam = -1;
  Printer(float x, float y) {
    loc.set(x, y);
  }
  void display() {
    fill(green);
    rect(loc.x, loc.y, blockSize - blockOff, blockSize - blockOff, 5);
    if (blueTeam == 1) {
      fill(blue);
      ellipse(loc.x, loc.y, (blockSize - blockOff)/2, (blockSize - blockOff)/2);
    }
    if (blueTeam == 0) {
      fill(red);
      ellipse(loc.x, loc.y, (blockSize - blockOff)/2, (blockSize - blockOff)/2);
    }
  }
}
