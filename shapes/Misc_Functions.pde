PVector LocToSpot(PVector LOC) {
  for (int i = 0; i < spotX; i ++) {
    for (int j = 0; j < spotY; j ++) {
      if (spot[i][j].loc == LOC) {
        return new PVector(i, j);
      }
    }
  }
  return null;
}

void resetTurn(Team t) {
  //for all printers
  t.GameState = "game";
  t.money += 300;
  for (Shape o : t.shapes) {
    o.mobility = o.d.mobilityCap;
    o.hasShot = false;
  }
  if (bTurn) {
    bTurn = false;
    for (Printer p : printers) {
      if (p.blueTeam == 1) {
        t.money += 100;
      }
    }
    for (int i = 0; i < spotX; i ++) {
      for (int j = 0; j < spotY; j ++) {
        spot[i][j].t = Red;
      }
    }
  } else {
    bTurn = true;
    for (Printer p : printers) {
      if (p.blueTeam == 0) {
        t.money += 100;
      }
    }
    for (int i = 0; i < spotX; i ++) {
      for (int j = 0; j < spotY; j ++) {
        spot[i][j].t = Blue;
      }
    }
  }
}

boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


String typeIndex(int i, String shape) {

  //circles
  if (i == 0 && shape == "circles") { 
    return "Scout";
  }
  if (i == 1 && shape == "circles") { 
    return "Engineer";
  }
  if (i == 2 && shape == "circles") { 
    return "Digger";
  }
  if (i == 3 && shape == "circles") { 
    return "Anti-Vertex";
  }
  if (i == 4 && shape == "circles") { 
    return "Fair-Fighter";
  }
  if (i == 5 && shape == "circles") { 
    return "Medic";
  }
  if (i == 6 && shape == "circles") { 
    return "Fearless";
  }
  if (i == 7 && shape == "circles") { 
    return "Guard";
  }
  if (i == 8 && shape == "circles") { 
    return "Tipper";
  }
  
  
  
  
  if (i == 0 && shape == "triangles") { 
    return "Student";
  }
  if (i == 1 && shape == "triangles") { 
    return "Back-Leg";
  }
  if (i == 2 && shape == "triangles") { 
    return "Crusher";
  }
  if (i == 3 && shape == "triangles") { 
    return "Frontline";
  }
  if (i == 4 && shape == "triangles") { 
    return "Forward";
  }
  if (i == 5 && shape == "triangles") { 
    return "Stealth";
  }
  if (i == 6 && shape == "triangles") { 
    return "Velocity";
  }
  if (i == 7 && shape == "triangles") { 
    return "Horse-Power";
  }
  if (i == 8 && shape == "triangles") { 
    return "Bulldoser";
  }
  
  
  
  
  
  if (i == 0 && shape == "squares") { 
    return "Tailor";
  }
  if (i == 1 && shape == "squares") { 
    return "Average Joe";
  }
  if (i == 2 && shape == "squares") { 
    return "Digger";
  }
  if (i == 3 && shape == "squares") { 
    return "Hind-Sight";
  }
  if (i == 4 && shape == "squares") { 
    return "Borderline";
  }
  if (i == 5 && shape == "squares") { 
    return "Cold-Hearted";
  }
  if (i == 6 && shape == "squares") { 
    return "Vesuvius";
  }
  if (i == 7 && shape == "squares") { 
    return "Shrinker";
  }
  if (i == 8 && shape == "squares") { 
    return "Shade";
  }


  return "unknown";
}


void BoostEffect(Team t, PVector index, Shape o) {

  if (index.x == 0 && index.y == 0) {
    if (t.rubber >= 1 && t.money >= 25) {
      o.addBoost(new boost(1));
      t.rubber -= 1;
      t.money -= 25;
    }
  }
  if (index.x == 1 && index.y == 0) {
    if (t.rubber >= 1 && t.money >= 25) {
      o.addBoost(new boost(2));
      t.rubber -= 1;
      t.money -= 25;
    }
  }
  if (index.x == 0 && index.y == 1) {
    if (t.rubber >= 1 && t.money >= 25) {
      o.addBoost(new boost(3));
      t.rubber -= 1;
      t.money -= 25;
    }
  }
  if (index.x == 1 && index.y == 1) {
    if (t.rubber >= 1 && t.money >= 25) {
      o.addBoost(new boost(4));
      t.rubber -= 1;
      t.money -= 25;
    }
  }
  
  
  
  
  
  
  
  if (index.x == 0 && index.y == 2) {
    if (t.iron >= 1 && t.money >= 50) {
      o.addBoost(new boost(5));
      t.iron -= 1;
      t.money -= 50;
    }
  }
  if (index.x == 1 && index.y == 2) {
    if (t.iron >= 1 && t.money >= 50) {
      o.addBoost(new boost(6));
      t.iron -= 1;
      t.money -= 50;
    }
  }
  if (index.x == 0 && index.y == 3) {
    if (t.iron >= 1 && t.money >= 50) {
      o.addBoost(new boost(7));
      t.iron -= 1;
      t.money -= 50;
    }
  }
  if (index.x == 1 && index.y == 3) {
    if (t.iron >= 1 && t.money >= 50) {
      o.addBoost(new boost(8));
      t.iron -= 1;
      t.money -= 50;
    }
  }
  
  
  
  
  
  
  if (index.x == 0 && index.y == 4) {
    if (t.copper >= 1 && t.money >= 75) {
      o.addBoost(new boost(9));
      t.copper -= 1;
      t.money -= 75;
    }
  }
  if (index.x == 1 && index.y == 4) {
    if (t.copper >= 1 && t.money >= 75) {
      o.addBoost(new boost(10));
      t.copper -= 1;
      t.money -= 75;
    }
  }
  if (index.x == 0 && index.y == 5) {
    if (t.copper >= 1 && t.money >= 75) {
      o.addBoost(new boost(11));
      t.copper -= 1;
      t.money -= 75;
    }
  }
  if (index.x == 1 && index.y == 5) {
    if (t.copper >= 1 && t.money >= 75) {
      o.addBoost(new boost(12));
      t.copper -= 1;
      t.money -= 75;
    }
  }
  
  
  
  
  
  if (index.x == 0 && index.y == 6) {
    if (t.diamonds >= 1 && t.money >= 100) {
      o.addBoost(new boost(13));
      t.diamonds -= 1;
      t.money -= 75;
    }
  }
  if (index.x == 1 && index.y == 6) {
    if (t.diamonds >= 1 && t.money >= 100) {
      o.addBoost(new boost(14));
      t.copper -= 1;
      t.money -= 75;
    }
  }
  if (index.x == 0 && index.y == 7) {
    if (t.diamonds >= 1 && t.money >= 100) {
      o.addBoost(new boost(15));
      t.diamonds -= 1;
      t.money -= 75;
    }
  }
  if (index.x == 1 && index.y == 7) {
    if (t.diamonds >= 1 && t.money >= 100) {
      o.addBoost(new boost(16));
      t.diamonds -= 1;
      t.money -= 75;
    }
  }




  t.l.select.set(-1, -1);
  t.FTboosting = true;
  t.GameState = "game";
  return;
}
void fAnimate(PVector start, PVector end, int time) {
  pushMatrix();
  PVector shot = new PVector();
  shot.set(end);
  shot.sub(start);
  shot.div(100);
  shot.mult(time);
  translate(start.x, start.y);
  line(0, 0, shot.x, shot.y);
  popMatrix();
}

Boolean goc(Team t, PVector loc) {

  for (Generator g : t.generators) {

    if (loc.equals(g.loc)) {
      return true;
    }

    //right of g
    if ((loc.x == g.loc.x + blockSize && loc.y == g.loc.y)) {
      return true;
    }

    //down of g
    if ((loc.x == g.loc.x && loc.y == g.loc.y + blockSize) || (loc.x == t.l.loc.x && loc.y == t.l.loc.y + blockSize)) {
      return true;
    }

    //diagnal of g
    if ((loc.x == g.loc.x + blockSize && loc.y == g.loc.y + blockSize) || (loc.x == t.l.loc.x + blockSize && loc.y == t.l.loc.y + blockSize)) {
      return true;
    }
  }
  
  
  if(loc.equals(t.l.loc)){
    return true;
  }
  if(loc.x == t.l.loc.x + blockSize && loc.y == t.l.loc.y){
    return true;
  }
  if(loc.x == t.l.loc.x && loc.y == t.l.loc.y + blockSize){
    return true;
  }
  if(loc.x == t.l.loc.x + blockSize && loc.y == t.l.loc.y + blockSize){
    return true;
  }

  return false;
}

Boolean GnotL_OC(Team t, PVector loc) {

  for (Generator g : t.generators) {
    if (loc.equals(g.loc)) {
      return true;
    }

    //right of g
    if ((loc.x == g.loc.x + blockSize && loc.y == g.loc.y)) {
      return true;
    }

    //down of g
    if ((loc.x ==  loc.x && loc.y == g.loc.y + blockSize) ) {
      return true;
    }

    //diagnal of g
    if ((loc.x == g.loc.x + blockSize && loc.y == g.loc.y + blockSize)) {
      return true;
    }
  }


  return false;
}


Generator goloc(Team t, PVector loc){
  for(Generator g : t.generators){
    if (loc.equals(g.loc)) {
      return g;
    }

    //right of g
    if ((loc.x == g.loc.x + blockSize && loc.y == g.loc.y)) {
      return g;
    }

    //down of g
    if ((loc.x == g.loc.x && loc.y == g.loc.y + blockSize) ) {
      return g;
    }

    //diagnal of g
    if ((loc.x == g.loc.x + blockSize && loc.y == g.loc.y + blockSize)) {
      return g;
    }
  }
  
  println("PERSONALIZED ERROR: NO GENERATOR ON LOCATION -> NULL RETURN ; ERROR IN MISC_FUNCTIONS -> GOLOC()");
  return null;
}

Team enemy(Team t) {
  if (t == Blue) {
    return Red;
  }
  return Blue;
}

void tri(float x, float y, float sx, float sy, color col){
  strokeJoin(ROUND);
  strokeWeight(sx/2);
  stroke(col);
  sx = sx/2;
  sy = sy/2;
  triangle( x - sx/2, y+sy/2,    x,y-sy/2,    x + sx/2, y + sy/2);
  strokeWeight(1);
}
void tri2(float x, float y, float sx, float sy){
  strokeJoin(ROUND);
  strokeWeight(sx/2);
  stroke(cyan);
  sx = sx/2;
  sy = sy/2;
  triangle( x - sx/2, y+sy/2,    x,y-sy/2,    x + sx/2, y + sy/2);
  strokeWeight(1);
}

boolean boc(PVector loc){
  for (Barrier b : barriers) {
    if (loc.equals(b.loc)) {
      return true;
    }
  }
  return false;
}

void med(Team t, PVector loc){
  for(Shape o : t.shapes){
    if(o.loc.x == loc.x + blockSize && o.loc.y == loc.y){
      o.d.armour = o.maxH;
    }
    if(o.loc.x == loc.x - blockSize && o.loc.y == loc.y){
      o.d.armour = o.maxH;
    }
    if(o.loc.x == loc.x + blockSize && o.loc.y == loc.y + blockSize){
      o.d.armour = o.maxH;
    }
    if(o.loc.x == loc.x - blockSize && o.loc.y == loc.y + blockSize){
      o.d.armour = o.maxH;
    }
    if(o.loc.x == loc.x - blockSize && o.loc.y == loc.y - blockSize){
      o.d.armour = o.maxH;
    }
    if(o.loc.x == loc.x + blockSize && o.loc.y == loc.y - blockSize){
      o.d.armour = o.maxH;
    }
    if(o.loc.x == loc.x && o.loc.y == loc.y + blockSize){
      o.d.armour = o.maxH;
    }
    if(o.loc.x == loc.x && o.loc.y == loc.y - blockSize){
      o.d.armour = o.maxH;
    }
  }
}


/*

 gamestates:
 
 game
 selected
 circles, squares, triangles
 lab
 boosting
 firing
 
 
 */
