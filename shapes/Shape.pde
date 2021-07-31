class Shape {
  PVector loc = new PVector(width/2, height/2);
  String shape = "circles";
  int type = -1;
  boolean selected = false;
  int maxH = 0;
  boolean DAD = false;
  boolean hasShot = false;

  int alpha = 255;
  color col_;

  int mobility = 0;
  data d = new data();

  float startFrameResourceHUD = 0;
  boolean shrink;

  ArrayList<boost> boosts = new ArrayList<boost>();


  Team t;

  Shape(Team t_, float x, float y, int Type, String SH) {
    shape = SH;
    t = t_;
    type = Type;
    loc.set(x, y);



    if (shape == "circles") {
      if (type == 0) {
        d.setp( 400, 200, 100, 150, 0, 0, 0, 0);
      }
      if (type == 1) {
        d.setp(300, 250, 100, 75, 50, 10, 10, 100);
      }
      if (type == 2) {
        d.setp(180, 150, 200, 50, 50, 10, 10, 0);
      }
      if (type == 3) {
        d.setp(300, 250, 250, 175, 10, 85, 85, 50);
      }
      if (type == 4) {
        d.setp(300, 250, 300, 175, 95, 30, 30, 25);
      }
      if (type == 5) {
        d.setp(200, 160, 250, 150, 0, 0, 0, 0);
      }
      if (type == 6) {
        d.setp(300, 250, 255, 25, 135, 135, 135, 10);
      }
      if (type == 7) {
        d.setp(200, 120, 450, 250, 250, 250, 250, 0);
      }
      if (type == 8) {
        d.setp(200, 160, 125, 100, 50, 50, 80, 100);
      }
    }

    if (shape == "squares") {
      if (type == 0) {
        d.setp(200, 160, 75, 100, 100, 5, 35, 5);
      }
      if (type == 1) {
        d.setp(240, 200, 100, 50, 50, 50, 50, 50);
      }
      if (type == 2) {
        d.setp(180, 150, 400, 50, 50, 10, 10, 0);
      }
      if (type == 3) {
        d.setp(200, 150, 100, 100, 60, 80, 40, 50);
      }
      if (type == 4) {
        d.setp(180, 150, 300, 100, 100, 100, 100, 50);
      }
      if (type == 5) {
        d.setp(180, 150, 200, 75, 90, 40, 110, 75);
      }
      if (type == 6) {
        d.setp(180, 150, 250, 100, 50, 10, 10, 200);
      }
      if (type == 7) {
        d.setp(180, 150, 300, 100, 100, 100, 100, 0); 
      }
      if (type == 8) {
        d.setp(200, 170, 500, 150, 170, 170, 170, 10); 
      }
    }
    if (shape == "triangles") {
      if (type == 0) {
        d.setp(160, 120, 50, 75, 50, 50, 50, 10);
      }
      if (type == 1) {
        d.setp(160, 120, 75, 75, 75, 75, 75, 50);
      }
      if (type == 2) {
        d.setp(200, 160, 100, 100, 50, 40, 70, 200);
      }
      if (type == 3) {
        d.setp(200, 160, 400, 100, 100, 100, 100, 200);
      }
      if (type == 4) {
        d.setp(200, 160, 250, 100, 85, 85, 85, 300);
      }
      if (type == 5) {
        d.setp(300, 250, 250, 100, 75, 75, 75, 100);
      }
      if (type == 6) {
        d.setp(160, 300, 315, 100, 100, 100, 100, 50);
      }
      if (type == 7) {
        d.setp(240, 200, 400, 120, 50, 10, 10, 500);
      }
      if (type == 8) {
        d.setp(200, 160, 600, 200, 200, 200, 200, 600);
      }
    }



    maxH = d.armour;
    mobility = d.mobilityCap;
  }

  void display() {

    noStroke();

    if (shape == "circles") {

      if (t == Blue) {
        fill(blue, alpha);
      }
      if (t == Red) {
        fill(red, alpha);
      }

      float tile = blockSize - blockOff;
      float size = map(d.armour, 0, maxH, tile/2, tile);
      size = constrain(size,tile/2,tile);
      ellipse(loc.x, loc.y, size, size);

      if (type == 2) {
        fill(back, alpha);
        ellipse(loc.x, loc.y, blockSize/2 - blockOff, blockSize/2 - blockOff);
      }

      if (type == 1) {
        fill(back, alpha);
        ellipse(loc.x, loc.y, blockSize/2.5 - blockOff, blockSize/2.5 - blockOff);
      }
      if (type == 0) {
        fill(back, alpha);
        ellipse(loc.x, loc.y, blockSize/2 - blockOff, blockSize/2 - blockOff);
        fill(100);
        ellipse(loc.x, loc.y, blockSize/2.5 - blockOff, blockSize/2.5 - blockOff);
      }
      if (type == 3) {
        fill(back, alpha);
        ellipse(loc.x - 1, loc.y, blockSize/2.8 - blockOff, blockSize/2 - blockOff);
        ellipse(loc.x + 1, loc.y, blockSize/2.8 - blockOff, blockSize/2 - blockOff);
      }
      if (type == 4) {
        fill(back, alpha);
        ellipse(loc.x , loc.y + 1, blockSize/2 - blockOff, blockSize/2.8 - blockOff);
        ellipse(loc.x , loc.y - 1, blockSize/2 - blockOff, blockSize/2.8 - blockOff);
      }
      if (type == 5) {
        fill(0,200,0, alpha);
        ellipse(loc.x, loc.y, blockSize/2 - blockOff, blockSize/2 - blockOff);
      }
      if (type == 7) {
        stroke(back,alpha);
        line(loc.x - 2 , loc.y + blockSize/8 , loc.x - 2 , loc.y - blockSize/8 );
        line(loc.x + 1 , loc.y + blockSize/8, loc.x + 1 , loc.y - blockSize/8);
      }
      if (type == 8) {
        stroke(back,alpha);
        line(loc.x + blockSize/10 , loc.y, loc.x - blockSize/10 , loc.y);
      }

      //
    }


    if (shape == "triangles") {

      if (t == Blue) {
        col_ = color(blue, alpha);
      }
      if (t == Red) {
        col_ = color(red, alpha);
      }

      float tile = blockSize - blockOff;
      tri(loc.x, loc.y, map(d.armour, 0, maxH, tile/2, tile), map(d.armour, 0, maxH, tile/2, tile), col_);

      if (type == 2) {
        fill(back, alpha);
        tri(loc.x, loc.y, blockSize/2 - blockOff, blockSize/2 - blockOff, color(255));
      }
      if(type == 0){
        stroke(back,alpha);
        line(loc.x, loc.y - tile/8,loc.x,loc.y + tile/8);
      }
      if (type == 1) {
        fill(back, alpha);
        tri(loc.x, loc.y, blockSize/2.5 - blockOff, blockSize/2.5 - blockOff, color(255));
      }
      if (type == 3) {
        stroke(back,alpha);
        line(loc.x + blockSize/10 , loc.y, loc.x - blockSize/10 , loc.y);
      }
      if (type == 4) {
        stroke(back,alpha);
        line(loc.x + blockSize/10 , loc.y + 1, loc.x - blockSize/10 , loc.y + 1);
        line(loc.x + blockSize/10 , loc.y - 1, loc.x - blockSize/10 , loc.y - 1);
      }
      if (type == 6) {
        stroke(back,alpha);
        line(loc.x + blockSize/12 , loc.y  - 1, loc.x - blockSize/12 , loc.y - 1);
        line(loc.x + blockSize/8 , loc.y + 2, loc.x - blockSize/8 , loc.y + 2);
        line(loc.x + blockSize/12 , loc.y + 5, loc.x - blockSize/12 , loc.y +5);
      }
      if (type == 7) {
        stroke(back, alpha);
        strokeWeight(2);
        noFill();
        ellipse(loc.x, loc.y, blockSize/2.5 - blockOff, blockSize/2.5 - blockOff);
        strokeWeight(1);
      }
      if (type == 8) {
        fill(yellow, alpha);
        ellipse(loc.x, loc.y, blockSize/2.5 - blockOff, blockSize/2.5 - blockOff);
      }
      
    }
    if (shape == "squares") {

      if (t == Blue) {
        fill(blue, alpha);
      }
      if (t == Red) {
        fill(red, alpha);
      }

      float tile = blockSize - blockOff;
      rect(loc.x, loc.y, map(d.armour, 0, maxH, tile/2, tile), map(d.armour, 0, maxH, tile/2, tile), 5);

      if (type == 2) {
        fill(back, alpha);
        ellipse(loc.x, loc.y, blockSize/2 - blockOff, blockSize/2 - blockOff);
      }

      if (type == 1) {
        fill(back, alpha);
        ellipse(loc.x, loc.y, blockSize/2.5 - blockOff, blockSize/2.5 - blockOff);
      }

      //
    }


    if (d.armour < 1) {
      t.shapes.remove(this);
    }
    
    noStroke();
  }
  void move(Spot s) {
    loc = s.loc;
  }
  void selected() {
    selected = true;
    for (int i = 0; i < spotX; i ++) {
      for (int j = 0; j < spotY; j ++) {
        spot[i][j].showMovable(mobility, loc);
      }
    }
    DAD = true;
  }
  void unselect() {
    selected = false;
    for (int i = 0; i < spotX; i ++) {
      for (int j = 0; j < spotY; j ++) {
        spot[i][j].hideMovable();
      }
    }
    DAD = false;
  }

  void ActivateButton() {

    noStroke();


    PVector spotMatrixIndex = LocToSpot(loc);
    Spot res = spot[int(spotMatrixIndex.x)][int(spotMatrixIndex.y)];



    if (type == 2 && shape == "circles") {



      if (startFrameResourceHUD != 0 && frameCount < startFrameResourceHUD + 100) {

        if (res.resource1 >= 0 && res.resource1 <= 2) {
          fill(0, 200, 200);
          if (res.digLevel == 0) {
            t.diamonds ++;
          }
        }
        if (res.resource1 >= 3 && res.resource1 <= 5) {
          fill(255, 100, 0);
          if (res.digLevel == 0) {
            t.copper ++;
          }
        }
        if (res.resource1 >= 6 && res.resource1 <= 8) {
          fill(grey);
          if (res.digLevel == 0) {
            t.iron ++;
          }
        }
        if (res.resource1 >= 9 && res.resource1 <= 12) {
          fill(100, 50, 0);
          if (res.digLevel == 0) {
            t.rubber ++;
          }
        }
        rect(width /2, height - 20, 20, 20, 5);
        fill(255);
        spot[int(spotMatrixIndex.x)][int(spotMatrixIndex.y)].digLevel = 1;
      } else if (startFrameResourceHUD != 0 && frameCount > startFrameResourceHUD + 100) {
        startFrameResourceHUD = 0;
      }

      if (t.GameState == "game") {
        startFrameResourceHUD = 0;
      }


      if (overCircle(width - 25, height - 25, 40) & mousePressed == true) {
        startFrameResourceHUD = frameCount;
      }
    }







    if (type == 2 && shape == "squares") {

      if (startFrameResourceHUD != 0 && frameCount < startFrameResourceHUD + 100) {

        if (res.resource1 >= 0 && res.resource1 <= 2) {
          fill(0, 200, 200);
          if (res.digLevel == 0) {
            t.diamonds ++;
          }
        }
        if (res.resource1 >= 3 && res.resource1 <= 5) {
          fill(255, 100, 0);
          if (res.digLevel == 0) {
            t.copper ++;
          }
        }
        if (res.resource1 >= 6 && res.resource1 <= 8) {
          fill(grey);
          if (res.digLevel == 0) {
            t.iron ++;
          }
        }
        if (res.resource1 >= 9 && res.resource1 <= 12) {
          fill(100, 50, 0);
          if (res.digLevel == 0) {
            t.rubber ++;
          }
        }
        rect(width /2 - 20, height - 20, 20, 20, 5);
        fill(255);
      }



      if (startFrameResourceHUD != 0 && frameCount < startFrameResourceHUD + 100) {

        if (res.resource2 >= 0 && res.resource2 <= 2) {
          fill(0, 200, 200);
          if (res.digLevel < 2) {
            t.diamonds ++;
          }
        }
        if (res.resource2 >= 3 && res.resource2 <= 5) {
          fill(255, 100, 0);
          if (res.digLevel < 2) {
            t.copper ++;
          }
        }
        if (res.resource2 >= 6 && res.resource2 <= 8) {
          fill(grey);
          if (res.digLevel < 2) {
            t.iron ++;
          }
        }
        if (res.resource2 >= 9 && res.resource2 <= 12) {
          fill(100, 50, 0);
          if (res.digLevel < 2) {
            t.rubber ++;
          }
        }
        rect(width /2 + 30, height - 20, 20, 20, 5);
        fill(255);
        res.digLevel = 2;
      } else if (startFrameResourceHUD != 0 && frameCount > startFrameResourceHUD + 100) {
        startFrameResourceHUD = 0;
      }

      if (t.GameState == "game") {
        startFrameResourceHUD = 0;
      }


      if (overCircle(width - 25, height - 25, 40) & mousePressed == true) {
        startFrameResourceHUD = frameCount;
      }
    }




    if (type == 1 && shape == "circles") {
      if (overCircle(width - 25, height - 25, 40) & mousePressed == true) {
        for (Printer p : printers) {
          if (loc.equals(p.loc) && p.blueTeam != 1 && t == Blue) {
            p.blueTeam = 1;
            t.money += 100;
            t.l.health += 100;
            t.l.health = constrain(t.l.health,0,1000);
          }
          if (loc.equals(p.loc) && p.blueTeam != 0 && t == Red) {
            p.blueTeam = 0;
            t.money += 100;
            t.l.health += 100;
            t.l.health = constrain(t.l.health,0,1000);
          }
        }
      }
    }
    
    
    
    if (type == 5 && shape == "circles") {
      if (overCircle(width - 25, height - 25, 40) & mousePressed == true) {
        med(t,loc);
      }
    }



    fill(white);

    if (overCircle(width - 25, height - 25, 40) & mousePressed == false) {
      fill(grey);
    }


    noStroke();
    ellipse(width - 35, height - 35, 40, 40);
    pushStyle();
    noFill();
    stroke(black);
    rect(width - 35, height - 35, 15, 15, 2);
    noStroke();
    pushStyle();
  }

  void addBoost(boost b) {
    boosts.add(b);
    d.boostData(b.d);
    mobility += b.d.mobilityCap;
  }
  void boostDisplay() {
    noStroke();
    int line = 0;
    if (boosts.size() != 0) {
      fill(dark);
      rectMode(CENTER);
      rect(loc.x + 50 + blockSize/2, loc.y - blockSize/2, 100, boosts.size() * 10 + 10, 5);
    }
    for (boost b : boosts) {
      fill(white);
      if (b.type == 1) {
        text("SpyGlasses", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 2) {
        text("Mobility", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
        
      }
      if (b.type == 3) {
        text("EnforcedArmour", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 4) {
        text("SuperCharger", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }

      if (b.type == 5) {
        text("SpyGlasses 2", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 6) {
        text("Mobility 2", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
        
      }
      if (b.type == 7) {
        text("EnforcedArmour 2", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 8) {
        text("SuperCharger 2", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }

      if (b.type == 9) {
        text("SpyGlasses 3", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 10) {
        text("Mobility 3", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 11) {
        
        text("EnforcedArmour 3", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 12) {
        text("SuperCharger 3", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }

      if (b.type == 13) {
        text("SpyGlasses 4", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 14) {
        text("Mobility 4", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 15) {
        
        text("EnforcedArmour 4", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      if (b.type == 16) {
        text("SuperCharger 4", loc.x + 50 + blockSize/2, loc.y - blockSize/2 - boosts.size() * 5 + line + 10);
      }
      line += 10;
    }
  }
}
