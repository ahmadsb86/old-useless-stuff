import controlP5.*; //<>//
import processing.sound.*;

ArrayList<Printer> printers = new ArrayList<Printer>();
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
PVector spotMatrix = new PVector(30, 16);  // 25,24  //30,16
int spotX = int(spotMatrix.x);
int spotY = int(spotMatrix.y);  
Spot[][] spot = new Spot[spotX][spotY]; 
int blockSize = 40;
int blockOff = 10;
PVector size = new PVector(1200, 700);
SoundFile file;
boolean released = true;   

Team Blue = new Team(true);
Team Red = new Team(false);

Boolean bTurn = true;

Mover m = new Mover(int(size.x/2), 150);
Mover web = new Mover(int(size.x/2 - 75), 175);
Mover exit = new Mover(int(size.x/2 + 75), 175);
boolean start = true;
PImage backl;




// The scale of our world
float zoom;
// A vector to store the offset from the center
PVector offset;
// The previous offset
PVector poffset;
// A vector for the mouse position
PVector mouse;







void setup() {

  cursor(3);

  textAlign(CENTER);

  PFont myFont = createFont("Arial", 10);

  size(1200, 700); // 1000,600

  //backl = loadImage("bacl.jpg");
  //backl.resize(int(size.x/2), int(size.x/2));
  //backl.resize(int(size.x), int(size.y));


  //create = new ControlP5(this);

  for (int i = 0; i < spotX; i ++) {
    for (int j = 0; j < spotY; j ++) {
      spot[i][j] = new Spot(Blue, i*blockSize + blockSize/2, j*blockSize + blockSize/2);
    }
  }


  //LETTER S
  barriers.add(new Barrier(spot[5][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[6][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[7][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[8][3].loc.x, spot[4][3].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[4][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[4][3].loc.x, spot[4][4].loc.y));
  barriers.add(new Barrier(spot[4][3].loc.x, spot[4][5].loc.y));
  barriers.add(new Barrier(spot[4][3].loc.x, spot[4][6].loc.y));
  barriers.add(new Barrier(spot[4][3].loc.x, spot[4][7].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[7][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[6][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[5][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[4][3].loc.x, spot[4][8].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[8][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[8][3].loc.x, spot[4][9].loc.y));
  barriers.add(new Barrier(spot[8][3].loc.x, spot[4][10].loc.y));
  barriers.add(new Barrier(spot[8][3].loc.x, spot[4][11].loc.y));
  barriers.add(new Barrier(spot[8][3].loc.x, spot[4][12].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[7][3].loc.x, spot[4][12].loc.y));
  barriers.add(new Barrier(spot[6][3].loc.x, spot[4][12].loc.y));
  barriers.add(new Barrier(spot[5][3].loc.x, spot[4][12].loc.y));
  barriers.add(new Barrier(spot[4][3].loc.x, spot[4][12].loc.y));
  //LETTER A
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][4].loc.y));
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][5].loc.y));
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][6].loc.y));
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][7].loc.y));
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][9].loc.y));
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][10].loc.y));
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][11].loc.y));
  barriers.add(new Barrier(spot[10][3].loc.x, spot[4][12].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[11][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[12][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[12][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[13][3].loc.x, spot[4][3].loc.y)); 
  //-----x-----x-----
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][4].loc.y));
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][5].loc.y));
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][6].loc.y));
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][7].loc.y));
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][9].loc.y));
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][10].loc.y));
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][11].loc.y));
  barriers.add(new Barrier(spot[14][3].loc.x, spot[4][12].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[11][3].loc.x, spot[4][7].loc.y));
  barriers.add(new Barrier(spot[12][3].loc.x, spot[4][7].loc.y));
  barriers.add(new Barrier(spot[12][3].loc.x, spot[4][7].loc.y));
  barriers.add(new Barrier(spot[13][3].loc.x, spot[4][7].loc.y)); 
  //LETTER V
  barriers.add(new Barrier(spot[16][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[16][3].loc.x, spot[4][4].loc.y));
  barriers.add(new Barrier(spot[16][3].loc.x, spot[4][5].loc.y));
  barriers.add(new Barrier(spot[16][3].loc.x, spot[4][6].loc.y));
  barriers.add(new Barrier(spot[16][3].loc.x, spot[4][7].loc.y));
  barriers.add(new Barrier(spot[16][3].loc.x, spot[4][8].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[17][3].loc.x, spot[4][9].loc.y));
  barriers.add(new Barrier(spot[17][3].loc.x, spot[4][10].loc.y));
  barriers.add(new Barrier(spot[17][3].loc.x, spot[4][11].loc.y));
  barriers.add(new Barrier(spot[18][3].loc.x, spot[4][12].loc.y));
  barriers.add(new Barrier(spot[19][3].loc.x, spot[4][9].loc.y));
  barriers.add(new Barrier(spot[19][3].loc.x, spot[4][10].loc.y));
  barriers.add(new Barrier(spot[19][3].loc.x, spot[4][11].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[20][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[20][3].loc.x, spot[4][4].loc.y));
  barriers.add(new Barrier(spot[20][3].loc.x, spot[4][5].loc.y));
  barriers.add(new Barrier(spot[20][3].loc.x, spot[4][6].loc.y));
  barriers.add(new Barrier(spot[20][3].loc.x, spot[4][7].loc.y));
  barriers.add(new Barrier(spot[20][3].loc.x, spot[4][8].loc.y));
  //LETTER E
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[23][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[24][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[25][3].loc.x, spot[4][3].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][3].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][4].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][5].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][6].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][7].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][9].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][10].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][11].loc.y));
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][12].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[23][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[24][3].loc.x, spot[4][8].loc.y));
  barriers.add(new Barrier(spot[25][3].loc.x, spot[4][8].loc.y));
  //-----x-----x-----
  barriers.add(new Barrier(spot[22][3].loc.x, spot[4][12].loc.y));
  barriers.add(new Barrier(spot[23][3].loc.x, spot[4][12].loc.y));
  barriers.add(new Barrier(spot[24][3].loc.x, spot[4][12].loc.y));
  barriers.add(new Barrier(spot[25][3].loc.x, spot[4][12].loc.y));






  //------------------------x---------------------x---------------------x---------------------x------------------x-------------------







  printers.add( new Printer(spot[9][2].loc.x, spot[10][2].loc.y) );
  printers.add( new Printer(spot[9][14].loc.x, spot[10][14].loc.y) );
  printers.add( new Printer(spot[20][2].loc.x, spot[10][2].loc.y) );
  printers.add( new Printer(spot[20][14].loc.x, spot[20][14].loc.y) );
  printers.add( new Printer(spot[15][2].loc.x, spot[15][2].loc.y) );
  printers.add( new Printer(spot[15][14].loc.x, spot[15][14].loc.y) );
  printers.add( new Printer(spot[15][8].loc.x, spot[15][8].loc.y) );

  Blue.setup_();
  Red.setup_();


  zoom = 1.0;
  offset = new PVector(-size.x/2, -size.y/2);
  poffset = new PVector(0, 0);


  //  file = new SoundFile(this, "bogus.mp3");
  //  file.loop(); 

  cursor(CROSS);
}


void draw() {
  
  println(Blue.GameState + " : " + Red.GameState);
  
  text(str(frameRate), 10, 10);
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  scale(zoom);
  translate(offset.x/zoom, offset.y/zoom);

  if (start) {
    fill(white);
    noStroke();
    rect(0, 0, width, height);
    //image(backl, 0, 0, size.x, size.y);
    textSize(52);
    fill(170, 0, 170);
    text("Shapes:            ", size.x/2 - 50, size.y/2 - 160);
    textSize(50);
    fill(255);
    //textSize(52);
    //fill(0);
    //text("Save Kashmir", size.x/2 + 50, size.y/2 - 100);
    fill(175, 200, 255);
    textSize(50);
    text("Save Kashmir", size.x/2 + 50, size.y/2 - 100);
    textSize(12);
    m.applyForce(new PVector(0, 0.1));
    m.update();
    m.display();
    exit.applyForce(new PVector(0, 0.1));
    exit.update();
    exit.display();
    web.applyForce(new PVector(0, 0.1));
    web.update();
    web.display();
    popMatrix();
  } else {
    if (bTurn) {
      Blue.run();
      if (Red.l.health < 1) {
        fill(dark);
        rect(size.x/2, size.y/2, size.x - 100, size.y - 100, 100);
        fill(255);
        textSize(100);
        text("Team Blue Wins", size.x/2, size.y/2);
        textSize(12);
      }
    } else {  
      Red.run();
      if (Blue.l.health < 1) {
        fill(dark);
        rect(100, 100, size.x - 100, size.y - 100);
        fill(255);
        textSize(50);
        text("Team Red Wins", size.x/2, 500);
      }
    }
  }
  fill(0, 0, 255);
  text(frameRate, 20, 10);
}
void mouseReleased() {
  released = true;
}
