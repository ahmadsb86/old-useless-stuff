
class Team {


  //classes
  lab l;


  ArrayList<Shape> shapes = new ArrayList<Shape>();
  ArrayList<Generator> generators = new ArrayList<Generator>();

  //movement between blocks
  int selectI;

  //game
  String GameState = "game";
  int money;
  int diamonds = 0;
  int copper = 0;
  int iron = 0;
  int rubber = 0;                                                                           

  //flagging
  boolean FTboosting = true;
  boolean dispFire = false;

  //fire
  PVector fireS = new PVector();
  PVector fireE = new PVector();
  int t = 0;
  int FSF = 0;
  int SSF = 0;
  int damage;
  int GorL = 0;
  int ST = 0;
  Shape shrinker;
  Generator GTT;
  lab LTT;

  //misc
  Boolean sBlu;


  Team(Boolean side) {
    sBlu = side;
  }





  void run() {

    background(back);



    for (Barrier b : barriers) {
      b.display();
    }

    for (Printer p : printers) {
      p.display();
    }



    noFill();
    stroke(100);


    for (int i = 0; i < spotX; i ++) {
      for (int j = 0; j < spotY; j ++) {
        spot[i][j].setFog();
        spot[i][j].display();
      }
    }



    if (dispFire) {
      GameState = "firing";
      fill(0);
      stroke(0);
      strokeWeight(1);
      t = frameCount - FSF;
      fAnimate(fireE, fireS, t);
      if (t>100) {
        dispFire = false;
        shrinker.shrink = true;
        SSF = frameCount;
      }
    }

    if (sBlu == true) {
      for (Shape s : Red.shapes) {
        if (s.shrink) {
          int time = frameCount - SSF;
          s.d.armour -= 1;
          if (time >= damage - 1) {
            GameState = "game";
            FSF = 0;
            SSF = 0;
            s.shrink = false;
            damage = 0;
            if (s.maxH != 0) {
              s.d.acircle = int(map(s.d.armour, 0, s.maxH, 0, s.d.acircle));
              s.d.asquare = int(map(s.d.armour, 0, s.maxH, 0, s.d.asquare));
              s.d.astructure = int(map(s.d.armour, 0, s.maxH, 0, s.d.astructure));  //--------------------------------------------------------------------
            }
          }
        }
      }
    }
    if (sBlu == false) {
      for (Shape s : Blue.shapes) {
        if (s.shrink) {
          int time = frameCount - SSF;
          s.d.armour -= 1;
          if (time >= damage - 1) {
            GameState = "game";
            FSF = 0;
            SSF = 0;
            s.shrink = false;
            damage = 0;
            if (s.maxH != 0) {
              s.d.acircle = int(map(s.d.armour, 0, s.maxH, 0, s.d.acircle));
              s.d.asquare = int(map(s.d.armour, 0, s.maxH, 0, s.d.asquare));
              s.d.astructure = int(map(s.d.armour, 0, s.maxH, 0, s.d.astructure));   //--------------------------------------------------------------------
            }
          }
        }
      }
    }



    //fill(0, 0, 255);
    //noStroke();


    //display

    for (int i = 0; i < shapes.size(); i++) {
      Shape o = shapes.get(i);
      o.display();
    }


    for (int i = 0; i < Red.shapes.size(); i++) {
      Shape s = Red.shapes.get(i);
      if (spot[int(LocToSpot(s.loc).x)][int(LocToSpot(s.loc).y)].fog == false) {
        s.display();
      }
      if (overCircle(s.loc.x, s.loc.y, blockSize)) {
        fill(255);
        text("health: " + s.d.armour, width/2, height - 30);
        text("type: " + typeIndex(s.type, s.shape), width/2, height - 15);
      }
    }



    for (Generator g : Red.generators) {
      if (overCircle(g.loc.x + blockSize/2, g.loc.y + blockSize/2, blockSize*2)) {
        fill(255);
        text("health: " + g.health, width/2, height - 30);
        text("type: Generator", width/2, height - 15);
      }
    }
    if (overCircle(Red.l.loc.x + blockSize/2, Red.l.loc.y + blockSize/2, blockSize*2)) {
      fill(255);
      text("health: " + Red.l.health, width/2, height - 30);
      text("type: Lab", width/2, height - 15);
    }





    for (int i = 0; i < Blue.shapes.size(); i++) {
      Shape o = Blue.shapes.get(i);
      if (spot[int(LocToSpot(o.loc).x)][int(LocToSpot(o.loc).y)].fog == false) {
        o.display();
      }
      if (overCircle(o.loc.x, o.loc.y, blockSize)) {
        fill(white);
        text("health: " + o.d.armour, width/2, height - 30);
        text("type: " + typeIndex(o.type, o.shape), width/2, height - 15);
      }
    }


    for (Generator g : Blue.generators) {
      if (overCircle(g.loc.x + blockSize/2, g.loc.y + blockSize/2, blockSize*2)) {
        fill(255);
        text("health: " + g.health, width/2, height - 30);
        text("type: Generator", width/2, height - 15);
      }
    }
    if (overCircle(Blue.l.loc.x + blockSize/2, Blue.l.loc.y + blockSize/2, blockSize*2)) {
      fill(255);
      text("health: " + Blue.l.health, width/2, height - 30);
      text("type: Lab", width/2, height - 15);
    }






    if (GameState != "game") {
      for (Generator g : generators ) {
        if (g.shape == GameState) {
          g.showMenu();
        }
      }
    }





    if (GameState == "lab") {
      l.showMenu();
    }

    if (GameState != "circles" && GameState != "lab" && GameState != "squares" && GameState != "triangles") {
      l.display();
      if (sBlu) {
        if (spot[int(Red.l.loc.x/blockSize)][int(Red.l.loc.y/blockSize)].fog == false) {
          Red.l.display();
        }
      } else {
        if (spot[int(Blue.l.loc.x/blockSize) + 1][int(Blue.l.loc.y/blockSize)].fog == false && spot[int(Blue.l.loc.x/blockSize) + 1][int(Blue.l.loc.y/blockSize) + 1].fog == false) {
          Blue.l.display();
        }
      }
      for (Generator g : generators) {
        g.display();
      }

      if (sBlu) {
        for (Generator g : Red.generators) {
          if (spot[int(g.loc.x/blockSize)][int(g.loc.y/blockSize)].fog == false) {
            g.display();
          }
        }
      } else {
        for (Generator g : Blue.generators ) {
          if (spot[int((g.loc.x/blockSize) + 1)][int(g.loc.y/blockSize)].fog == false && spot[int((g.loc.x/blockSize) + 1)][int(g.loc.y/blockSize) + 1].fog == false) {
            g.display();
          }
        }
      }
    }




    for (int i = 0; i < Blue.generators.size(); i++) {
      Generator gen  = Blue.generators.get(i);
      if (gen.health < 1) {
        gen.t.generators.remove(gen);
      }
    }
    for (int i = 0; i < Red.generators.size(); i++) {
      Generator gen  = Red.generators.get(i);
      if (gen.health < 1) {
        gen.t.generators.remove(gen);
      }
    }











    for (Shape shap : shapes) {                                  
      if (shap.DAD && shap.hasShot == false) {                                         
        if (shap.t == Blue) {                                                              
          for (Shape o : Red.shapes) {                                                         
            if (o.d.armour - shap.d.acircle > 1) {                                             
              float tile = blockSize - blockOff;                                              
              noFill();                                                                        
              stroke(cyan);  
              strokeWeight(1);
              if (o.shape == "circles") {
                ellipse(o.loc.x, o.loc.y, map(o.d.armour - shap.d.acircle - 2, 0, o.maxH, tile/2, tile), map(o.d.armour - shap.d.acircle - 2, 0, o.maxH, tile/2, tile));
              }
              if (o.shape == "squares") {
                rect(o.loc.x, o.loc.y, map(o.d.armour - shap.d.asquare - 2, 0, o.maxH, tile/2, tile), map(o.d.armour - shap.d.asquare - 2, 0, o.maxH, tile/2, tile), 5);
              }
              if (o.shape == "triangles") {
                tri2(o.loc.x, o.loc.y, map(o.d.armour - shap.d.atriangle - 2, 0, o.maxH, tile/2, tile), map(o.d.armour - shap.d.atriangle - 2, 0, o.maxH, tile/2, tile));
              }
            } else {
              float tile = blockSize - blockOff;
              noFill();
              stroke(cyan);
              line(o.loc.x - tile/2, o.loc.y - tile/2, o.loc.x + tile/2, o.loc.y + tile/2);
              line(o.loc.x + tile/2, o.loc.y - tile/2, o.loc.x - tile/2, o.loc.y + tile/2);
            }
          }
        }
        if (shap.t == Red) {
          for (Shape o : Blue.shapes) {
            if (o.d.armour - shap.d.acircle > 1) {                                             
              float tile = blockSize - blockOff;                                              
              noFill();                                                                        
              stroke(cyan);  
              strokeWeight(1);
              if (o.shape == "circles") {
                ellipse(o.loc.x, o.loc.y, map(o.d.armour - shap.d.acircle - 2, 0, o.maxH, tile/2, tile), map(o.d.armour - shap.d.acircle - 2, 0, o.maxH, tile/2, tile));
              }
              if (o.shape == "squares") {
                rect(o.loc.x, o.loc.y, map(o.d.armour - shap.d.asquare - 2, 0, o.maxH, tile/2, tile), map(o.d.armour - shap.d.asquare - 2, 0, o.maxH, tile/2, tile), 5);
              }
              if (o.shape == "triangles") {
                tri2(o.loc.x, o.loc.y, map(o.d.armour - shap.d.atriangle - 2, 0, o.maxH, tile/2, tile), map(o.d.armour - shap.d.atriangle - 2, 0, o.maxH, tile/2, tile));
              }
            } else {
              float tile = blockSize - blockOff;
              noFill();
              stroke(cyan);
              line(o.loc.x - tile/2, o.loc.y - tile/2, o.loc.x + tile/2, o.loc.y + tile/2);
              line(o.loc.x + tile/2, o.loc.y - tile/2, o.loc.x - tile/2, o.loc.y + tile/2);
            }
          }
        }
      }
    }








    //boosting stage

    if (GameState == "boosting") {



      if (FTboosting == false) {
        fill(red);
        noStroke();
        rect(width /2, height - 20, 70, 20, 5);
        fill(255);
        text("boosting", width /2, height - 15);

        for (Shape s : shapes) {
          if (overCircle(s.loc.x, s.loc.y, blockSize) && mousePressed) {

            BoostEffect(this, l.select, s);
            println("----------------------------------------------------------------");
          }
        }
      } else {
        FTboosting = false;
      }
    }




    //boost display
    for (Shape o : shapes) {
      if (overCircle(o.loc.x, o.loc.y, blockSize)) {
        o.boostDisplay();
      }
    }


    // to select

    if (mousePressed && mouseButton == RIGHT && GameState == "game") {
      for (int i = 0; i < shapes.size(); i++) {
        Shape o = shapes.get(i);
        if (overCircle(o.loc.x, o.loc.y, blockSize - blockOff)) {
          selectI = i;
          GameState = "selected";
          o.selected();
        }
      }
      for (Generator g : generators) {
        if (GameState == "game" && overCircle(g.loc.x + blockSize/2, g.loc.y + blockSize/2, blockSize*2 - blockOff)) {
          GameState = g.shape;
        }
      }
      if (GameState == "game" && overCircle(l.loc.x + blockSize/2, l.loc.y + blockSize/2, blockSize*2 - blockOff)) {
        GameState = "lab";
      }
    }

    if (shapes.size() != 0) {
      Shape o = shapes.get(selectI);
      if (o.selected && ((o.type == 2  && o.shape == "circles") || (o.type == 5  && o.shape == "circles") ||(o.type == 1 && o.shape == "circles")  || (o.type == 2 && o.shape == "squares"))) {
        strokeWeight(1);
        o.ActivateButton();
      }
    }



    //when selected if we select a spot to move'
    if (shapes.size() != 0) {
      Shape o = shapes.get(selectI);
      if (mousePressed && mouseButton == LEFT) {
        if (GameState == "selected")
          for (int i = 0; i < spotX; i ++) {
            for (int j = 0; j < spotY; j ++) { 
              if ((mouseX > spot[i][j].loc.x - blockSize/2  && mouseX < spot[i][j].loc.x + blockSize/2) && (mouseY > spot[i][j].loc.y - blockSize/2 && mouseY < spot[i][j].loc.y + blockSize/2)) { 
                float dist = dist(spot[i][j].loc.x, spot[i][j].loc.y, o.loc.x, o.loc.y);
                if (dist < o.mobility) {
                  for (Printer p : printers) {
                    if ((!occupied(Blue, spot[i][j].loc) && !occupied(Red, spot[i][j].loc)) || (o.type == 1 && o.shape == "circles" && p.loc.equals(spot[i][j].loc))  || (o.type == 5 && o.shape == "triangles" && boc(spot[i][j].loc))) {
                      o.move(spot[i][j]);
                      o.mobility -= dist;
                      GameState = "game";
                      o.unselect();
                    } else {




                      if (sBlu == true && o.hasShot == false) {
                        for (Shape s : Red.shapes) {
                          if (s.loc == spot[i][j].loc) {
                            dispFire = true;
                            fireS.set(spot[i][j].loc);
                            fireE.set(o.loc);
                            if (s.shape == "circles") {
                              damage = o.d.acircle;
                            }
                            if (s.shape == "squares") {
                              damage = o.d.asquare;
                            }
                            if (s.shape == "triangles") {
                              damage = o.d.atriangle;
                            }
                            t = 0;
                            FSF = frameCount;
                            shrinker = s;
                            o.hasShot = true;
                          }
                        }
                      }

                      if (sBlu == false && o.hasShot == false) {
                        for (Shape s : Blue.shapes) {
                          if (s.loc == spot[i][j].loc) {
                            dispFire = true;
                            fireS.set(spot[i][j].loc);
                            fireE.set(o.loc);
                            if (s.shape == "circles") {
                              damage = o.d.acircle;
                            }
                            if (s.shape == "squares") {
                              damage = o.d.asquare;
                            }
                            if (s.shape == "triangles") {
                              damage = o.d.atriangle;
                            }
                            t = 0;
                            FSF = frameCount;
                            shrinker = s;
                            o.hasShot = true;
                          }
                        }
                      }



                      if (o.hasShot == false) {   
                        if (goc(enemy(this), spot[i][j].loc)) {
                          o.hasShot = true;
                          damage = o.d.astructure;
                          ST = frameCount;
                          if (GnotL_OC(enemy(this), spot[i][j].loc)) {
                            GorL = 1;
                            GTT = goloc(enemy(this), spot[i][j].loc);
                          } else {
                            GorL = -1;
                            LTT = enemy(this).l;
                          }
                        }
                      }



                      GameState = "game";
                      o.unselect();
                    }
                  }
                } else {
                  GameState = "game";
                  o.unselect();
                }
              }
            }
          }
      }
    }




    if (GorL == 1) {
      GameState = "firing";
      fill(0);
      stroke(0);
      strokeWeight(1);
      t = frameCount - ST;
      GTT.health -= 5;
      if (t>=damage/5) {
        GorL = 0;
        GameState = "game";
        damage = 0;
        t = 0;
      }
    }
    if (GorL == -1) {
      GameState = "firing";
      fill(0);
      stroke(0);
      strokeWeight(1);
      t = frameCount - ST;
      LTT.health -= 5;
      if (t>=damage/5) {
        GorL = 0;
        GameState = "game";
        damage = 0;
        t = 0;
      }
    }










    popMatrix();




    noStroke();


    // end section of draw

    fill(0, 200, 200);
    rect(100, height - 20, 20, 20, 5);
    fill(255);
    text(diamonds, 100, height - 15);

    fill(255, 100, 0);
    rect(130, height - 20, 20, 20, 5);
    fill(255);
    text(copper, 130, height - 15);

    fill(grey);
    rect(160, height - 20, 20, 20, 5);
    fill(255);
    text(iron, 160, height - 15);

    fill(100, 50, 0);
    rect(190, height - 20, 20, 20, 5);
    fill(255);
    text(rubber, 190, height - 15);






    //money

    fill(255);
    text(money, 100, height - 40);


    //next turn button


    PVector nextTurnButton = new PVector(40, height - 30);


    fill(white);

    if (overCircle(nextTurnButton.x, nextTurnButton.y, 50)) {
      if (mousePressed && released == true && GameState == "game") {
        resetTurn(this);
        released =   false;
      } else {
        fill(grey);
      }
    }




    strokeWeight(1);
    ellipse(nextTurnButton.x, nextTurnButton.y, 50, 50);
    fill(0);
    stroke(0);
    line(nextTurnButton.x - 5, nextTurnButton.y - 10, nextTurnButton.x + 5, nextTurnButton.y);
    line(nextTurnButton.x - 5, nextTurnButton.y + 10, nextTurnButton.x + 5, nextTurnButton.y);
    noStroke();
  }




  void setup_() {


    //testing shapes

    //for (int i = 0; i < 2; i ++) {
    //  shapes.add(new Shape(this, 1, 1, 1, "circles"));
    //  Shape o = shapes.get(i);
    //  o.move(spot[10 + i][10]);
    //}


    if (sBlu) {
      generators.add(new Generator(this, spot[int(spotMatrix.x) -3][1].loc.x, spot[1][2].loc.y, "circles"));
      l = new lab(this, spot[int(spotMatrix.x) -3][1].loc.x, spot[1][5].loc.y);
      generators.add(new Generator(this, spot[int(spotMatrix.x) -3][1].loc.x, spot[1][9].loc.y, "squares"));
      generators.add(new Generator(this, spot[int(spotMatrix.x) -3][1].loc.x, spot[1][12].loc.y, "triangles"));
    } else {
      generators.add(new Generator(this, spot[1][1].loc.x, spot[1][2].loc.y, "circles"));
      l = new lab(this, spot[1][1].loc.x, spot[1][5].loc.y);
      generators.add(new Generator(this, spot[1][1].loc.x, spot[1][9].loc.y, "squares"));
      generators.add(new Generator(this, spot[1][1].loc.x, spot[1][12].loc.y, "triangles"));
    }


    money = 500;
  }
}
