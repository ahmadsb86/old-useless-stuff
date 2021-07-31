
class lab {

  PVector loc = new PVector();

  PVector select = new PVector(-1, -1);

  int health = 1000;
  int maxHealth = 1000;
  int TYPE = 0;

  Team t;

  lab(Team t_, float x, float y) {
    t = t_;
    loc.set(x, y);
  }


  void display() {
    noStroke();
    if (t == Blue) {
      fill(blue);
    } else {
      fill(red);
    }
    float tile = blockSize*2 - blockOff;
    ellipse(loc.x + blockSize/2, loc.y + blockSize/2, map(health, 0, maxHealth, tile/2, tile), map(health, 0, maxHealth, tile/2, tile));
    //ellipse(loc.x + blockSize/2, loc.y + blockSize/2, blockSize*2 - blockOff, blockSize*2 - blockOff);
    fill(200, 0, 200);
    ellipse(loc.x + blockSize/2, loc.y + blockSize/2, map(health, 0, maxHealth, tile/2, tile)/2, map(health, 0, maxHealth, tile/2, tile)/2);
    //ellipse(loc.x + blockSize/2, loc.y + blockSize/2, blockSize - blockOff, blockSize - blockOff);
  }


  void showMenu() {


    fill(dark);
    rect(size.x/2, size.y/2, size.x - 100, size.y - 100, 100);

    //GUI

    for (int i = 0; i < 2; i ++) {
      for (int j = 0; j < 8; j ++) {
        fill(200, 0, 200);
        if (mousePressed && overCircle(i*70 + 150, j*70 + 100, 40)) {
          select.set(i, j);
        }
        if (select.x == i && select.y == j) {
          TYPE = int(select.x + (select.y * 2));
          textSize(50);
          fill(255);
          if (TYPE == 0) {
            text("Spy Glasses", width - 300, 200);
            text("Rubber + 25", width - 300, 300);
          }
          if (TYPE == 1) {
            text("Mobility", width - 300, 200);
            text("Rubber + 25", width - 300, 300);
          }
          if (TYPE == 2) {
            text("Enforced Armour", width - 300, 200);
            text("Rubber + 25", width - 300, 300);
          }
          if (TYPE == 3) {
            text("Super Charger", width - 300, 200);
           text("Rubber + 25", width - 300, 300);
          }

          if (TYPE == 4) {
            text("Spy Glasses 2", width - 300, 200);
            text("Iron + 50", width - 300, 300);
          }
          if (TYPE == 5) {
            text("Mobility 2", width - 300, 200);
            
            text("Iron + 50", width - 300, 300);
          }
          if (TYPE == 6) {
            text("Enforced Armour 2", width - 300, 200);
            text("Iron + 50", width - 300, 300);
          }
          if (TYPE == 7) {
            text("Super Charger 2", width - 300, 200);
            text("Iron + 50", width - 300, 300);
          }

          if (TYPE == 8) {
            text("Spy Glasses 3", width - 300, 200);
            text("Copper + 75", width - 300, 300);
          }
          if (TYPE == 9) {
            text("Mobility 3", width - 300, 200);
            text("Copper + 75", width - 300, 300);
          }
          if (TYPE == 10) {
            text("Enforced Armour 3", width - 300, 200);
            text("Copper + 75", width - 300, 300);
          }
          if (TYPE == 11) {
            text("Super Charger 3", width - 300, 200);
            text("Copper + 75", width - 300, 300);
          }

          if (TYPE == 12) {
            text("Spy Glasses 4", width - 300, 200);
            text("Diamonds + 100", width - 300, 300);
          }
          if (TYPE == 13) {
            text("Mobility 4", width - 300, 200);
            text("Diamonds + 100", width - 300, 300);
          }
          if (TYPE == 14) {
            text("Enforced Armour 4", width - 300, 200);
            text("Diamonds + 100", width - 300, 300);
          }
          if (TYPE == 15) {
            text("Super Charger 4", width - 300, 200);
            text("Diamonds + 100", width - 300, 300);
          }

          textSize(12);
          fill(150, 0, 150, 100);
        }



        ellipse(i*70 + 150, j*70 + 100, 40, 40);
      }
    }






    //      confirm and cancel buttons


    PVector button = new PVector(size.x - 110, size.y - 110);
    PVector cancel = new PVector(size.x - 170, size.y - 110);



    //confirm
    fill(255);
    if (overCircle(button.x, button.y, 50)) {
      if (mousePressed) {

        //boosting stage
        t.GameState = "boosting";
      } else {
        fill(back);
      }
    }

    ellipse(button.x, button.y, 50, 50);
    fill(0);
    stroke(0);
    line(button.x - 5, button.y - 10, button.x + 5, button.y);
    line(button.x - 5, button.y + 10, button.x + 5, button.y);
    noStroke();
    fill(255);



    //cancel
    if (overCircle(cancel.x, cancel.y, 50)) {
      if (mousePressed) {
        t.GameState = "game";
        select.set(-1, -1);
      } else {
        fill(back);
      }
    }


    ellipse(cancel.x, cancel.y, 50, 50);
    fill(0);
    stroke(0);
    line(cancel.x - 8, cancel.y - 8, cancel.x + 8, cancel.y + 8);
    line(cancel.x - 8, cancel.y + 8, cancel.x + 8, cancel.y - 8);
    noStroke();
  }
}
