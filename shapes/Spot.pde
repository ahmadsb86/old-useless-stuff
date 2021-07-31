class Spot {

  PVector loc = new PVector();
  boolean fog = true;
  boolean movable = false;

  int resource1;
  int resource2;
  int digLevel;

  Team t;

  Spot(Team t_, int x, int y) {
    t = t_;
    loc.set(x, y);
    resource1 = int(random(13));
    resource2 = int(random(13));
    digLevel = 0;
  }

  void display() {
    rectMode(CENTER);

    if (fog == false && (occupied(Blue, loc) || occupied(Red, loc))) {
      return;
    }

    if (fog == false) {
      noFill();
      stroke(150);
      strokeWeight(1);
    }
    if (digLevel != 0) {
      pushStyle();
      noStroke();
      fill(255 - digLevel*100);
      rect(loc.x, loc.y, blockSize - blockOff*2, blockSize - blockOff*2, 5);
      popStyle();
      stroke(150);
      strokeWeight(1);
    }
    if (fog) {
      fill(cyan);
      noStroke();
    } 
    if (movable) {
      stroke(0, 0, 255);
      strokeWeight(1.5);
    }

    rect(loc.x, loc.y, blockSize - blockOff, blockSize - blockOff, 5);
  }

  void setFog() {
    fog = true;
    for (Shape o : t.shapes) {
      if (dist(o.loc.x, o.loc.y, loc.x, loc.y) < o.d.scout) {
        fog = false;
      }
    }
    for (Generator g : t.generators) {
      if (dist(g.loc.x + blockSize/2, g.loc.y + blockSize/2, loc.x, loc.y) < 100) {
        fog = false;
      }
    }
    if(dist(t.l.loc.x + blockSize/2, t.l.loc.y + blockSize/2, loc.x, loc.y) < 100){
      fog = false;
    }
  }
  void showMovable(int dist, PVector location) {
    if (t.GameState == "selected") {
      if (dist(location.x, location.y, loc.x, loc.y) < dist) {
        movable = true;
      } else {
        movable = false;
      }
    } else {
      movable = false;
    }
  }
  void hideMovable() {
    movable = false;
  }
}
