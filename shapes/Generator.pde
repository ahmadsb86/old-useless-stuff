//buttons
//ControlP5 create;
//boolean DeadOut = true;

class Generator {

  PVector loc = new PVector();
  ArrayList<Shape> circles = new ArrayList<Shape>();

  int select = -1;
  Team t;
  int health = 1000;
  int maxHealth = 1000;
  String shape = "circles";
  color COL;
  int naughty = 0;


  Generator(Team t_, float x, float y, String SH) {

    t = t_;

    shape = SH;

    loc.set(x, y);
    for (int i = 0; i < 3; i ++) {
      for (int j = 0; j < 3; j ++) {
        circles.add(new Shape(t, 200 + (blockSize*2) * i, 200 + (blockSize*2) * j, i+j*3,shape));
      }
    }


    //create.addButton("create"). setValue(0).setPosition(size.x - 150, size.y - 150).setSize(50, 50);
    //create.hide();
  }
  void display() {
    noStroke();
    if (t == Blue) {
      fill(blue);
      COL = blue;
    } else {
      fill(red);
      COL = red;
    }
    float tile = blockSize*2 - blockOff;
    if (shape == "circles") {
      ellipse(loc.x + blockSize/2, loc.y + blockSize/2, map(health, 0, maxHealth, tile/2, tile), map(health, 0, maxHealth, tile/2, tile));
    }
    if (shape == "squares") {
      rect(loc.x + blockSize/2, loc.y + blockSize/2, map(health, 0, maxHealth, tile/2, tile), map(health, 0, maxHealth, tile/2, tile), 20);
    }
    if (shape == "triangles") {
      tri(loc.x + blockSize/2, loc.y + blockSize/2, map(health, 0, maxHealth, tile/2, tile), map(health, 0, maxHealth, tile/2, tile), COL);
    }
    //ellipse(loc.x +  blockSize/2, loc.y + blockSize/2, blockSize*2 - blockOff, blockSize*2 - blockOff);
  }
  void showMenu() {


    fill(dark);
    rect(size.x/2, size.y/2, size.x - 100, size.y - 100, 100);



    for (int i = 0; i < circles.size(); i++) {
      circles.get(i).alpha = 255;
      if (mousePressed && mouseX > circles.get(i).loc.x - blockSize/2 && mouseX < circles.get(i).loc.x + blockSize/2 && mouseY > circles.get(i).loc.y - blockSize/2 && mouseY < circles.get(i).loc.y + blockSize/2) { 
        select = i;
        released = false;
      }
      if (select != -1) {
        circles.get(select).alpha = 100;
        fill(white);
        textSize(50);
        text(typeIndex(circles.get(select).type,shape), width - 300, 200);
        textSize(16);
        text("cost: " + circles.get(select).d.cost, width - 300, 300);
        text("scout: " + circles.get(select).d.scout/blockSize, width - 300, 320);
        text("mobility: " + circles.get(select).d.mobilityCap/blockSize, width - 300, 340);
        text("armour: " + circles.get(select).d.armour, width - 300, 360);
        text("against circles: " + circles.get(select).d.acircle, width - 300, 380);
        text("against squares: " + circles.get(select).d.asquare, width - 300, 400);
        text("against triangles: " + circles.get(select).d.atriangle, width - 300, 420);
        text("against structure : " + circles.get(select).d.astructure, width - 300, 440);
        textSize(12);
      }
      noStroke();
      circles.get(i).display();
    }


    //      Create and cancel buttons


    PVector button = new PVector(size.x - 110, size.y - 110);
    PVector cancel = new PVector(size.x - 170, size.y - 110);



    //create
    fill(255);
    noStroke(); 
    if (overCircle(button.x, button.y, 50)) {
      if (mousePressed) {
        if (select == -1) {
          return;
        }
        if(t == Blue){
          naughty = -1;
        }
        if(t == Red){
          naughty = 2;
        }
        if (!occupied(t, spot[int(loc.x / blockSize + naughty)][int(loc.y / blockSize)].loc) && !occupied(enemy(t), spot[int(loc.x / blockSize + naughty)][int(loc.y / blockSize)].loc) && t.money >= circles.get(select).d.cost) {
          t.shapes.add(new Shape(t, 1, 1, circles.get(select).type,shape));
          Shape o = t.shapes.get(t.shapes.size() - 1);
          if (t == Blue) {
            o.move(spot[int(loc.x / blockSize - 1)][int(loc.y / blockSize)]);
            o.d.armour = int(map(health, 0, maxHealth, 0, o.maxH));
            if (o.maxH != 0) {
              o.d.acircle = int(map(o.d.armour, 0, o.maxH, 0, o.d.acircle));
            }
          } else {
            o.move(spot[int(loc.x / blockSize + 2)][int(loc.y / blockSize)]);
            o.d.armour = int(map(health, 0, maxHealth, 0, o.maxH));
            if (o.maxH != 0) {
              o.d.acircle = int(map(o.d.armour, 0, o.maxH, 0, o.d.acircle));
            }
          }
          t.money -= o.d.cost;
          t.GameState = "game";
        }
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
        select = -1;
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
